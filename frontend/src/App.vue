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
  import { Footer, Navigation } from '@/components';
</script>
