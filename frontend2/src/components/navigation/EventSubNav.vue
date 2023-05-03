<script setup>
</script>

<template>
  <div class="subnav">
    <router-link id="newEvent" :to="{ name: 'new' }">
      New Event
    </router-link>
    <router-link id="upcomingEvents" :to="{ name: 'upcoming' }">
      Upcoming Events
    </router-link>
    <router-link id="pastEvents" :to="{ name: 'past' }">
      Past Events
    </router-link>
  </div>
</template>
