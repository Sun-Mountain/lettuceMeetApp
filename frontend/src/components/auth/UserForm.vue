<template>
  <v-container>
    <v-container>
      <Alert />
    </v-container>
    <v-card
      class="form-container"
      :title="formTitle"
      variant="outlined"
    >
      <v-card-item>
        <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
          <div>
            <label>First Name:</label>
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
            <label>Last Name:</label>
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
            <label>Username:</label>
            <Field
              name="preferred_username"
              type="text"
              class="form-control"
              :class="{ 'is-invalid': errors.preferred_username }"
              :value="usernameValue"
            />
            <div class="invalid-feedback">{{ errors.preferred_username }}</div>
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
          <div v-show="isEditing">
            <label>Current Password:</label>
            <Field
              name="current_password"
              type="password"
              class="form-control"
              :class="{ 'is-invalid': errors.current_password }"
            />
            <div class="invalid-feedback">{{ errors.current_password }}</div>
          </div>
          <div v-show="!isEditing">
            <label>Password:</label><br />
            <Field name="password" type="password" class="form-control" :class="{ 'is-invalid': errors.password }" />
            <div class="invalid-feedback">{{ errors.password }}</div>
          </div>
          <div v-show="!isEditing">
            <label>Confirm Password:</label><br />
            <Field name="password_confirm" type="password" class="form-control" :class="{ 'is-invalid': errors.password_confirm }" />
            <div class="invalid-feedback">{{ errors.password_confirm }}</div>
          </div>
          <div class="btn-container">
            <button class="btn btn-primary submit-btn" :disabled="isSubmitting">
                <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
                {{ btnText }}
            </button>
            <div class="right-align">
              <router-link :to="cancelLink" class="btn btn-link">Cancel</router-link>
            </div>
          </div>
        </Form>
      </v-card-item>
    </v-card>
  </v-container>
</template>

<script setup lang="ts">
import { PropType, toRefs } from 'vue';
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

import { Alert } from '@/components';
import { getSubmitFn } from '@/helpers';
import { User } from "@/models/user.model";
import { useAuthStore, useUsersStore } from "@/store"

const props = defineProps({
  user: Object as PropType<User>
});
const { user } = toRefs(props);
const editUser = user?.value;

const isEditing = editUser ? true : false;
const formTitle = isEditing ? 'Edit Account' : 'Register Account';
const btnText = isEditing ? 'Update Account' : 'Submit Registration';
const cancelLink = isEditing ? { name: 'account' } : 'login';

const firstNameValue = isEditing ? editUser?.first_name : '';
const lastNameValue = isEditing ? editUser?.last_name : '';
const usernameValue = isEditing ? editUser?.preferred_username : '';
const emailValue = isEditing ? editUser?.email : '';

const updateSchema = Yup.object().shape({
  first_name: Yup.string().required('First name is required.'),
  last_name: Yup.string().required('Last name is required.'),
  preferred_username: Yup.string().required('Username is required.'),
  email: Yup.string().email().required('Email is required.'),
  current_password: Yup.string().required('Current password is required.')
})

const registerSchema = Yup.object().shape({
  first_name: Yup.string().required('First name is required.'),
  last_name: Yup.string().required('Last name is required.'),
  preferred_username: Yup.string().required('Username is required.'),
  email: Yup.string().email().required('Email is required.'),
  password: Yup.string().required('Password is required.')
      .min(6, 'Password must be at least 6 characters.'),
  password_confirm: Yup.string().required('Confirm password.')
    .oneOf([Yup.ref('password')], 'Your passwords do not match.')
});

const schema = isEditing ? updateSchema : registerSchema;

const onSubmit = getSubmitFn(schema, async (values: User) => {
  const usersStore = useUsersStore();
  const authStore = useAuthStore();
  try {
    if (isEditing) {
      await usersStore.updateAccount(values, authStore.currentUser.id);
    } else {
      await usersStore.register(values);
    }
  } catch (err) {
    console.log(err)
  }
})
</script>