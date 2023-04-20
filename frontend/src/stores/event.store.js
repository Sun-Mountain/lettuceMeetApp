import { defineStore } from "pinia";
import { router } from "@/router";

import { fetchWrapper } from "@/helpers";
import { useAlertStore, useAuthStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: JSON.parse(localStorage.getItem("events")),
    pastEvents: JSON.parse(localStorage.getItem("pastEvents")),
    publicEvents: JSON.parse(localStorage.getItem("publicEvents")),
    publicPastEvents: JSON.parse(localStorage.getItem("publicPastEvents")),
    stagedEvent: {}
  }),
  actions: {
    async createEvent(params) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        await fetchWrapper.post(`${baseUrl}users/${userId}/events`, params);
        this.getAllUserEvents();
        router.push(this.returnUrl || "/events");
        alertStore.success('Event created!')
      } catch (err) {
        alertStore.error(err);
      }
      return this.events;
    },
    async getAllUserEvents() {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        const events = await fetchWrapper.get(
          `${baseUrl}users/${userId}/events`
        );
        this.events = events.upcoming;
        this.pastEvents = events.past;
      } catch (err) {
        alertStore.error(err);
      }
      return this.events;
    },
    async getAllPublicEvents() {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        const publicEvents = await fetchWrapper.get(
          `${baseUrl}users/${userId}/public_events`
        )
        this.publicEvents = publicEvents;
      } catch (err) {
        alertStore.error(err);
      }
    },
    async getEventById(eventId) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        const event = await fetchWrapper.get(
          `${baseUrl}users/${userId}/events/${eventId}`
        );
        this.stagedEvent = event;
      } catch (err) {
        alertStore.error(err);
      }
    },
    async updateEvent(eventId, values) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        const event = await fetchWrapper.put(
          `${baseUrl}users/${userId}/events/${eventId}`, values
        );
        this.stagedEvent = event;
        router.push(this.returnUrl || `/events/${eventId}`);
      } catch (error) {
        alertStore.error(error);
      }
    },
    async cancelEvent(eventId) {
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      try {
        const userId = authStore.user.id;
        await fetchWrapper.delete(`${baseUrl}users/${userId}/events/${eventId}`);
        router.push(this.returnUrl || "/events");
        alertStore.success('Event deleted!')
      } catch (error) {
        alertStore.error(error);
      }
    }
  }
})
