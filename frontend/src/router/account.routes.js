import { Layout, Login, Profile, Register } from "@/views/account";

export default {
  path: "/account",
  component: Layout,
  children: [
    { path: "", redirect: "login" },
    { path: "login", component: Login },
    { path: "profile/:user_name", component: Profile },
    { path: "register", component: Register },
  ],
};
