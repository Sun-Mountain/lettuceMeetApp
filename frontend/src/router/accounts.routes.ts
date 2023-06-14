import { View } from "@/layouts";
import { ProfileView } from "@/views";

export default {
  path: "/account",
  component: View,
  children: [
    { path: "", name: "account", component: ProfileView },
    { path: "confirmations",
      name: "confirmAccount",
      component: () => import("@/views/account/ConfirmAccount.vue"),
      props: (route) => ({ confirmation_token: route.query.confirmation_token })
    },
    { path: "edit", name: "accountEdit", component: () => import("@/views/account/EditAccount.vue"), props: true}
  ]
}