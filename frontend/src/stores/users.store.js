import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { useAlertStore, useAuthStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
    currentUserProfile: {},
    users: []
  }),
  actions: {
    async register(user) {
      let newUser = {
        user: {
          first_name: user.firstName,
          last_name: user.lastName,
          preferred_username: user.username,
          email: user.email,
          password: user.password,
          password_confirmation: user.passwordConfirm
        }
      }
      await fetchWrapper.post(`${baseUrl}signup`, newUser)
    },
    async getCurrentUserProfile() {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        console.log(userId)
        const profile = await fetchWrapper.get(
          `${baseUrl}users/${userId}`
        );
        this.currentUserProfile = profile;
      } catch (err) {
        alertStore.error(err)
      }
    }
  }
})
