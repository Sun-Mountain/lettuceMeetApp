<template>
  <v-container>
    <h1>Your Upcoming Events</h1>
    <NewEventBtn style="float: right" />
    <router-link id="upcomingEvents" :to="{ name: 'upcoming' }">
      More <v-icon size="22px" icon="mdi:mdi-arrow-right-bold-box" />
    </router-link>
  </v-container>
</template>

<script lang="ts" setup>
import { NewEventBtn } from '@/components';
</script>