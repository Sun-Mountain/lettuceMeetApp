<script setup>
import { ref, toRefs } from 'vue';
import { storeToRefs } from 'pinia';
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

import { useUsersStore, useAlertStore } from '@/stores';
import { router } from '@/router';

const props = defineProps({
  user: Object
})
const { user } = toRefs(props);
const currentUser = user.value;

const isEditing = currentUser ? true : false;
const formTitle = isEditing ? 'Edit Account' : 'Registration';
const btnText = isEditing ? 'Update' : 'Register';
const firstNameValue = isEditing ? currentUser.first_name : '';
const lastNameValue = isEditing ? currentUser.last_name : '';
const usernameValue = isEditing ? currentUser.preferred_username : '';
const emailValue = isEditing ? currentUser.email : '';

const registerSchema = Yup.object().shape({
  first_name: Yup.string().required('First Name is required.'),
  last_name: Yup.string().required('Last Name is required.'),
  username: Yup.string().required('Username is required.'),
  email: Yup.string().email().required('Email is required.'),
  password: Yup.string().required('Password is required.')
      .min(6, 'Password must be at least 6 characters'),
  passwordConfirm: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match.')
})

const editAccountSchema = Yup.object().shape({
  first_name: Yup.string().required('First Name is required.'),
  last_name: Yup.string().required('Last Name is required.'),
  username: Yup.string().required('Username is required.'),
  email: Yup.string().email().required('Email is required.'),
  current_password: Yup.string().required('Current password is required.'),
  password: Yup.string().min(6, 'Password must be at least 6 characters'),
  passwordConfirm: Yup.string().oneOf([Yup.ref('password'), null], 'Passwords must match.')
})

const schema = isEditing ? editAccountSchema : registerSchema;

async function onSubmit(values) {
  const usersStore = useUsersStore();
  const alertStore = useAlertStore();
  try {
    if (isEditing) {
      await usersStore.updateAccount(values, currentUser.id);
      await router.push('/account');
      alertStore.success('Account Update Successful');
    } else {
      await usersStore.register(values);
      await router.push('/');
      alertStore.success('Registration Successful');
    }
  } catch (err) {
    alertStore.error(err);
  }
}
</script>

<template>
  <v-card 
    class="form-container"
    :title="formTitle"
    variant="outlined"
  >
      <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
        <div>
          <label>First Name:</label><br />
          <Field
            name="first_name"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.first_name }"
            :value="firstNameValue"
          />
          <div class="invalid-feedback">{{ errors.first_name }}</div>
        </div>
        <div>
          <label>Last Name:</label><br />
          <Field
            name="last_name"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.last_name }"
            :value="lastNameValue"
          />
          <div class="invalid-feedback">{{ errors.last_name }}</div>
        </div>
        <div>
          <label>Username:</label><br />
          <Field
            name="username"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.username }"
            :value="usernameValue"
          />
          <div class="invalid-feedback">{{ errors.username }}</div>
        </div>
        <div>
          <label>Email:</label><br />
          <Field
            name="email"
            type="text"
            class="form-control"
            :class="{ 'is-invalid': errors.email }"
            :value="emailValue"
          />
          <div class="invalid-feedback">{{ errors.email }}</div>
        </div>
        <div v-if="isEditing">
          <label>Current Password:</label><br />
          <Field name="current_password" type="password" class="form-control" :class="{ 'is-invalid': errors.current_password }" />
          <div class="invalid-feedback">{{ errors.current_password }}</div>
        </div>
        <div v-if="isEditing">
          <br />
          <h3>Change Password:</h3>
        </div>
        <div>
          <label>Password:</label><br />
          <Field name="password" type="password" class="form-control" :class="{ 'is-invalid': errors.password }" />
          <div class="invalid-feedback">{{ errors.password }}</div>
        </div>
        <div>
          <label>Confirm Password:</label><br />
          <Field name="password_confirmation" type="password" class="form-control" :class="{ 'is-invalid': errors.password_confirmation }" />
          <div class="invalid-feedback">{{ errors.password_confirmation }}</div>
        </div>
        <div class="btn-container">
          <button class="btn btn-primary" :disabled="isSubmitting">
              <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
              {{ btnText }}
          </button>
          <router-link to="login" class="btn btn-link">Cancel</router-link>
        </div>
      </Form>
  </v-card>
</template>