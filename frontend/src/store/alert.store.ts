import { defineStore } from "pinia";
import { Alert } from "@/models/alert.model";

export const useAlertStore = defineStore({
  id: "alert",
  state: () => ({
    alert: null as Alert | null
  }),
  actions: {
    success(message) {
      this.alert = { message, type: "success" }
    },
    error(message) {
      this.alert = {message, type: "error" }
    },
    clear() {
      this.alert = null;
    }
  }
})
