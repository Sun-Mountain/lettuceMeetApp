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
      <ErrorMessageVue />
      <RouterView />
    </main>
  </div>
</template>

<script>
  import ErrorMessageVue from '@/components/ErrorMessage.vue';

  export default {
    components: { ErrorMessageVue }
  };
</script>

<style lang="scss">
  @import '@/assets/stylesheets/application.scss';
</style>
