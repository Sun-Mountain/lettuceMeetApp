import { OwnedEvents } from "@/views/events";

export default {
  path: "/events",
  component: OwnedEvents,
  children: [
    { path: "create", component: () => import("@/views/events/CreateEvent.vue") }
  ],
};
