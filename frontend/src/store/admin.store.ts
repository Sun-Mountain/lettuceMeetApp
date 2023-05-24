import { defineStore } from "pinia";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { useAuthStore } from "./auth.store";

export const useAdminStore = defineStore({
  id: "admin",
  state: () => ({
    stats: JSON.parse(localStorage.getItem('stats') || '{}')
  }),
  actions: {
    async getStats() {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id
        const response = await fetchWrapper.get(`${BASE_URL}admin/${userId}`);
        localStorage.setItem("stats", JSON.stringify(response));
      } catch (err) {
        console.log(err);
      }
    }
  }
})