import { View } from "@/layouts";
import { ProfileView } from "@/views";

export default {
  path: "/profile",
  component: View,
  children: [
    { path: "", name: "upcoming", component: ProfileView }
  ]
}