<template>
  <v-container>
    <h1 v-if="events === 0 || events > 1">You have {{ events.length }} upcoming events.</h1>
    <h1 v-else>You have {{ events.length }} upcoming event.</h1>
  </v-container>
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { useEventStore } from '@/store';

const eventStore = useEventStore();

eventStore.getAllUserEvents();

const { events } = storeToRefs(eventStore);
</script>