<template>
  <div>
    <LoggedIn v-if="authStore.currentUser" />
    <Welcome v-else />
  </div>
</template>

<script lang="ts" setup>
import { useAuthStore } from '@/store';
import { LoggedIn, Welcome } from '@/components';
const authStore = useAuthStore();
</script>
