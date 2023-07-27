<template>
  <v-app>
    <Navigation />
    <AdminNav v-show="authStore.currentUser && userAdmin(authStore.currentUser)"  />
    <main>
      <router-view />
    </main>
    <Footer />
  </v-app>
</template>

<script setup lang="ts">
import "@/assets/stylesheets/application.scss";
import { AdminNav, Footer, Navigation } from '@/components';
import { useAuthStore } from '@/store';
import { userAdmin } from "./helpers";
const authStore = useAuthStore();
</script>
