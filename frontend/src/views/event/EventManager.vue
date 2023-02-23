<script setup>
import { storeToRefs } from "pinia";

import { useEventStore } from "@/stores";

const eventStore = useEventStore();

const { events } = storeToRefs(eventStore);
</script>

<template>
  <div>
    <div v-for="event in events" :key="event.uuid">
      {{ event.title }}
    </div>
  </div>
</template>
