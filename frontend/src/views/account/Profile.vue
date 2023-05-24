<template>
  <div>
    <h2>Welcome, {{ fullname }}</h2>
    <div v-show="currentUser.admin">
      <v-icon size="small" color="info" icon="mdi-star-circle"></v-icon> Admin
    </div>
    <div>
      Profile
      <router-link :to="{ name: 'accountEdit' }">
        Edit
      </router-link>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useAuthStore } from '@/store';
import { userFullName } from '@/helpers';
const authStore = useAuthStore();
const currentUser = authStore.currentUser;

const fullname = userFullName(currentUser.first_name, currentUser.last_name);
</script>