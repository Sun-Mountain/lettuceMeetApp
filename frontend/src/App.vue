<script setup>
import {RouterView} from 'vue-router';
import ErrorMessage from './components/ErrorMessage.vue';
import Navigation from "./components/Navigation.vue";
</script>

<template>
  <div>
    <header>
      <Navigation/>
    </header>

    <main>
      <ErrorMessage />
      <RouterView/>
    </main>
  </div>
</template>

<style lang="scss">
  @import '@/assets/stylesheets/application.scss';
</style>