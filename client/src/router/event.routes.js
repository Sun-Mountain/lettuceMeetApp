import { Event } from "@/layouts";
import { Manager } from "@/views";

export default {
  path: "/events",
  component: Event,
  children: [
    { path: "", name: "upcoming", component: Manager },
    { path: "past", name: "past", component: () => import("@/views/events/Past") },
    { path: ":uid", name: "staged", component: () => import("@/views/events/Staged.vue"), props: true },
  ]
}