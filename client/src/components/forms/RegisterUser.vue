<script setup>
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

import { useUsersStore, useAlertStore } from '@/stores';
import { router } from '@/router';

const schema = Yup.object().shape({
  firstName: Yup.string().required('First Name is required.'),
  lastName: Yup.string().required('Last Name is required.'),
  username: Yup.string().required('Username is required.'),
  email: Yup.string().email().required('Email is required.'),
  password: Yup.string().required('Password is required.')
      .min(6, 'Password must be at least 6 characters'),
  passwordConfirm: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match.')
})

async function onSubmit(values) {
  const usersStore = useUsersStore();
  const alertStore = useAlertStore();
  try {
    await usersStore.register(values);
    await router.push('/account/login');
    alertStore.success('Registration Successful');
  } catch (err) {
    alertStore.error(err);
  }
}
</script>

<template>
  <v-card 
    class="form-container"
    title="Registration"
    variant="outlined"
  >
      <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
        <div>
          <label>First Name:</label><br />
          <Field name="firstName" type="text" class="form-control" :class="{ 'is-invalid': errors.firstName }" />
          <div class="invalid-feedback">{{ errors.firstName }}</div>
        </div>
        <div>
          <label>Last Name:</label><br />
          <Field name="lastName" type="text" class="form-control" :class="{ 'is-invalid': errors.lastName }" />
          <div class="invalid-feedback">{{ errors.lastName }}</div>
        </div>
        <div>
          <label>Username:</label><br />
          <Field name="username" type="text" class="form-control" :class="{ 'is-invalid': errors.username }" />
          <div class="invalid-feedback">{{ errors.username }}</div>
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
          <Field name="passwordConfirm" type="password" class="form-control" :class="{ 'is-invalid': errors.passwordConfirm }" />
          <div class="invalid-feedback">{{ errors.passwordConfirm }}</div>
        </div>
        <div class="btn-container">
          <button class="btn btn-primary" :disabled="isSubmitting">
              <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
              Register
          </button>
          <router-link to="login" class="btn btn-link">Cancel</router-link>
        </div>
      </Form>
  </v-card>
</template>