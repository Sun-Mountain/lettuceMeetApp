import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { useAuthStore } from "@/stores";


const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    ownedEvents: [],
  }),
  actions: {
    async createEvent(event) {
      const authStore = useAuthStore();
      const userId = authStore.user.id;
      await fetchWrapper.post(`${baseUrl}/users/${userId}/events`, event);
    },
    async getAllOwnedEvents() {
      try {
        this.ownedEvents = await fetchWrapper.get(`${baseUrl}`);
      } catch (error) {
        this.ownedEvents = { error };
      }
    },
  },
});
