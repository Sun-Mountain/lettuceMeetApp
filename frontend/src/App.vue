<script setup>
import {RouterView} from 'vue-router';
import Navigation from "./components/Navigation.vue";
</script>

<template>
  <div class="container">
    <header>
      <Navigation/>
    </header>

    <main>
      <RouterView/>
    </main>
  </div>
</template>

<style lang="scss">
  @import '@/assets/stylesheets/application.scss';
</style>