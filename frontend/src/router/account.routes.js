import { Account } from "@/layouts";
import { AccountView } from "@/views";

export default {
  path: "/account",
  component: Account,
  children: [
    { path: "", name: "account", component: AccountView, props: true }
  ],
};
