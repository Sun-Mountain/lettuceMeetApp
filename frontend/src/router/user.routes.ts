import { View } from "@/layouts";

export default {
  path: "/user",
  component: View,
  children: [
    { path: ":id", name: "user-profile", component: () => import("@/views/user/UserProfile.vue"), props: true }
  ]
}