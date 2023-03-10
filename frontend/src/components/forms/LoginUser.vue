<script setup>
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

import { useAlertStore, useAuthStore } from '@/stores';
import { router } from '@/router';

const schema = Yup.object().shape({
  email: Yup.string().email().required('Email is required'),
  password: Yup.string().required('Password is required')
})

async function onSubmit(values) {
  const authStore = useAuthStore();
  const alertStore = useAlertStore();
  const { username, password } = values;
  try {
    await authStore.login(username, password);
    await router.push('/');
  } catch (err) {
    alertStore.error(err);
  }
}
</script>

<template>
  <v-card
    class="form-container"
    title="Login"
    variant="outlined"
  >
    <v-card-item>
      <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
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
        <div class="btn-container">
          <button class="btn btn-primary" :disabled="isSubmitting">
              <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
              Login
          </button>
          <router-link to="register" class="btn btn-link">Register</router-link>
        </div>
      </Form>
    </v-card-item>
  </v-card>
</template>