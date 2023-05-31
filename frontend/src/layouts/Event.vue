<template>
  <v-container class="layout-with-subnav main-content-container">
    <EventSubNav />
    <div class="sub-content-container">
      <EventHeader />
      <v-container>
        <router-view />
      </v-container>
    </div>
  </v-container>
</template>

<script lang="ts" setup>
import { EventHeader, EventSubNav } from '@/components';
</script>