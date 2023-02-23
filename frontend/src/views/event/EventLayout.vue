<script setup>
import { Alert, EventPageNav } from "@/components";
</script>

<template>
  <div id="events-page" class="card">
    <EventPageNav />
    <div id="eventsMain">
      <Alert />
      <router-view />
    </div>
  </div>
</template>
