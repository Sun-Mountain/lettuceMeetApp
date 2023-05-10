import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { User } from "@/models/user.model";
import { useAuthStore } from "./auth.store";
import router from "@/router"

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
    users: []
  }),
  actions: {
    async register(user: User) {
      const newAccount = { user };
      await fetchWrapper.post(`${BASE_URL}signup`, newAccount);
    },
    async updateAccount(user: User, userId: number) {
      const authStore = useAuthStore();
      const updates = { user };
      const currentUser = authStore.currentUser;

      try {
        if (currentUser.id === userId) {
          const response = await fetchWrapper.put(`${BASE_URL}signup`, updates);
          console.log(response)
          authStore.updateCurrentUser(response.data);
          router.push("/account");
        }
      } catch (err) {
        console.log(err);
      }
    }
  }
})