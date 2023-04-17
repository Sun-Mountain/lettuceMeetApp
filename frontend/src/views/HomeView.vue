<script setup>
import { useAuthStore } from '@/stores';
import { EventForm } from '@/components';

const authStore = useAuthStore()
</script>

<template>
  <div>
    Welcome Message Coming Soon...

    <div v-show="authStore.user">
      <EventForm />
    </div>
  </div>
</template>
