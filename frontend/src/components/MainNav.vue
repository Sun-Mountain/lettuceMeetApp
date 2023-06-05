<template>
  <nav>
    <v-app-bar
    :elevation="0"
    id="main-navigation"
    style="position:relative"
    >
      <div class="nav_logo_container">
        <router-link to="/">
          <img
            src="@/assets/images/lettuce_nav_logo.png"
            class="logo"
          />
        </router-link>
      </div>
      <v-spacer v-show="mq.mdPlus" />
      <v-btn
        v-show="mq.smMinus"
        :icon="showNav ? 'mdi:mdi-chevron-up-circle' : 'mdi:mdi-chevron-down-circle'"
        @click="showNav = !showNav"
      ></v-btn>
      <v-expand-transition>
        <div class="nav_links_container" v-show="mq.mdPlus || showNav">
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
      </v-expand-transition>
    </v-app-bar>
  </nav>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { globalLinks, loggedInLinks, publicLinks } from '@/assets/json';
import { useAuthStore } from '@/store';
import { useMq } from "vue3-mq";

const mq = useMq();
const authStore = useAuthStore();
const showNav = ref(false)
</script>