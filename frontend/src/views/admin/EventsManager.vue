<template>
  <EventCard v-for="event in allEvents" :key="getUid(event as Event)" :event="(event as Event)" />
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

eventStore.getAllEvents();

const { allEvents } = storeToRefs(eventStore);
</script>