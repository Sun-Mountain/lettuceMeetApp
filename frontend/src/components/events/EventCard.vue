<template>
  <v-card
    :title="eventForCard?.event_title"
    :subtitle="subtitle"
    :text="eventForCard?.description"
    :to="{ name: 'staged', params: { uid: eventId } }"
    class="event-card"
    :class="{ 'mini-card': mini }"
    variant="outlined"
  />
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ event: Object, mini: Boolean })

const { event, mini } = toRefs(props);
const eventForCard = event?.value;

const eventId = eventForCard?.uid;

const returnDates = (event) => {
  if (event.end_date) {
    return `${event?.start_date} - ${event?.end_date}`;
  }

  return event?.start_date;
};

const subtitle = returnDates(eventForCard)
</script>