import { View } from "@/layouts";
import { AdminDashboard } from "@/views";

export default {
  path: "/admin",
  component: View,
  children: [
    { path: "", name: "account", component: AdminDashboard }
  ]
}