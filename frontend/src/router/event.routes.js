import { EventLayout, EventStage, Manager, PastEvents } from "@/views/event";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    { path: "", component: Manager },
    { path: "past", component: PastEvents }
  ],
};
