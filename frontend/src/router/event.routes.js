import { EventLayout, Manager, PastEvents } from "@/views/event";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    {
      path: "",
      name: "upcoming",
      component: Manager,
      alias: ["/"],
    },
    { path: "past", name: "past", component: PastEvents },
    { path: ":uid", component: () => import("@/views/event/EventStage.vue") },
  ],
};
