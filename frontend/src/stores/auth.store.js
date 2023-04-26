import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { router } from "@/router";
import { useAlertStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useAuthStore = defineStore({
  id: "auth",
  state: () => ({
    // initialize state from local storage to enable user to stay logged in
    user: JSON.parse(localStorage.getItem("user")),
    returnUrl: null,
  }),
  actions: {
    async login(email, password) {
      const alertStore = useAlertStore();
      try {
        const res = await fetchWrapper.post(`${baseUrl}login`, {
          user: {
            email: email,
            password: password
          }
        })
        // update pinia state
        this.user = res.body;
        // store user details and jwt in local storage to keep user logged in between page refreshes
        localStorage.setItem("user", JSON.stringify(res.body));

        // redirect to previous url or default to home page
        router.push(this.returnUrl || "/");
      } catch (err) {
        alertStore.error("Incorrect email or password.");
      }
    },
    logout() {
      this.user = null;
      localStorage.removeItem("user");
      router.push("/account/login");
    },
    async updateCurrentUser(user) {
      this.user = user;
      localStorage.setItem("user", JSON.stringify(user));
    }
  }
})
