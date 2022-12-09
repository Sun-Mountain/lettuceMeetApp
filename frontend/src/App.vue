<script setup>
import { Nav } from "@/components/layout";
</script>

<template>
  <div class="app-container">
    <Nav />
    <main>
      <router-view />
    </main>
  </div>
</template>

<style lang="scss">
@import "@/assets/stylesheets/application.scss";
</style>
