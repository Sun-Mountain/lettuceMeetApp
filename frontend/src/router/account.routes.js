import { Home } from "@/views";

export default {
  path: "/account",
  component: Home,
  children: [
    { path: "login", name: "login", component: () => import("@/components/forms/LoginUser.vue") },
    { path: "register", name: "register", component: () => import("@/components/forms/RegisterUser.vue") },
  ],
};
