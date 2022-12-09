import { Layout, Login, Register } from "@/views/account";

export default {
  path: "/account",
  component: Layout,
  children: [
    { path: "login", component: Login },
    // {
    //   path: "profile",
    //   component: () => import("@/views/account/UserProfile.vue"),
    // },
    { path: "register", component: Register },
  ],
};
