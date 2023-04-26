import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { router } from "@/router";
import { useAuthStore } from '@/stores';

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
    users: []
  }),
  actions: {
    async register(user) {
      let newAccount = {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          preferred_username: user.username,
          email: user.email,
          password: user.password,
          password_confirmation: user.passwordConfirm
        }
      }
      await fetchWrapper.post(`${baseUrl}signup`, newAccount)
    },
    async updateAccount(user, userId) {
      const authStore = useAuthStore();
      const currentUser = authStore.user;
      let updateAccount = {
        first_name: user.first_name,
        last_name: user.last_name,
        preferred_username: user.username,
        email: user.email,
        current_password: user.current_password,
        password: user.password,
        password_confirmation: user.passwordConfirm
      }
      const res = await fetchWrapper.put(`${baseUrl}users/${userId}`, updateAccount);

      if (currentUser.id === userId) {
        authStore.updateCurrentUser(res.data)
        router.push("/account");
      }
    }
  }
})
