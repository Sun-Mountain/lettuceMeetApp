<template>
  <v-card
    :title="event?.event_title"
    :subtitle="event?.start_date"
    :text="event?.description"
    :to="eventLink"
    variant="outlined"
  >
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ event: Object })

const { event } = toRefs(props);

const eventLink = `events/${event?.value?.uid}`
</script>