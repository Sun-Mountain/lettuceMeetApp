import { EventLayout, Manager } from "@/views/event";

export default {
  path: "/events",
  component: EventLayout,
  children: [
    { path: "", component: Manager },
  ],
};
