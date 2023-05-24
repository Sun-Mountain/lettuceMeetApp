<template>
  <v-container>
    <div className="stats-container">
      <v-icon color="info" icon="mdi-account-group" size="100px"></v-icon>
      <div className="stats">
        <div className="count">
          <h2>Users: <span className="user-stats-header">{{ userCount }}</span></h2>
        </div>
      </div>
    </div>
  </v-container>
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { useUsersStore } from '@/store';
const usersStore = useUsersStore();

usersStore.getAllUsers();

const { users } = storeToRefs(usersStore);
const userCount = (users.value).length;
</script>