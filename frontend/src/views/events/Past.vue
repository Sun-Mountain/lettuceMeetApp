<script setup>
import { storeToRefs } from "pinia";
import { useEventStore } from "@/stores";

import { EventCard } from "@/components";

const eventStore = useEventStore();

eventStore.getAllUserEvents();

const { pastEvents } = storeToRefs(eventStore);
</script>

<template>
  <div id="past-events">
    <h1>You have {{ pastEvents.length }} past events</h1>
    <div class="cards-list-container">
      <EventCard v-for="event in pastEvents" :key="event.uid" :event="event" />
    </div>
  </div>
</template>