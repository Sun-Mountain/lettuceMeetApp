<script setup>
import { toRefs } from 'vue';
const props = defineProps({
  event: Object
})
const { event } = toRefs(props);
const eventLink = `events/${event.value.uid}`;
</script>

<template>
  <div class="card-container">
    <router-link :to="eventLink" class="event-card">
      <div class="event-card-content">
        <h2>
          {{ event.eventTitle }}
        </h2>
        <div class="event-card-dates">
          {{ event.startDate }}
        </div>
        {{ event }}
      </div>
    </router-link>
  </div>
</template>
