<template>
  <v-app>
    <Navigation />
    <AdminNav
      v-if="Object.keys(toRaw(authStore.currentUser)).length != 0 &&
      toRaw(authStore.currentUser).admin"
    />
    <main>
      <router-view />
    </main>
    <Footer />
  </v-app>
</template>

<script setup lang="ts">
  import "@/assets/stylesheets/application.scss";
  import { toRaw } from "vue";
  import { useAuthStore } from "./store";
  import { AdminNav, Footer, Navigation } from '@/components';

  const authStore = useAuthStore();
</script>
