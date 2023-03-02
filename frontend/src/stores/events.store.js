import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { useAlertStore, useAuthStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: JSON.parse(localStorage.getItem("events")),
    stagedEvent: {},
  }),
  actions: {
    async createEvent(params) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        await fetchWrapper.post(`${baseUrl}/users/${userId}/events`, params);
        this.getAllUserEvents(userId);
      } catch (error) {
        alertStore.error(error);
      }
    },
    async getAllUserEvents() {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        const events = await fetchWrapper.get(
          `${baseUrl}/users/${userId}/events`
        );
        this.events = events;
        localStorage.setItem("events", JSON.stringify(events));
      } catch (error) {
        alertStore.error(error);
      }
      return this.events;
    },
    async getEventById(eventId) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        const event = await fetchWrapper.get(
          `${baseUrl}/users/${userId}/events/${eventId}`
        );
        this.stagedEvent = event;
      } catch (error) {
        alertStore.error(error);
      }
    }
  },
});
