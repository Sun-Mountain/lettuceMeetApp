<script setup>
import { storeToRefs } from "pinia";
import { useEventStore } from "@/stores";

import { EventCard } from "@/components";

const eventStore = useEventStore();

const { events } = storeToRefs(eventStore);
</script>

<template>
  <div>
    <EventCard v-for="event in events" :key="event.uuid" :title="event.title" />
  </div>
</template>
