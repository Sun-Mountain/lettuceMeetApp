import { EventLayout } from "@/layouts";
import { UserEvents } from "@/views";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    { path: "", name: "upcoming", component: UserEvents },
    { path: "past", name: "past", component: () => import("@/views/events/PastEvents.vue") },
    { path: ":uid", name: "staged", component: () => import("@/views/events/StagedEvent.vue"), props: true },
  ]
}