<script setup>
import { ref } from 'vue';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import { CButton, CForm, CFormInput, CFormTextarea } from "@coreui/vue";
// import { useAlertStore, useAuthStore, useUsersStore } from "@/stores";

const date = ref(new Date());

async function createEvent(event) {
  event.preventDefault();
  console.log({ event });
}
</script>

<template>
  <div id="event-form">
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
          />
        </div>
        <div class="submit-btn-container">
          <CButton type="submit" color="primary"> Create Event </CButton>
        </div>
      </CForm>
    </div>
  </div>
</template>