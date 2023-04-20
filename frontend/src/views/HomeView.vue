<script setup>
import { storeToRefs } from "pinia";
import { useAuthStore, useEventStore } from '@/stores';

import { EventCard } from "@/components";

const eventStore = useEventStore();
const authStore = useAuthStore();
const user = authStore.user;

eventStore.getAllPublicEvents();

const { publicEvents } = storeToRefs(eventStore);
</script>

<template>
  <div>
    <div v-if="user">
      <div id="events-manager-navigation">
        <router-link id="pastEvents" :to="{ name: 'past' }">
          Past Events
        </router-link>
        <router-link id="newEvent" :to="{ name: 'new' }">
          <v-icon icon="mdi-plus-circle"></v-icon>
          New Event
        </router-link>
      </div>
      <div class="cards-list-container">
        <EventCard v-for="event in publicEvents" :key="event.uid" :event="event" />
      </div>
    </div>
    <div v-else>
      Welcome Message Coming Soon...
    </div>
  </div>
</template>
