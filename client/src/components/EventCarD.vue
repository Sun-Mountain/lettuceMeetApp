<script setup>
import { toRefs } from 'vue';
const props = defineProps({
  event: Object
})
const { event } = toRefs(props);
const eventLink = `events/${event.value.uid}`;
console.log(event.value)
</script>

<template>
  <div class="card-container">
    <router-link :to="eventLink" class="event-card">
      <div class="event-card-content">
        <h2>
          {{ event.eventTitle }}
        </h2>
        {{ event.startDate }}
        {{ event }}
      </div>
    </router-link>
  </div>
</template>
