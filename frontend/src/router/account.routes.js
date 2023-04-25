import { Account } from "@/layouts";
import { AccountView } from "@/views";

export default {
  path: "/account",
  component: Account,
  children: [
    { path: "", name: "account", component: AccountView, props: true },
    { path: "edit", name: "accountEdit", component: () => import("@/views/account/EditAccount.vue"), props: true }
  ],
};
