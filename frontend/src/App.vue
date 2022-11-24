<script setup>
  import {RouterView} from 'vue-router';
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

<script>
  import ErrorMessage from '@/components/ErrorMessage.vue';

  export default {
    components: { ErrorMessage }
  };
</script>

<style lang="scss">
  @import '@/assets/stylesheets/application.scss';
</style>
