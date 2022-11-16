<script setup>
import {RouterView} from 'vue-router';
import Navigation from "./components/Navigation.vue";
import SessionManager from "./components/SessionManager.vue";
</script>

<template>
  <Navigation />
  <RouterView />
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>