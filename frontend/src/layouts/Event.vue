<template>
  <v-container class="layout-with-subnav main-content-container">
    <EventSubNav />
    <div class="sub-content-container">
      <router-view />
    </div>
  </v-container>
</template>

<script lang="ts" setup>
import { EventSubNav } from '@/components';
</script>