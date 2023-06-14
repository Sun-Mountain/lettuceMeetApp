import { defineStore } from "pinia";
import { Alert } from "@/models/alert.model";

export const useAlertStore = defineStore({
  id: "alert",
  state: () => ({
    alert: null as Alert | null
  }),
  actions: {
    success(message) {
      this.alert = { message, type: "success", icon: "mdi:mdi-checkbox-marked-circle" }
    },
    error(message) {
      this.alert = {message, type: "error", icon: "mdi:mdi-alert" }
    },
    clear() {
      this.alert = null;
    }
  }
})
