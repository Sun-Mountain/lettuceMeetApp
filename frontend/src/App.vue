<script setup>
import { Nav } from "@/components/layout";
import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
</script>

<template>
  <div class="app-container" :class="authStore.user">
    <Nav />
    <main>
      <router-view />
    </main>
  </div>
</template>

<style lang="scss">
@import "@/assets/stylesheets/application.scss";
</style>
