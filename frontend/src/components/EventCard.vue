<script>
import { ref, readonly } from "vue";

export default {
  props: [
    "title",
    "body",
    "private",
    "all_day",
    "start_date",
    "end_date",
    "start_time",
    "end_time",
    "user_id",
    "uuid",
    "created_at",
  ],
  setup(props) {
    const eventTitle = ref(props.title);
    const eventDetails = ref(props.body);
    const eventPrivate = ref(props.private);
    const eventAllDay = ref(props.all_day);
    const eventStartDate = ref(props.start_date);
    const eventEndDate = ref(props.end_date);
    const eventStartTime = ref(props.start_time);
    const eventEndTime = ref(props.end_time);
    const userId = ref(props.user_id);
    const eventId = ref(props.uuid);

    return {
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
  <div>
    <h2>{{ eventTitle }}</h2>
  </div>
</template>
