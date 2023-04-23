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
          email: user.email,
          password: user.password
        }
      }
      await fetchWrapper.post(`${baseUrl}signup`, newUser)
    }
  }
})
