import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { useAuthStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: JSON.parse(localStorage.getItem("events")),
  }),
  actions: {
    async createEvent(params) {
      const authStore = useAuthStore();
      const userId = authStore.user.id;
      await fetchWrapper.post(`${baseUrl}/users/${userId}/events`, params);
      this.getAllUserEvents(userId);
    },
    async getAllUserEvents() {
      const authStore = useAuthStore();
      const userId = authStore.user.id;
      try {
        const events = await fetchWrapper.get(
          `${baseUrl}/users/${userId}/events`
        );
        this.events = events;
        localStorage.setItem("events", JSON.stringify(events));
      } catch (error) {
        this.events = { error }
      }
      return this.events
    }
  },
});
