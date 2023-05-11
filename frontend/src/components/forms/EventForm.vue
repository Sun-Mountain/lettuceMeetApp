<template>
  <v-card
    class="form-container"
    :title="eventInfo.formTitle"
    variant="outlined"
  >
    <Form
      @submit="onSubmit"
      v-slot="{ isSubmitting }"
    >
      <v-card-item class="event-form">
        <div>
          <label>Title</label>
          <Field name="event_title" type="text" class="form-control" />
        </div>
        <div>
          <label>Start Date</label><br />
          <VueDatePicker
            v-model="date"
            :min-date="minDate"
            :max-date="maxDate"
            :enable-time-picker="false">
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
import { ref } from 'vue'
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'
import { Field, Form } from 'vee-validate';
import * as Yup from 'yup';

const date = ref(new Date());
const minDate = new Date()
const maxDate = (new Date()).setFullYear(minDate.getFullYear() + 1)

var eventInfo = {
  formTitle: 'Create Event',
  btnText: 'Create Event'
}


async function onSubmit() {
  console.log("LOL")
}
</script>