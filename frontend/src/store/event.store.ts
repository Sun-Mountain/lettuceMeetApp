import { defineStore } from "pinia";
import router from "@/router";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { useAuthStore } from "./auth.store";
import { Event } from "@/models/event.model";

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: JSON.parse(localStorage.getItem('events') || '[]')
  }),
  actions: {
    async createEvent(params: Event) {
      const authStore = useAuthStore();
      try {
        const userId = authStore.currentUser.id;
        params.user_id = userId
        await fetchWrapper.post(`${BASE_URL}users/${userId}/events`, {
          event: params
        });
      } catch (err) {
        console.log(err);
      }
    },
    // async getAllUserEvents() {
    //   const authStore = useAuthStore();
    // }
  }
})