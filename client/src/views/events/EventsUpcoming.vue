<script setup>
import { storeToRefs } from "pinia";
import { useEventStore } from "@/stores";
const eventStore = useEventStore();
const { events } = storeToRefs(eventStore);
</script>

<template>
  <div id="event-manager">
    <h1>You have {{ events.length }} upcoming events</h1>
    <div :v-for="event in events">
      {{ event }}
    </div>
  </div>
</template>