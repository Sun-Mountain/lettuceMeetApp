import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { User } from "@/models/user.model";
import router from "@/router"

const baseURL = `${import.meta.env.VITE_API_URL}`

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
    users: []
  }),
  actions: {
    async register(user: User) {
      const newAccount = {
        user: user
      }
      await fetchWrapper.post(`${baseURL}signup`, newAccount)
    }
  }
})