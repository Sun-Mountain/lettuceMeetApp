<template>
  <h1 v-if="events.length === 0 || events.length > 1">You have {{ events.length }} upcoming events.</h1>
  <h1 v-else>You have {{ events.length }} upcoming event.</h1>

  <EventCard v-for="event in events" :key="getUid(event as Event)" :event="(event as Event)" />
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { Event } from '@/models/event.model';
import { useEventStore } from '@/store';

import { EventCard } from '@/components';

const eventStore = useEventStore();
const getUid = (event) => {
  return event.uid as string;
}

eventStore.getAllUserEvents();

const { events } = storeToRefs(eventStore);
</script>