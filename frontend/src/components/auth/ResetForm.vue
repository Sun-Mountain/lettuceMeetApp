<template>
  <v-container>
    <v-card
      class="form-container"
      :title="formTitle"
      variant="outlined"
    >
      <v-card-item>
          <Form @submit="onSubmit" :validation-schema="schema" v-slot="{ errors, isSubmitting }">
            <div>
              <label>Email:</label><br />
              <Field
                name="email"
                type="text"
                class="form-control"
                :class="{ 'is-invalid': errors.email }"
              />
              <div class="invalid-feedback">{{ errors.email }}</div>
            </div>
            <button class="btn btn-primary submit-btn" :disabled="isSubmitting">
                <span v-show="isSubmitting" class="spinner-border spinner-border-sm mr-1"></span>
                {{ btnText }}
            </button>
          </Form>
      </v-card-item>
    </v-card>
  </v-container>
</template>

<script lang="ts" setup>
import { PropType, toRefs } from 'vue';
import { Form, Field } from 'vee-validate';
import * as Yup from 'yup';
import { getSubmitFn } from '@/helpers';
import { Email } from '@/models/user.model';
import { useAuthStore } from "@/store";

const props = defineProps({
  reset: String as PropType<'confirmation' | 'password'>
})
const { reset: resetType } = toRefs(props);
const resetConfirmation = resetType?.value === 'confirmation';
const btnText = resetConfirmation ? 'Resend Confirmation' : 'Reset Password';
const formTitle = resetConfirmation ? 'Resend Confirmation Instructions' : 'Reset Password';

const schema = Yup.object().shape({
  email: Yup.string().email().required('Email is required.')
});

const onSubmit = getSubmitFn(schema, async (value: Email) => {
  const authStore = useAuthStore();
  authStore.resendConfirmation(value)
})
</script>