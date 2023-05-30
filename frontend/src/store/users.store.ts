import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { User } from "@/models/user.model";
import { useAuthStore } from "./auth.store";
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
      const newAccount = { user };
      const res = await fetchWrapper.post(`${BASE_URL}signup`, newAccount);
    },
    async updateAccount(user: User, userId: number) {
      const authStore = useAuthStore();
      const updates = { user };
      const currentUser = authStore.currentUser;

      try {
        if (currentUser.id === userId) {
          const response = await fetchWrapper.put(`${BASE_URL}signup`, updates);
          authStore.updateCurrentUser(response.data);
          router.push("/account");
        }
      } catch (err) {
        console.log(err);
      }
    },
    async deleteAccount(value: string) {
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
      } catch (err) {
        console.log(err);
      }
    }
  }
})