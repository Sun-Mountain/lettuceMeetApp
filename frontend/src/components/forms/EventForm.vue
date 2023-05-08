<template>
  <v-card
    class="form-container"
    :title="eventInfo.formTitle"
    variant="outlined"
  >
    <Form
      @submit="onSubmit"
    >
      <v-card-item>
        <div>
          <label>Title</label>
          <Field name="eventTitle" type="text" class="form-control" />
        </div>
        <div>
          <label>Description</label>
          <Field name="description" type="textarea" class="form-control" />
        </div>
      </v-card-item>
    </Form>
  </v-card>
</template>

<script lang="ts" setup>
import { Field, Form } from 'vee-validate';
import * as Yup from 'yup';

var eventInfo = {
  formTitle: 'Create Event',
  btnText: 'Create Event'
}

async function onSubmit() {
  console.log("LOL")
}
</script>