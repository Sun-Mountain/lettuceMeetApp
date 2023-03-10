import { Home } from "@/views";

export default {
  path: "/account",
  component: Home,
  children: [
    // { path: "login", component: Login },
    { path: "register", name: "register", component: () => import("@/components/forms/RegisterUser.vue") },
  ],
};
