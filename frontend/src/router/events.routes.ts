import { EventLayout } from "@/layouts";
import { UserEvents } from "@/views";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    { path: "", name: "upcoming", component: UserEvents },
    { path: "new", name: "new-event", component: () => import("@/views/events/NewEvent.vue") },
    { path: "past", name: "past", component: () => import("@/views/events/PastEvents.vue") },
    { path: ":uid", name: "staged", component: () => import("@/views/events/StagedEvent.vue"), props: true },
    { path: ":uid/edit", name: "editEvent/:uid", component: () => import("@/views/events/EditEvent.vue"), props: true },
  ]
}