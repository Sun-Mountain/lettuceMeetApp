<template>
  <v-container>
    <v-container>
      <Alert />
    </v-container>
    <div class="layout-with-subnav main-content-container">
      <EventSubNav />
      <div class="sub-content-container">
        <EventHeader />
        <v-container>
          <router-view />
        </v-container>
      </div>
    </div>
  </v-container>
</template>

<script lang="ts" setup>
import { Alert, EventHeader, EventSubNav } from '@/components';
</script>