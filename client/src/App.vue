<script setup>
  import { Alert, Nav } from '@/components';
</script>

<template>
  <v-app>
    <Nav />
    <v-main style="max-width: 1200px; padding-top: 0">
      <Alert />
      <router-view />
    </v-main>
  </v-app>
</template>

<style lang="scss">
@import "@/assets/stylesheets/application.scss";
</style>

