<script>
import { ref, readonly } from "vue";

export default {
  props: ["event"],
  setup(props) {
    const eventTitle = ref(props.event.title);
    const eventDetails = ref(props.event.body);
    const eventPrivate = ref(props.event.private);
    const eventAllDay = ref(props.event.all_day);
    const eventStartDate = ref(props.event.start_date);
    const eventEndDate = ref(props.event.end_date);
    const eventStartTime = ref(props.event.start_time);
    const eventEndTime = ref(props.event.end_time);
    const userId = ref(props.event.user_id);
    const eventId = ref(props.event.uid);

    return {
      eventLink: `events/${eventId.value}`,
      eventTitle: readonly(eventTitle),
      eventDetails: readonly(eventDetails),
      eventPrivate: readonly(eventPrivate),
      eventAllDay: readonly(eventAllDay),
      eventStartDate: readonly(eventStartDate),
      eventEndDate: readonly(eventEndDate),
      eventStartTime: readonly(eventStartTime),
      eventEndTime: readonly(eventEndTime),
      userId: readonly(userId),
      eventId: readonly(eventId),
    };
  },
};
</script>

<template>
  <div class="eventCard">
    <h2>{{ eventTitle }}</h2>
    <div>
      <router-link :to="eventLink">link</router-link>
    </div>
    <div>
      {{ event }}
    </div>
  </div>
</template>
