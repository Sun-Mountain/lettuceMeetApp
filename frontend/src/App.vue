<template>
  <v-app>
    <Navigation />
    <v-main>
      <HelloWorld />
    </v-main>
    <Footer />
  </v-app>
</template>

<script setup lang="ts">
  import HelloWorld from '@/components/HelloWorld.vue'
  import { Footer, Navigation } from '@/components';
</script>
