<script setup>
import { fullName } from '@/helpers'
import { useAuthStore } from '@/stores';
const { user } = useAuthStore();
console.log(user)
</script>

<template>
  <div>
    {{ fullName(user.first_name, user.last_name) }}
  </div>
</template>

