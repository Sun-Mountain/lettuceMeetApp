<template>
  <v-footer border>
    <div id="website-links">
      <div v-for="link in footerLinks" v-bind:key="link.name">
        {{ link.name }} <span v-if="!link.path">(coming soon)</span>
      </div>
    </div>
    <div id="social-links">
      Social Links Placeholder
    </div>
  </v-footer>
</template>

<script setup lang="ts">
import { footerLinks } from '@/assets/json';
</script>