<template>
  <v-card
    class="form-container"
    title="Delete Account"
    variant="outlined"
  >
    <v-card-item>
      <Form>
        <label>Current Password:</label>
        <Field
          name="current_password"
          type="password"
          class="form-control"
        />
      </Form>
    </v-card-item>
  </v-card>
</template>

<script lang="ts" setup>
import { Form, Field } from 'vee-validate';
</script>