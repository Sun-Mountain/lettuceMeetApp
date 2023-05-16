<template>
  <v-container>
    <h1 v-if="events === 0 || events > 1">You have {{ events.length }} upcoming events.</h1>
    <h1 v-else>You have {{ events.length }} upcoming event.</h1>

    <div>
      <EventCard v-for="event in events" :key="event.uid" :event="event" />
    </div>
  </v-container>
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { useEventStore } from '@/store';

import { EventCard } from '@/components';

const eventStore = useEventStore();

eventStore.getAllUserEvents();

const { events } = storeToRefs(eventStore);
</script>