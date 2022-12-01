import { defineStore } from "pinia";

export const useAlertStore = defineStore({
  id: "alert",
  state: () => ({
    alert: null,
  }),
  actions: {
    success(message) {
      this.alert = { message, type: "success" };
    },
    error(message) {
      this.alert = { message, type: "danger" };
    },
    clear() {
      this.alert = null;
    },
  },
});
