<script setup>
import { SubNav } from '@/components';
</script>

<template>
  <div class="layout-with-subnav main-content-container">
    <SubNav />
    <div class="sub-content-container">
      <router-view />
    </div>
  </div>
</template>