<script setup>
import { ref } from 'vue';
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

import { useAlertStore, useEventStore } from '@/stores';
// import { router } from '@/router';

const startDate = ref();

const schema = Yup.object().shape({
  eventTitle: Yup.string().required('Title required.'),
})

async function onSubmit(values) {
  const eventStore = useEventStore();
  const alertStore = useAlertStore();
  values.startDate = startDate.value;
  try {
    console.log(values);
    eventStore.createEvent(values);
  } catch (err) {
    alertStore.error(err);
  }
}
</script>

<template>
  <v-card
    class="form-container"
    title="Create Event"
    variant="outlined"
  >
    <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
      <div>
        <label>Title</label>
        <Field name="eventTitle" type="text" class="form-control" :class="{ 'is-invalid': errors.eventTitle }" />
        <div class="invalid-feedback">{{ errors.eventTitle }}</div>
      </div>
      <div>
        <label>Start Date</label>
        <VueDatePicker v-model="startDate" :min-date="new Date()" :enable-time-picker="false" />
      </div>
      <div>
        <label>Description</label>
        <Field name="description" type="textarea" class="form-control" />
      </div>
      <div class="btn-container">
        <button class="btn btn-primary" :disabled="isSubmitting">
            <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
            Create Event
        </button>
      </div>
    </Form>
  </v-card>
</template>