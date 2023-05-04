<template>
  <v-container>
    <v-card
      class="form-container"
      title="Register"
      variant="outlined"
    >
      <v-card-item>
        <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
          <div>
            <label>First Name:</label>
            <Field name="first_name" type="text" class="form-control" :class="{ 'is-invalid': errors.first_name }" />
            <div class="invalid-feedback">{{ errors.first_name }}</div>
          </div>
          <div>
            <label>Last Name:</label>
            <Field name="last_name" type="text" class="form-control" :class="{ 'is-invalid': errors.last_name }" />
            <div class="invalid-feedback">{{ errors.last_name }}</div>
          </div>
          <div>
            <label>Username:</label>
            <Field name="preferred_username" type="text" class="form-control" :class="{ 'is-invalid': errors.preferred_username }" />
            <div class="invalid-feedback">{{ errors.preferred_username }}</div>
          </div>
          <div>
            <label>Email:</label><br />
            <Field name="email" type="text" class="form-control" :class="{ 'is-invalid': errors.email }" />
            <div class="invalid-feedback">{{ errors.email }}</div>
          </div>
          <div>
            <label>Password:</label><br />
            <Field name="password" type="password" class="form-control" :class="{ 'is-invalid': errors.password }" />
            <div class="invalid-feedback">{{ errors.password }}</div>
          </div>
          <div>
            <label>Confirm Password:</label><br />
            <Field name="confirm_password" type="password" class="form-control" :class="{ 'is-invalid': errors.confirm_password }" />
            <div class="invalid-feedback">{{ errors.confirm_password }}</div>
          </div>
          <div class="btn-container">
            <button class="btn btn-primary" :disabled="isSubmitting">
                <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
                Submit
            </button>
            <div class="right-align">
              <router-link to="login" class="btn btn-link">Cancel</router-link>
            </div>
          </div>
        </Form>
      </v-card-item>
    </v-card>
  </v-container>
</template>

<script setup lang="ts">
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

const schema = Yup.object().shape({
  first_name: Yup.string().required('First name is required.'),
  last_name: Yup.string().required('Last name is required.'),
  preferred_username: Yup.string().required('Username is required.'),
  email: Yup.string().email().required('Email is required.'),
  password: Yup.string().required('Password is required.')
      .min(6, 'Password must be at least 6 characters.'),
  confirm_password: Yup.string().required('Confirm password.')
    .oneOf([Yup.ref('password')], 'Your passwords do not match.')
})

async function onSubmit(values: Object) {
  console.log(values);
}
</script>