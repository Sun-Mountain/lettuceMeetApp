<script setup>
</script>
<template>
  <div id="sideNav">
    <router-link id="upcomingEvents" :to="{ name: 'upcoming' }">
      Upcoming Events
    </router-link>
    <router-link id="pastEvents" :to="{ name: 'past' }">
      Past Events
    </router-link>
  </div>
</template>
