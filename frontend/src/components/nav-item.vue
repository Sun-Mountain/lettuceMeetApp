<script setup>
import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
</script>

<template>
  <nav>
    <div class="nav_logo_container">
      <img src="@/assets/images/lettuce_nav_logo.png" class="logo" />
    </div>
    <div v-show="authStore.user" class="navbar-nav">
      <router-link to="/" class="nav-item nav-link">Home</router-link>
      <router-link to="/users" class="nav-item nav-link">Users</router-link>
      <button
        @click="authStore.logout()"
        class="btn btn-link nav-item nav-link"
      >
        Logout
      </button>
    </div>
  </nav>
</template>
