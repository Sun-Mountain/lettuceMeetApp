import { defineStore } from "pinia";

export const useAlertStore = defineStore({
  id: "alert",
  state: () => ({
    alert: null as Object | null
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
