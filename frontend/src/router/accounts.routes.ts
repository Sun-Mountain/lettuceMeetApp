import { View } from "@/layouts";
import { ProfileView } from "@/views";

export default {
  path: "/account",
  component: View,
  children: [
    { path: "", name: "account", component: ProfileView },
    {
      path: "confirmations",
      name: "confirmAccount",
      component: () => import("@/views/account/ConfirmAccount.vue"),
      props: (route) => ({ confirmation_token: route.query.confirmation_token }),
      alias: '/confirmation'
    },
    {
      path: "confirmationHelp",
      name: "confirmHelp",
      component: () => import("@/views/account/ConfirmHelp.vue"),
      alias: "/confirmationHelp"
    },
    { path: "edit", name: "accountEdit", component: () => import("@/views/account/EditAccount.vue"), props: true}
  ]
}