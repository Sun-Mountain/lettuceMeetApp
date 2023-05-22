import { View } from "@/layouts";
import { ProfileView } from "@/views";

export default {
  path: "/account",
  component: View,
  children: [
    { path: "", name: "account", component: ProfileView },
    { path: "edit", name: "accountEdit", component: () => import("@/views/account/EditAccount.vue"), props: true}
  ]
}