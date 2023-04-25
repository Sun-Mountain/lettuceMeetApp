<script setup>
import { useAuthStore } from '@/stores';
const { user } = useAuthStore();
console.log(user)
</script>

<template>
  <div>
    Hahaha!
  </div>
</template>

