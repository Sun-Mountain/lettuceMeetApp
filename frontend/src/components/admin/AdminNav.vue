<template>
  <div id="admin-nav">
    <div id="admin-link-container">
        <router-link
          v-for="link in adminLinks"
          v-bind:key="link.name"
          v-bind:to="link.path"
        >
          {{ link.name }}
        </router-link>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { adminLinks } from '@/assets/json';
</script>