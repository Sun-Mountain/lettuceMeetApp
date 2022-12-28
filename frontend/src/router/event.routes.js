import { EventsLayout } from "@/views/events";

export default {
  path: "/events",
  component: EventsLayout,
  children: [
    { path: "", component: () => import("@/views/events/EventsList.vue") },
    {
      path: "create",
      component: () => import("@/views/events/CreateEvent.vue"),
    },
  ],
};
