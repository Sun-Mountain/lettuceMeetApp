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
          v-for="link in navLinks"
          v-bind:key="link.name"
          v-bind:to="link.path"
        >
          {{ link.name }}
        </router-link>
      </div>
    </v-app-bar>
  </nav>
</template>

<script setup lang="ts">
import { navLinks } from '@/assets/json';
</script>