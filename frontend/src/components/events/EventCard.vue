<template>
  <v-card
    :title="event?.event_title"
    :subtitle="event?.start_date"
    :text="event?.description"
    :to="{ name: 'staged', params: { uid: eventId } }"
    class="event-card"
    variant="outlined"
  >
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ event: Object })

const { event } = toRefs(props);

const eventId = event?.value?.uid;
</script>