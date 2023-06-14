<template>
  <v-container>
    <v-container>
      <Alert />
    </v-container>
    <router-view />
  </v-container>
</template>

<script lang="ts" setup>
import { Alert } from '@/components';
</script>
