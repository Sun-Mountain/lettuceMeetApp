<template>
  <v-footer border>
    <div v-for="link in footerLinks" v-bind:key="link.name">
      {{ link.name }} <span v-if="!link.path">(coming soon)</span>
    </div>
  </v-footer>
</template>

<script setup lang="ts">
import { footerLinks } from '@/assets/json';
</script>