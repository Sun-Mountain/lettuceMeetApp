import { AccountLayout } from "@/views/account";
import {  LoginForm, RegisterForm } from "@/Components";

export default {
  path: "/account",
  component: AccountLayout,
  children: [
    { path: "login", component: LoginForm },
    // {
    //   path: "profile",
    //   component: () => import("@/views/account/UserProfile.vue"),
    // },
    { path: "register", component: RegisterForm },
  ],
};
