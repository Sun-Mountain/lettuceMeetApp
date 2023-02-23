<script setup>
import { Alert } from "@/components";
</script>

<template>
  <div id="events-page" class="card">
    <div id="sideNav">
      <div>Upcoming Events</div>
      <div>Past Events</div>
    </div>
    <div>
      <Alert />
      <router-view />
    </div>
  </div>
</template>
