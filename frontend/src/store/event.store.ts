import { defineStore } from "pinia";
import router from "@/router";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { useAlertStore, useAuthStore } from "@/store";
import { Event } from "@/models/event.model";

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    allEvents: JSON.parse(localStorage.getItem('allEvents') || '[]'),
    events: JSON.parse(localStorage.getItem('events') || '[]'),
    pastEvents: JSON.parse(localStorage.getItem("pastEvents") || '[]'),
    stagedEvent: JSON.parse(localStorage.getItem("stagedEvent") || '{}')
  }),
  actions: {
    async createEvent(params: Event) {
      const authStore = useAuthStore();
      const alertStore = useAlertStore();
      try {
        const userId = authStore.currentUser.id;
        params.user_id = userId
        await fetchWrapper.post(`${BASE_URL}users/${userId}/events`, {
          event: params
        });
        this.getAllUserEvents();
        router.push("/events");
        alertStore.success("Yay")
      } catch (err) {
        alertStore.error(err)
      }
    },
    async getAllEvents() {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id;
        const allEvents = await fetchWrapper.get(`${BASE_URL}users/${userId}/events`)
        localStorage.setItem("allEvents", JSON.stringify(allEvents));
      } catch (err) {
        console.log(err);
      }
    },
    async getAllUserEvents() {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id;
        const events = await fetchWrapper.get(`${BASE_URL}users/${userId}/owned`)
        localStorage.setItem("events", JSON.stringify(events.upcoming));
        localStorage.setItem("pastEvents", JSON.stringify(events.past));
      } catch (err) {
        console.log(err);
      }
      return this.events;
    },
    async getEventById(eventId: string) {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id;
        const event = await fetchWrapper.get(`${BASE_URL}users/${userId}/events/${eventId}`);
        this.stagedEvent = event;
      } catch (err) {
        console.log(err);
      }
    },
    async updateEvent(eventId: string, values: Event) {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id;
        const event = await fetchWrapper.put(`${BASE_URL}users/${userId}/events/${eventId}`, values)
        this.stagedEvent = event;
        router.push(`events/${eventId}`)
      } catch (err) {
        console.log(err)
      }
    },
    async cancelEvent(eventId: string) {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id;
        await fetchWrapper.delete(`${BASE_URL}users/${userId}/events/${eventId}`);
        router.push("/events");
      } catch (err) {
        console.log(err);
      }
    }
  }
})