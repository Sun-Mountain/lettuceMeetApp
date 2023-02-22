<script setup>
import { storeToRefs } from "pinia";

import { EventForm } from "@/components";

import { useAuthStore, useEventStore } from "@/stores";

const authStore = useAuthStore();
const eventStore = useEventStore();

// eventStore.getAllUserEvents();

const { user } = storeToRefs(authStore);
const { events } = storeToRefs(eventStore);
</script>

<template>
  <div v-if="user">
    <h1>Hi {{ user?.user_name }}!</h1>
    {{ events }}
    <EventForm :user="user" />
  </div>
  <div v-else>Hello</div>
</template>
