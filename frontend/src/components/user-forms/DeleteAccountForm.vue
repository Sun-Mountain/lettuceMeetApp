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
          <div class="btn-container">
            <button class="btn btn-primary submit-btn danger" :disabled="isSubmitting">
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

import { useUsersStore } from '@/store';

const schema = Yup.object().shape({
  current_password: Yup.string().required('Current password is required.')
})

async function onSubmit(value: string) {
  const usersStore = useUsersStore()
  await usersStore.deleteAccount(value);
}
</script>