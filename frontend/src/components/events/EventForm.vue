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
        <!-- <div>
          <Field v-slot="{ privateField }" name="terms" type="checkbox" :value="true">
            <label class="form-checkbox-container">
              <input type="checkbox" name="terms" v-bind="privateField" :value="true" />
              Private
            </label>
          </Field>
        </div> -->
        <div>
          <label>Start Date</label><br />
          <VueDatePicker
            class="date-field"
            v-model="start_date"
            :min-date="minDate"
            :max-date="maxDate"
            :enable-time-picker="false"
            :teleport="true"
          >
          </VueDatePicker>
        </div>
        <div v-show="!add_end_date">
          <v-btn
            @click="add_end_date = !add_end_date"
            variant="text"
          >
            <v-icon size="22px" icon="mdi:mdi-plus-box" />
            Add End Date
          </v-btn>
        </div>
        <div v-show="add_end_date">
          <label>End Date</label><br />
          <VueDatePicker
            class="date-field"
            v-model="end_date"
            :min-date="start_date"
            :max-date="maxDate"
            :enable-time-picker="false"
            :teleport="true"
          />

          <v-btn
            @click="add_end_date = !add_end_date"
            variant="text"
          >
            <v-icon size="22px" icon="mdi:mdi-minus-box" />
            Remove End Date
          </v-btn>
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
import * as Yup from 'yup';

import { getSubmitFn } from '@/helpers';
import { useEventStore } from '@/store';

// General form data
var add_end_date = ref(false);
var start_date = ref(new Date());
var end_date = ref();
const minDate = new Date();
let maxDate = new Date((new Date()).setFullYear(minDate.getFullYear() + 1));
var eventInfo = {
  btnText: 'Create Event',
  description: '',
  event_title: '',
  formTitle: 'Create Event'
}

// Editing Event
const props = defineProps({
  uid: String
});
const { uid } = toRefs(props);
const editUid = uid?.value;

const addDateToDay = (event) => {
  return new Date(event.setDate(event.getDate() + 1));
}

if (editUid) {
  const eventStore = useEventStore();
  eventStore.getEventById(editUid);
  const { stagedEvent } = storeToRefs(eventStore);
  const eventValue = stagedEvent.value;

  // Set Start Date
  const stagedStart = new Date(eventValue.start_date);
  const startPlusOne = addDateToDay(stagedStart);
  start_date = ref(startPlusOne);

  // If End Date
  if (eventValue.end_date) {
    add_end_date.value = true;
    const stagedEnd = new Date(eventValue.end_date);
    const endPlusOne = addDateToDay(stagedEnd);
    end_date = ref(endPlusOne);
  }

  var editEventInfo = {
    btnText: 'Update Event',
    description: eventValue.description,
    event_title: eventValue.event_title,
    formTitle: 'Edit Event'
  }

  eventInfo = editEventInfo;
}

const schema = Yup.object().shape({
  event_title: Yup.string().required('Event title is required.'),
  description: Yup.string().nullable().notRequired(),
  start_date: Yup.object(),
  end_date: Yup.object().nullable()
})

const onSubmit = getSubmitFn(schema, async (values) => {
  const eventStore = useEventStore();
  try {
    values.start_date = start_date.value;

    if (add_end_date.value && end_date.value) {
      values.end_date = end_date.value;
    } else {
      values.end_date = null;
    }

    if (editUid) {
      eventStore.updateEvent(editUid, values as Event);
    } else {
      eventStore.createEvent(values as Event);
    }
  } catch (err) {
    console.log(err);
  }
})
</script>