<script setup>
import { CNav, CNavItem } from "@coreui/vue";
import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
</script>

<template>
  <div>
    <CNav variant="tabs">
      <CNavItem>
        <router-link to="/" class="nav-item nav-link">Home</router-link>
      </CNavItem>
      <CNavItem>
        <router-link
          id="profile"
          to="profile"
          v-show="authStore.user"
          class="nav-item nav-link"
          >Profile</router-link
        >
      </CNavItem>
      <CNavItem>
        <router-link
          id="register"
          v-show="!authStore.user"
          to="register"
          class="nav-item nav-link"
          >Register</router-link
        >
      </CNavItem>
      <CNavItem>
        <button
          id="logout"
          @click="authStore.logout()"
          v-show="authStore.user"
          class="btn btn-link nav-item nav-link"
        >
          Logout
        </button>
      </CNavItem>
    </CNav>
  </div>
</template>
