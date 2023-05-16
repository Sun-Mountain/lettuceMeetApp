import { EventLayout } from "@/layouts";
import { UserEvents } from "@/views";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    { path: "", name: "upcoming", component: UserEvents }
  ]
}