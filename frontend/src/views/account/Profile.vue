<template>
  <div>
    <h2>Welcome, {{ fullName }}</h2>
    <div v-show="currentUser.admin" className="role-container">
      <v-icon size="20px" color="info" icon="mdi:mdi-star-circle" /> Admin
    </div>
    <div>
      Profile
      <router-link :to="{ name: 'accountEdit' }">
        Edit
      </router-link>
      <div>
        <v-btn @click="authStore.logout()">
          Logout
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useAuthStore } from '@/store';
import { userFullName } from '@/helpers';
const authStore = useAuthStore();
const currentUser = authStore.currentUser;

const fullName = userFullName(currentUser.first_name, currentUser.last_name);
</script>