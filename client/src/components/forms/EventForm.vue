<script setup>
import { ref, toRefs } from 'vue';
import { storeToRefs } from 'pinia';
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

import { useAlertStore, useEventStore } from '@/stores';

const eventStore = useEventStore();

const props = defineProps({
  uid: String
});
const { uid } = toRefs(props);
const editUid = uid.value;

var eventInfo = {
  formTitleTxt: 'Create Event',
  btnTxt: 'Create Event'
};

(function ifEditing () {
  if (editUid) {
    eventStore.getEventById(editUid);
    const { stagedEvent } = storeToRefs(eventStore);
    const eventValue = stagedEvent.value;

    var newEventInfo = {
      description: eventValue.description,
      eventTitle: eventValue.eventTitle,
      startDate: eventValue.startDate,
      formTitleTxt: `Edit ${eventValue.eventTitle}`,
      btnTxt: 'Save Event'
    }

    return eventInfo = newEventInfo;
  }
})();

const formTitle = eventInfo.formTitleTxt;
const BtnText = eventInfo.btnTxt;

const startDate = ref(eventInfo.startDate);

const schema = Yup.object().shape({
  eventTitle: Yup.string().required('Title required.')
})

async function onSubmit(values) {
  const eventStore = useEventStore();
  const alertStore = useAlertStore();
  values.startDate = startDate.value;
  try {
    if (editUid) {
      eventStore.updateEvent(editUid, values);
    } else {
      eventStore.createEvent(values);
    }
  } catch (err) {
    alertStore.error(err);
  }
}
</script>

<template>
  <v-card
    class="form-container"
    :title="formTitle"
    variant="outlined"
  >
    <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }" :initial-values="eventInfo">
      <div>
        <label>Title</label>
        <Field name="eventTitle" type="text" class="form-control" :class="{ 'is-invalid': errors.eventTitle }" />
        <div class="invalid-feedback">{{ errors.eventTitle }}</div>
      </div>
      <div>
        <label>Start Date</label>
        <VueDatePicker v-model="startDate" :min-date="new Date()" :enable-time-picker="false" name="startDate" />
      </div>
      <div>
        <label>Description</label>
        <Field name="description" type="textarea" class="form-control" />
      </div>
      <div class="btn-container">
        <button class="btn btn-primary" :disabled="isSubmitting">
            <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
            {{ BtnText }}
        </button>
      </div>
    </Form>
  </v-card>
</template>