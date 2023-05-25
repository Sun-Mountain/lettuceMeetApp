<template>
  <UserCard v-for="user in users" :key="getUserId(user)" :user="(user as User)" />
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { User } from '@/models/user.model';
import { useUsersStore } from '@/store';

import { UserCard } from '@/components/';

const usersStore = useUsersStore();
usersStore.getAllUsers();

const { users } = storeToRefs(usersStore);

const getUserId = (user) => {
  return user.id as number;
}
</script>