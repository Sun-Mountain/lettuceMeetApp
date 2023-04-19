import { defineStore } from "pinia";

export const useLoadingStore = defineStore({
  id: "loading",
  state: () => ({
    loading: false
  }),
  actions: {
    isLoading() {
      let loading = this.loading
      loading = true;
      console.log(`Is Loading: ${loading}`)
    },
    clearLoading() {
      let loading = this.loading
      loading = false;
      console.log(`Is Not Loading: ${loading}`)
    }
  }
})
