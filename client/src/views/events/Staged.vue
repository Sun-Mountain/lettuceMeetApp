<script setup>
import { useRoute } from 'vue-router'
import { storeToRefs } from 'pinia'
import { useEventStore } from "@/stores";

const route = useRoute();
const uid = route.params.uid;
const eventStore = useEventStore();
const { getEventById } = eventStore;

getEventById(uid);

const { stagedEvent } = storeToRefs(eventStore);
</script>

<template>
  <div>
    <h2>{{ stagedEvent.eventTitle }}</h2>
    {{ stagedEvent }}
  </div>
</template>
