import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { User } from "@/models/user.model";
import { useAlertStore, useAuthStore } from "@/store";
import router from "@/router";

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
    users: JSON.parse(localStorage.getItem('users') || '[]')
  }),
  actions: {
    async getAllUsers() {
      const response = await fetchWrapper.get(`${BASE_URL}users`);
      localStorage.setItem("users", JSON.stringify(response));
    },
    async register(user: User) {
      const alertStore = useAlertStore();
      try {
        const newAccount = { user };
        await fetchWrapper.post(`${BASE_URL}signup`, newAccount);
        alertStore.success("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
        router.push("/login");
      } catch (err) {
        alertStore.error(err);
      }
    },
    async updateAccount(user: User, userId: number) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      const updates = { user };
      const currentUser = authStore.currentUser;

      try {
        if (currentUser.id === userId) {
          const response = await fetchWrapper.put(`${BASE_URL}signup`, updates);
          authStore.updateCurrentUser(response.data);
          alertStore.success("Your account was successfully updated.")
          router.push("/account");
        }
      } catch (err) {
        alertStore.error(err);
      }
    },
    async deleteAccount(value: string) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      const currentUser = authStore.currentUser;

      try {
        await fetchWrapper.delete(`${BASE_URL}/users/${currentUser.id}`, {
          user: {
            current_password: value
          }
        });
        authStore.logout();
        router.push("/login")
        alertStore.success("Your account was successfully deleted.")
      } catch (err) {
        alertStore.error(err);
      }
    }
  }
})