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
        first_name: user.firstName,
        last_name: user.lastName,
        user_name: user.username,
        email: user.email,
        password: user.password,
        password_confirmation: user.passwordConfirm
      }
      await fetchWrapper.post(`${baseUrl}users`, newUser)
    }
  }
})
