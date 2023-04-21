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
        preferred_username: user.username,
        email: user.email,
        password: user.password,
        password_confirmation: user.passwordConfirm
      }
      console.log({newUser})
      await fetchWrapper.post(`${baseUrl}sign_up`, newUser)
    }
  }
})
