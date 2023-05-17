<template>
  <v-card
    class="form-container"
    :title="eventInfo.formTitle"
    variant="outlined"
  >
    <Form
      @submit="onSubmit"
      v-slot="{ isSubmitting }"
      :initial-values="eventInfo"
    >
      <v-card-item class="event-form">
        <div>
          <label>Title</label>
          <Field name="event_title" type="text" class="form-control" />
        </div>
        <div>
          <label>Start Date</label><br />
          <VueDatePicker
            class="date-field"
            v-model="eventInfo.start_date"
            :min-date="minDate"
            :max-date="maxDate"
            :enable-time-picker="false"
          >
          </VueDatePicker>
        </div>
        <div>
          <label>Description</label>
          <Field name="description" type="textarea" class="form-control" />
        </div>
        <div class="btn-container">
          <button class="btn btn-primary submit-btn" :disabled="isSubmitting">
              <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
              {{ eventInfo.btnText }}
          </button>
        </div>
      </v-card-item>
    </Form>
  </v-card>
</template>

<script lang="ts" setup>
import { ref, toRefs } from 'vue'
import { storeToRefs } from 'pinia';
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import { Event } from '@/models/event.model';
import { Field, Form } from 'vee-validate';
// import * as Yup from 'yup';

import { useEventStore } from '@/store';

const props = defineProps({
  uid: String
});
const { uid } = toRefs(props);
const editUid = uid?.value;

const new_start_date = new Date();
const minDate = new Date();
const maxDate = (new Date()).setFullYear(minDate.getFullYear() + 1).toLocaleString()

var eventInfo = {
  btnText: 'Create Event',
  description: '',
  event_title: '',
  formTitle: 'Create Event',
  start_date: new_start_date
}

if (editUid) {
  const eventStore = useEventStore();
  eventStore.getEventById(editUid);
  const { stagedEvent } = storeToRefs(eventStore);
  const eventValue = stagedEvent.value;
  const stagedStart = new Date(eventValue.start_date);
  const addDay = new Date(stagedStart.setDate(stagedStart.getDate() + 1));


  var editEventInfo = {
    btnText: 'Update Event',
    description: eventValue.description,
    event_title: eventValue.event_title,
    formTitle: 'Edit Event',
    start_date: addDay
  }

  eventInfo = editEventInfo;
}

const start_date = ref(eventInfo.start_date);

async function onSubmit(values: Event) {
  const eventStore = useEventStore();
  values.start_date = start_date.value;
  eventStore.createEvent(values);
}
</script>