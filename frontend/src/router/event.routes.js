import { Event } from "@/layouts";
import { Manager } from "@/views";

export default {
  path: "/events",
  component: Event,
  children: [
    { path: "", name: "upcoming", component: Manager },
    { path: "new", name: "new", component: () => import("@/views/events/New") },
    { path: "past", name: "past", component: () => import("@/views/events/Past") },
    { path: "past-public-events", name: "past-public", component: () => import("@/views/events/PastPublic") },
    { path: ":uid", name: "staged", component: () => import("@/views/events/Staged.vue"), props: true },
    { path: ":uid/edit", name: "editEvent/:uid", component: () => import("@/views/events/Edit.vue"), props: true },
  ]
}