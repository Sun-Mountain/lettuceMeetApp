<script setup>
import { useRoute } from 'vue-router'
import { storeToRefs } from 'pinia'
import { useEventStore } from "@/stores";

const route = useRoute();
const eventStore = useEventStore();
const { getEventById } = eventStore;
getEventById(route.params.uid);
const { stagedEvent } = storeToRefs(eventStore);
</script>
<template>
  <div>
    {{ stagedEvent }}
  </div>
</template>
