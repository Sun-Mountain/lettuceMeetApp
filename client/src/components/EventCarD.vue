<script setup>
import { defineProps } from 'vue';

const props = defineProps({
  event: {
    eventTitle: String
  }
})
</script>

<template>
  <div class="event-card">
    <h2>
      {{ props.event.eventTitle }}
    </h2>
    {{ props.event }}
  </div>
</template>
