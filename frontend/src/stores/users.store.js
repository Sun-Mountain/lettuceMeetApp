import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
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
    }
  }
})
