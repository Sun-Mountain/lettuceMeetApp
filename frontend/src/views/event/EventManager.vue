<script setup>
import { storeToRefs } from "pinia";
import { useEventStore } from "@/stores";

import { EventCard } from "@/components";

const eventStore = useEventStore();

const { events } = storeToRefs(eventStore);
</script>

<template>
  <div id="event-manager">
    <h1>You have {{ events.length }} upcoming events</h1>
    <div id="event-card-container">
      <EventCard v-for="event in events" :key="event.uid" :event="event" />
    </div>
  </div>
</template>
