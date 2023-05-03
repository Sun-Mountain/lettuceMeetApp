<script setup>
import { fullName } from '@/helpers';
import { useAuthStore } from '@/stores';
const { user } = useAuthStore();
</script>

<template>
  <div>
    <h1> 
      Hi, {{ fullName(user.first_name, user.last_name) }}
    </h1>
    <router-link :to="{ name: 'accountEdit' }">
      Edit
    </router-link>
    <ul>
      <li>
        Username: {{ user.preferred_username }}
      </li>
      <li>
        Email: {{ user.email }}
      </li>
    </ul>
  </div>
</template>

