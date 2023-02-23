<script setup>
import { useAuthStore } from "@/stores";
import { router } from "@/router";
import { Alert } from "@/components";
</script>

<template>
  <div class="card">
    <router-view />
  </div>
</template>