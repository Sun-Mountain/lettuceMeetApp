<script setup>
import { storeToRefs } from "pinia";
import { useEventStore } from "@/stores";

import { EventCard } from "@/components";

const eventStore = useEventStore();

eventStore.getAllUserEvents();

const { events } = storeToRefs(eventStore);
</script>

<template>
  <div id="event-manager">
    <h1>You have {{ events.length }} upcoming events</h1>
    <div class="cards-list-container">
      <EventCard v-for="event in events" :key="event.uid" :event="event" />
    </div>
  </div>
</template>