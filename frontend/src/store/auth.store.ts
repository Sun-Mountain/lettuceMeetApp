import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { Email, Login, User } from "@/models/user.model";
import { useAlertStore } from "./alert.store";
import router from "@/router";

export const useAuthStore = defineStore({
  id: "auth",
  state: () => ({
    token: localStorage.getItem("token"),
    currentUser: JSON.parse(localStorage.getItem('currentUser')!),
    returnUrl: null
  }),
  actions: {
    async confirmUser(token: string) {
      const alertStore = useAlertStore();
      try {
        await fetchWrapper.post(`${BASE_URL}confirmation`, { token })
        router.push("/login");
        alertStore.success('Account confirmed!');
      } catch (err) {
        alertStore.error(err);
      }
    },
    async resendConfirmation(email: Email) {
      const alertStore = useAlertStore();
      try {
        await fetchWrapper.post(`${BASE_URL}confirmation`, email);
        router.push("/login")
        alertStore.success('Confirmation resent.')
      } catch (err) {
        alertStore.error(err)
      }
    },
    async login(values: Login) {
      const alertStore = useAlertStore();
      try {
        const response = await fetchWrapper.post(`${BASE_URL}login`, {
          user: {
            email: values.email,
            password: values.password
          }
        });
        this.currentUser = JSON.stringify(response.body);
        localStorage.setItem("currentUser", JSON.stringify(response.body));
        this.token = response.token;
        localStorage.setItem("token", response.token);
        router.push(this.returnUrl || "/");
      } catch (err) {
        alertStore.error(err);
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
