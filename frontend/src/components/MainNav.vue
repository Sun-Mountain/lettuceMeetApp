<template>
  <nav>
    <v-app-bar
      :elevation="0"
      id="main-navigation"
      style="position:relative"
    >
      <div class="nav_logo_container">
        <router-link to="/">
          <img src="@/assets/images/lettuce_nav_logo.png" class="logo" />
        </router-link>
      </div>
      <v-spacer />
      <div class="nav_links_container">
        <router-link
          v-for="link in globalLinks"
          v-bind:key="link.name"
          v-bind:to="link.path"
        >
          {{ link.name }}
        </router-link>
        <router-link
          v-for="link in loggedInLinks"
          v-bind:key="link.name"
          v-bind:to="link.path"
          v-show="authStore.currentUser"
        >
          {{ link.name }}
        </router-link>
        <router-link
          v-for="link in publicLinks"
          v-bind:key="link.name"
          v-bind:to="link.path"
          v-show="!authStore.currentUser"
        >
          {{ link.name }}
        </router-link>
        <v-btn
          @click="authStore.logout()"
          v-show="authStore.currentUser"
        >
          Logout
        </v-btn>
      </div>
    </v-app-bar>
  </nav>
</template>

<script setup lang="ts">
import { globalLinks, loggedInLinks, publicLinks } from '@/assets/json';
import { useAuthStore } from '@/store';

const authStore = useAuthStore();
</script>