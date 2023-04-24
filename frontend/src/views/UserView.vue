<script setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '@/stores';

const userStore = useUsersStore();
const { getCurrentUserProfile } = userStore;
getCurrentUserProfile();

const { currentUserProfile } = storeToRefs(userStore);
console.log(currentUserProfile)
</script>

<template>
  <div>
    Hahaha!
  </div>
</template>

