<template>
  <v-container>
    <div class="flex-space-between">
      <h1>Your Upcoming Events</h1>
      <div class="center-vertically">

        <NewEventBtn />
      </div>
    </div>
    <p class="cards-container">

      <EventCard v-for="event in events" :key="getUid(event as Event)" :event="(event as Event)" mini="true" />

    </p>
    <router-link id="upcomingEvents" :to="{ name: 'upcoming' }">
      Your Events Page <v-icon size="22px" icon="mdi:mdi-arrow-right-bold-box" />
    </router-link>
  </v-container>
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { EventCard, NewEventBtn } from '@/components';
import { Event } from '@/models/event.model';
import { useEventStore } from '@/store';

const eventStore = useEventStore();
const getUid = (event) => {
  return event.uid as string;
}

eventStore.getAllUserEvents();

const { events } = storeToRefs(eventStore);
</script>