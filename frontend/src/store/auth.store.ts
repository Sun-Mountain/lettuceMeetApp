import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { BASE_URL } from "@/helpers";
import { Login } from "@/models/user.model";
import router from "@/router";

export const useAuthStore = defineStore({
  id: "auth",
  state: () => ({
    token: localStorage.getItem("token"),
    currentUser: JSON.parse(localStorage.getItem('currentUser') || '{}'),
    returnUrl: null
  }),
  actions: {
    async login(values: Login) {
      try {
        const response = await fetchWrapper.post(`${BASE_URL}login`, {
          user: {
            email: values.email,
            password: values.password
          }
        });
        this.currentUser = response.body;
        localStorage.setItem("currentUser", JSON.stringify(response.body));
        this.token = response.token;
        localStorage.setItem("token", response.token);
        router.push(this.returnUrl || "/");
      } catch (err) {
        console.log(err);
      }
    },
    logout() {
      this.currentUser = '';
      localStorage.removeItem("currentUser");
      router.push("/login");
    },
  }
})
