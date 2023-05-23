<template>
  <div>
    <div v-if="Object.keys(toRaw(authStore.currentUser)).length != 0">
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
import { toRaw } from 'vue';
const authStore = useAuthStore();
</script>
