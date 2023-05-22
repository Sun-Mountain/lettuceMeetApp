<template>
  <div>
    <div v-if="authStore.currentUser">
      <EventForm />
    </div>
    <div v-else>
      Welcome Message.....
    </div>
  </div>
</template>

<script lang="ts" setup>
import { EventForm } from '@/components';
import { useAuthStore } from '@/store';
const authStore = useAuthStore();
</script>
