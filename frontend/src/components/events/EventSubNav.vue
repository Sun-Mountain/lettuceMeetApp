<template>
  <v-container class="subnav">
    <router-link id="upcomingEvents" :to="{ name: 'upcoming' }">
      Upcoming Events
    </router-link>
    <router-link id="pastEvents" :to="{ name: 'past' }">
      Past Events
    </router-link>
  </v-container>
</template>

<script lang="ts" setup>
</script>