<script setup>
import { RegisterUserForm } from '@/components';
import { useAuthStore } from '@/stores';
const { user } = useAuthStore();
console.log(typeof(user))
</script>

<template>
  <div>
    <RegisterUserForm :user="user" />
  </div>
</template>