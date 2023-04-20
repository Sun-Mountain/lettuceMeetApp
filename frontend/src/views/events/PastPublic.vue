<script setup>
import { storeToRefs } from "pinia";
import { useEventStore } from "@/stores";

import { EventCard } from "@/components";

const eventStore = useEventStore();

eventStore.getAllUserEvents();

const { publicPastEvents } = storeToRefs(eventStore);
</script>

<template>
  <div id="past-events">
    <div class="cards-list-container">
      <EventCard v-for="event in publicPastEvents" :key="event.uid" :event="event" />
    </div>
  </div>
</template>