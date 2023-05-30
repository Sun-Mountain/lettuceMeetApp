<template>
  <UserForm :user="currentUser" />
  <DeleteAccountForm />
</template>

<script lang="ts" setup>
import { DeleteAccountForm, UserForm } from '@/components';
import { useAuthStore } from '@/store';
const { currentUser } = useAuthStore();
</script>