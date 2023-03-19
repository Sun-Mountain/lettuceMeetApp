<script setup>
import { EventSubNav } from '@/components';
</script>

<template>
  <div class="layout-with-subnav main-content-container">
    <EventSubNav />
    <div class="sub-content-container">
      <router-view />
    </div>
  </div>
</template>