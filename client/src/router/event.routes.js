import { Event } from "@/layouts";
import { EventsUpcoming } from "@/views";

export default {
  path: "/events",
  component: Event,
  children: [
    { path: "", name: "upcoming", component: EventsUpcoming },
    { path: "past", name: "past", component: () => import("@/views/events/Past") },
  ]
}