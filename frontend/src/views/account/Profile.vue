<template>
  <div>
    <h2>Welcome, {{ fullname }}</h2>

    Profile
  
    <router-link :to="{ name: 'accountEdit' }">
      Edit
    </router-link>
  </div>
</template>

<script lang="ts" setup>
import { useAuthStore } from '@/store';
const { currentUser } = useAuthStore();
import { userFullName } from '@/helpers';

const fullname = userFullName(currentUser.first_name, currentUser.last_name);
</script>