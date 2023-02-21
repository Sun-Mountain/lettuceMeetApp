import { defineStore, storeToRefs } from "pinia";

import { fetchWrapper } from "@/helpers";
import { useAuthStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

const authStore = useAuthStore();
const { user } = storeToRefs(authStore);

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: [],
    user: user,
  }),
  actions: {
    async createEvent(params, user) {
      await fetchWrapper.post(`${baseUrl}/users/${user.id}/events`, params);
    }
  },
});
