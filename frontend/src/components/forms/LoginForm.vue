<template>
  <v-container>
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
            <div class="right-align">
              Don't have an account?<br />
              <router-link to="register">Register Here</router-link>
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

import { useAuthStore } from '@/store';
import { Login } from "@/models/user.model";

const schema = Yup.object().shape({
  email: Yup.string().email().required('Email is required.'),
  password: Yup.string().required('Password is required.')
})

async function onSubmit(values: Login) {
  const authStore = useAuthStore();
  await authStore.login(values);
}
</script>