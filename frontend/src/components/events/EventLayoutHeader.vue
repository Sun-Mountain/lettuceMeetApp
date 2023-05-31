<template>
  <div class="event-header">
    <router-link
      class="inverted-link"
      id="newEvent"
      :to="{ name: 'new-event' }"
      v-show="route.name != 'new-event'"
    >
      <v-icon size="22px" icon="mdi:mdi-plus-box" />
      New Event
    </router-link>
  </div>
</template>

<script lang="ts" setup>
import { useRoute } from 'vue-router';

const route = useRoute();

console.log(route.name)
</script>