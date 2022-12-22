import { defineStore } from "pinia";

import { fetchWrapper } from "@/helpers";
import { useAuthStore } from "@/stores";

const baseUrl = `${import.meta.env.VITE_API_URL}`;

export const useUsersStore = defineStore({
  id: "users",
  state: () => ({
    users: {},
    user: {},
  }),
  actions: {
    async register(user) {
      await fetchWrapper.post(`${baseUrl}/users`, user);
    },
    async getAll() {
      this.users = { loading: true };
      try {
        this.users = await fetchWrapper.get(baseUrl);
      } catch (error) {
        this.users = { error };
      }
    },
    async getById(id) {
      this.user = { loading: true };
      try {
        this.user = await fetchWrapper.get(`${baseUrl}/${id}`);
      } catch (error) {
        this.user = { error };
      }
    },
    async update(id, params) {
      await fetchWrapper.put(`${baseUrl}/users/${id}`, params);

      // update stored user if the logged in user updated their own record
      const authStore = useAuthStore();
      if (id === authStore.user.id) {
        // update local storage
        const user = { ...authStore.user, ...params };
        localStorage.setItem("user", JSON.stringify(user));

        // update auth user in pinia state
        authStore.user = user;
      }
    },
    async delete(id) {
      // add isDeleting prop to user being deleted
      // this.users.find((x) => x.id === id).isDeleting = true;

      await fetchWrapper.delete(`${baseUrl}/users/${id}`);

      // auto logout if the logged in user deleted their own record
      const authStore = useAuthStore();
      if (id === authStore.user.id) {
        authStore.logout();
      }
    },
  },
});
