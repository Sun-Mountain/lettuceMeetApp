<template>
  <v-container>
    <v-card
      class="form-container"
      title="Change Password"
      variant="outlined"
    >
      <v-card-item>
        <Form
          @submit="onSubmit"
          :validation-schema="schema" 
          v-slot="{ errors, isSubmitting }"
        >
          <div>
            <label>Current Password:</label>
            <Field
              name="current_password"
              type="password"
              class="form-control"
              :class="{ 'is-invalid': errors.current_password }"
            />
            <div class="invalid-feedback">{{ errors.current_password }}</div>
          </div>
          <div>
            <label>New Password:</label>
            <Field
              name="password"
              type="password"
              class="form-control"
              :class="{ 'is-invalid': errors.password }"
            />
            <div class="invalid-feedback">{{ errors.password }}</div>
          </div>
          <div>
            <label>Confirm New Password:</label>
            <Field
              name="confirm_password"
              type="password"
              class="form-control"
              :class="{ 'is-invalid': errors.confirm_password }"
            />
            <div class="invalid-feedback">{{ errors.confirm_password }}</div>
          </div>
          <div class="btn-container">
            <button class="btn btn-primary submit-btn" :disabled="isSubmitting">
              <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
              Change Password
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

const schema = Yup.object().shape({
  current_password: Yup.string().required('Current password is required.'),
  password: Yup.string().required('Password is required.')
      .min(6, 'Password must be at least 6 characters.'),
  confirm_password: Yup.string().required('Confirm password.')
    .oneOf([Yup.ref('password')], 'Your passwords do not match.')
})

async function onSubmit() {
  console.log("YEP")
}
</script>