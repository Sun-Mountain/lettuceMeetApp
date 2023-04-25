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
    async updateAccount(user) {
      let updateAccount = {
        user: {
          first_name: user.first_name,
          last_name: user.last_name,
          preferred_username: user.username,
          email: user.email,
          current_password: user.current_password,
          password: user.password,
          password_confirmation: user.passwordConfirm
        }
      }
    }
  }
})
