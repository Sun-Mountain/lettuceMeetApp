<template>
  <v-container id="confirmation-page">
    <h1>Confirming Account</h1>
    <v-progress-circular
      indeterminate
      color="green"
    />
  </v-container>
</template>

<script lang="ts" setup>
import { useRoute } from 'vue-router';
import { useAuthStore } from '@/store';
const route = useRoute();
const authStore = useAuthStore()

authStore.confirmUser(route.query.confirmation_token as string);
</script>