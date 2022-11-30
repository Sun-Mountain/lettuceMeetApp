<script setup>
import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
</script>

<template>
  <nav>
    <div class="nav_logo_container">
      <img src="@/assets/images/lettuce_nav_logo.png" class="logo" />
    </div>
    <div class="nav_links_container">
      <router-link to="/" class="nav-item nav-link">Home</router-link>
      <router-link v-show="authStore.user" to="/users" class="nav-item nav-link"
        >Users</router-link
      >
      <button
        @click="authStore.logout()"
        v-show="authStore.user"
        class="btn btn-link nav-item nav-link"
      >
        Logout
      </button>
      <router-link
        v-show="!authStore.user"
        to="register"
        class="nav-item nav-link"
        >Register</router-link
      >
    </div>
  </nav>
</template>
