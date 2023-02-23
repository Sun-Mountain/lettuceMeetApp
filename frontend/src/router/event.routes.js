import { EventLayout, Manager, PastEvents } from "@/views/event";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    { path: "", component: Manager },
    { path: "past-events", component: PastEvents },
  ],
};
