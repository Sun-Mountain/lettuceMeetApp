import { View } from "@/layouts";
import { AdminDashboard } from "@/views";

export default {
  path: "/admin",
  component: View,
  children: [
    { path: "", name: "admin", component: AdminDashboard },
    { path: "event-manager", name: "eventManager", component: () => import("@/views/admin/EventsManager.vue") },
    { path: "user-manager", name: "userManager", component: () => import("@/views/admin/UserManager.vue") }
  ]
}