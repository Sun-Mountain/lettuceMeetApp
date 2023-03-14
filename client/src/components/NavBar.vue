<script setup>
import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
</script>

<template>
  <nav>
    <v-app-bar
      id="navigation_main"
      elevation="0"
      style="position:relative"
    >
      <v-toolbar-title>My files</v-toolbar-title>
      <v-spacer />
      <v-tabs class="d-none d-sm-none d-md-flex">
        <v-tab to="/">Home</v-tab>
        <v-tab to="/login" v-show="!authStore.user">
          Login
        </v-tab>
        <v-tab to="/register" v-show="!authStore.user">
          Register
        </v-tab>
        <v-tab to="profile" v-show="authStore.user">
          Profile
        </v-tab>
        <v-tab 
          id="logout"
          @click="authStore.logout()"
          v-show="authStore.user">Logout</v-tab>
      </v-tabs>
      <v-app-bar-nav-icon class="d-sm-flex d-md-none" variant="text" @click.stop="drawer = !drawer" />
    </v-app-bar>
    <v-navigation-drawer
      class="d-sm-flex d-md-none"
      v-model="drawer"
      location="top"
      temporary
    >
      <v-list nav>
        <v-list-item>
          <router-link to="/">Home</router-link>
        </v-list-item>
        <v-list-item>
          <router-link to="/login" v-show="!authStore.user">
            Login
          </router-link>
        </v-list-item>
        <v-list-item>
          <router-link to="/register" v-show="!authStore.user">
            Register
          </router-link>
        </v-list-item>
        <v-list-item
          id="logout"
          @click="authStore.logout()"
          v-show="authStore.user">Logout</v-list-item>
      </v-list>
    </v-navigation-drawer>
  </nav>
</template>

<script>
export default {
  data: () => ({
    drawer: false
  })
}
</script>

