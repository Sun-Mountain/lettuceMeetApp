import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: [],
  }),
  actions: {
    async createEvent(params, userId) {
      await fetchWrapper.post(`${baseUrl}/users/${userId}/events`, params);
      this.getAllUserEvents(userId);
    },
    async getAllUserEvents(userId) {
      try {
        this.events = await fetchWrapper.get(
          `${baseUrl}/users/${userId}/events`
        );
      } catch (error) {
        this.events = { error }
      }
    }
  },
});
