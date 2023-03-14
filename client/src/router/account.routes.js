import { Home } from "@/layouts";
import { User } from "@/views";

export default {
  path: "/account",
  component: Home,
  children: [
    { path: "login", name: "login", component: () => import("@/components/forms/LoginUser.vue"), alias: ['/login'] },
    { path: "register", name: "register", component: () => import("@/components/forms/RegisterUser.vue"), alias: ['/register'] },
    { path: "profile", name: "profile", component: User, props: true, alias: ['/profile'] }
  ],
};
