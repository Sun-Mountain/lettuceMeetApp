<template>
  <v-app>
    <Navigation />
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
