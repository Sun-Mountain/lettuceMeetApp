<template>
  <v-container>
    <v-card
      class="form-container danger-header"
      title="Delete Account"
      variant="outlined"
    >
      <v-card-item>
        <Form
          @submit="onSubmit"
          v-slot="{ isSubmitting }"
        >
          <div>
            <label>Current Password:</label>
            <Field
              name="current_password"
              type="password"
              class="form-control"
            />
          </div>
          <div class="btn-container">
            <button class="btn btn-primary danger" :disabled="isSubmitting">
              <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
              Delete Account
            </button>
          </div>
        </Form>
      </v-card-item>
    </v-card>
  </v-container>
</template>

<script lang="ts" setup>
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

async function onSubmit() {
  console.log("DELETED")
}
</script>