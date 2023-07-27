<template>
  <v-container>
    <Alert />
    <router-view />
  </v-container>
</template>

<script lang="ts" setup>
import { Alert } from '@/components';
</script>
