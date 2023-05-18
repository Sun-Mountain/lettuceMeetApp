<template>
  <UserForm :user="currentUser" />
</template>

<script lang="ts" setup>
import { UserForm } from '@/components';
import { useAuthStore } from '@/store';
const { currentUser } = useAuthStore();
</script>