<template>
  <UserForm :user="currentUser" />
  <PasswordChangeForm />
  <DeleteAccountForm />
</template>

<script lang="ts" setup>
import { DeleteAccountForm, PasswordChangeForm, UserForm } from '@/components';
import { useAuthStore } from '@/store';
const { currentUser } = useAuthStore();
</script>