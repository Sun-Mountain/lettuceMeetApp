<template>
  <v-card
    class="form-container danger-header"
    title="Delete Account"
    variant="outlined"
  >
    <v-card-item>
      <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
        <div>
          <label>Current Password:</label>
          <Field
            name="current_password"
            type="password"
            class="form-control"
            :class="{ 'is-invalid': errors.current_password }"
            data-test="delete-account"
          />
          <div class="invalid-feedback">{{ errors.current_password }}</div>
        </div>
        <div class="btn-container">
          <button class="btn danger submit-btn" :disabled="isSubmitting">
            <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
            Delete Account
          </button>
        </div>
      </Form>
    </v-card-item>
  </v-card>
</template>

<script lang="ts" setup>
import { useUsersStore } from "@/store"
import { getSubmitFn } from '@/helpers';
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';

const usersStore = useUsersStore();

const schema = Yup.object().shape({
  current_password: Yup.string().required('Password is required.')
});

const onSubmit = getSubmitFn(schema, async (values) => {
  await usersStore.deleteAccount(values.current_password as string)
})
</script>