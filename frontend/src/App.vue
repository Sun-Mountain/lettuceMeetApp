<script setup>
  import {RouterView} from 'vue-router';
  import Navigation from "./components/Navigation.vue";
</script>

<template>
  <div>
    <header>
      <Navigation />
    </header>

    <main>
      <RouterView />
    </main>
  </div>
</template>

<script>
  export default {
    components: {
      Navigation,
      RouterView
    }
  };
</script>

<style lang="scss">
  @import '@/assets/stylesheets/application.scss';
</style>
