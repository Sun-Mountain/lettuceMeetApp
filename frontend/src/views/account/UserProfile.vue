<script setup>
import { storeToRefs } from "pinia";
import { useAuthStore } from "@/stores";
const authStore = useAuthStore();
const { user } = storeToRefs(authStore);
</script>

<template>
  <div>User Profile</div>
</template>
