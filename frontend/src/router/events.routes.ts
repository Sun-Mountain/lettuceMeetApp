import { View } from "@/layouts";
import { UserEvents } from "@/views";

export default {
  path: "/events",
  component: View,
  children: [
    { path: "", name: "upcoming", component: UserEvents }
  ]
}