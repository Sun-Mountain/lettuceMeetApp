import { defineStore } from "pinia";
import router from "@/router";

import { BASE_URL, fetchWrapper } from "@/helpers";
import { useAuthStore } from "./auth.store";
import { Event } from "@/models/event.model";

export const useEventStore = defineStore({
  id: "events",
  state: () => ({
    events: JSON.parse(localStorage.getItem('events') || '[]')
  })
})