import { View } from "@/layouts";

export default {
  path: "/events",
  component: View,
  children: [
    { path: "", name: "upcoming" }
  ]
}