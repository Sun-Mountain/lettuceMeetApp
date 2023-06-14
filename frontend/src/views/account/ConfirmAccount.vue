<template>
  Confirming account...
</template>

<script lang="ts" setup>
import { useRoute } from 'vue-router';
import { useAuthStore } from '@/store';
const route = useRoute();
const authStore = useAuthStore()

authStore.confirmUser(route.query.confirmation_token as string);
</script>