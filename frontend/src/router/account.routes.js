import { Layout } from "@/views/account";
import {  LoginForm, RegisterForm } from "@/Components";

export default {
  path: "/account",
  component: Layout,
  children: [
    { path: "login", component: LoginForm },
    // {
    //   path: "profile",
    //   component: () => import("@/views/account/UserProfile.vue"),
    // },
    { path: "register", component: RegisterForm },
  ],
};
