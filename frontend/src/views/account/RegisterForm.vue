<script setup>
// import { Form, Field } from "vee-validate";
import * as Yup from "yup";

import { useUsersStore, useAlertStore } from "@/stores";
import { router } from "@/router";

const schema = Yup.object().shape({
  first_name: Yup.string().required("First Name is required"),
  last_name: Yup.string().required("Last Name is required"),
  user_name: Yup.string().required("Username is required"),
  email: Yup.string().required("Email is required"),
  password: Yup.string()
    .required("Password is required")
    .min(6, "Password must be at least 6 characters"),
  password_confirmation: Yup.string().required(
    "Password confrimationis required"
  ),
});

async function onSubmit(values) {
  const usersStore = useUsersStore();
  const alertStore = useAlertStore();
  try {
    await usersStore.register(values);
    await router.push("/account/login");
    alertStore.success("Registration successful");
  } catch (error) {
    alertStore.error(error);
  }
}
</script>

<template>
  <div>
    <h4>Register</h4>
    <div>
      <Form
        @submit="onSubmit"
        :validation-schema="schema"
        v-slot="{ errors, isSubmitting }"
      >
        <div class="form-group">
          <label>First Name</label>
          <Field
            name="first_name"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.first_name }"
          />
          <div class="invalid-feedback">{{ errors.first_name }}</div>
        </div>
        <div class="form-group">
          <label>Last Name</label>
          <Field
            name="last_name"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.last_name }"
          />
          <div class="invalid-feedback">{{ errors.last_name }}</div>
        </div>
        <div class="form-group">
          <label>Username</label>
          <Field
            name="user_name"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.user_name }"
          />
          <div class="invalid-feedback">{{ errors.user_name }}</div>
        </div>
        <div class="form-group">
          <label>Email</label>
          <Field
            name="email"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.email }"
          />
          <div class="invalid-feedback">{{ errors.email }}</div>
        </div>
        <div class="form-group">
          <label>Password</label>
          <Field
            name="password"
            type="password"
            class="form-control"
            :class="{ 'is-invalid': errors.password }"
          />
          <div class="invalid-feedback">{{ errors.password }}</div>
        </div>
        <div class="form-group">
          <label>Password Confirmation</label>
          <Field
            name="password_confirmation"
            type="password"
            class="form-control"
            :class="{ 'is-invalid': errors.password_confirmation }"
          />
          <div class="invalid-feedback">{{ errors.password_confirmation }}</div>
        </div>
        <div class="buttons-container">
          <button class="btn btn-primary" :disabled="isSubmitting">
            <span
              v-show="isSubmitting"
              class="spinner-border spinner-border-sm mr-1"
            ></span>
            Register
          </button>
          <router-link to="login" class="btn btn-link">Cancel</router-link>
        </div>
      </Form>
    </div>
  </div>
</template>
