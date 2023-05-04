import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import router from "@/router";

export const useAuthStore = defineStore({
  id: "auth",
  state: () => ({
    token: '',
    currentUser: '',
    returnUrl: null
  })
})
