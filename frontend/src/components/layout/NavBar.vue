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
      <router-link
        id="profile"
        to="profile"
        v-show="authStore.user"
        class="nav-item nav-link"
        >Profile</router-link
      >
      <button
        id="logout"
        @click="authStore.logout()"
        v-show="authStore.user"
        class="btn btn-link nav-item nav-link"
      >
        Logout
      </button>
      <router-link
        id="register"
        v-show="!authStore.user"
        to="register"
        class="nav-item nav-link"
        >Register</router-link
      >
    </div>
  </nav>
</template>
