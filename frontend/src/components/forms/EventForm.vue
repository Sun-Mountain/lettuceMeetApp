<script setup>
import { ref } from "vue";
import VueDatePicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
import { CButton, CForm, CFormInput, CFormTextarea } from "@coreui/vue";
import { useAlertStore, useEventStore } from "@/stores";
import { router } from "@/router";
</script>
<template>
  <div id="event-form">
    {{ user }}
    <h3>Create an Event</h3>
    <div>
      <CForm @submit="createEvent">
        <div class="form-group">
          <CFormInput
            class="form-control"
            id="EventTitle"
            label="Title"
            name="title"
            type="text"
            v-model="EventTitle"
          />
        </div>
        <div>
          <label class="form-label" for="StartDate">Start Date</label>
          <VueDatePicker
            id="StartDate"
            v-model="date"
            :enable-time-picker="false"
            :min-date="new Date()"
          />
        </div>
        <div class="form-group">
          <CFormTextarea
            class="form-control"
            id="EventDetails"
            label="Event Details"
            name="details"
            rows="3"
            type="text"
            v-model="EventDetails"
          />
        </div>
        <div class="submit-btn-container">
          <CButton type="submit" color="primary"> Create Event </CButton>
        </div>
      </CForm>
    </div>
  </div>
</template>

<script>
const date = ref(new Date());

let EventTitle,
  EventDetails,
  StartDate = date.value;

export default {
  props: ["user"],
  data: function () {
    return { currentUser: this.user.id };
  },
  methods: {
    async createEvent(event) {
      event.preventDefault();
      let data = {
        title: EventTitle,
        body: EventDetails,
        start_date: StartDate,
        user_id: this.currentUser,
      };

      const eventStore = useEventStore();
      const alertStore = useAlertStore();

      console.log(data);

      try {
        await eventStore.createEvent(data);
        await router.push("/events");
        alertStore.success("Event created");
      } catch (error) {
        alertStore.error(error);
      }
    },
  },
};
</script>
