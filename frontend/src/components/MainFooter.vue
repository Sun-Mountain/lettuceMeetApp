<template>
  <v-footer border>
    <div id="website-links">
      <router-link 
        v-for="link in footerLinks"
        v-bind:key="link.name"
        v-bind:to="link.path"
      >
        {{ link.name }}
      </router-link>
    </div>
    <div id="social-links">
      Social Links Placeholder
    </div>
  </v-footer>
</template>

<script setup lang="ts">
import { footerLinks } from '@/assets/json';
</script>