import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { User } from "@/models/user.model";
import router from "@/router"

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
      await fetchWrapper.post(`${BASE_URL}signup`, newAccount)
    }
  }
})