import { View } from "@/layouts";
import { AdminDashboard } from "@/views";

export default {
  path: "/admin",
  component: View,
  children: [
    { path: "", name: "admin", component: AdminDashboard },
    { path: "user-manager", name: "userManager", component: () => import("@/views/admin/UserManager.vue"), props: true }
  ]
}