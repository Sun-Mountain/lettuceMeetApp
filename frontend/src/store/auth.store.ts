import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { Login, User } from "@/models/user.model";
import router from "@/router";

export const useAuthStore = defineStore({
  id: "auth",
  state: () => ({
    token: localStorage.getItem("token"),
    currentUser: JSON.parse(localStorage.getItem('currentUser')!),
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
        console.log(response)
        this.currentUser = JSON.stringify(response.body);
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
      this.token = '';
      localStorage.removeItem("currentUser");
      localStorage.removeItem("token");
      router.push("/login");
    },
    async updateCurrentUser(currentUser: User) {
      this.currentUser = currentUser;
      localStorage.setItem("currentUser", JSON.stringify(currentUser));
    }
  }
})
