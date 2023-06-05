<template>
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
    <mq-layout mq="md+">

    </mq-layout>
    <div class="nav_links_container">
      <router-link
        v-for="link in importedLinks?.globalLinks"
        v-bind:key="link.name"
        v-bind:to="link.path"
      >
        {{ link.name }}
      </router-link>
      <router-link
        v-for="link in importedLinks?.loggedInLinks"
        v-bind:key="link.name"
        v-bind:to="link.path"
        v-show="currentUser"
      >
        {{ link.name }}
      </router-link>
      <router-link
        v-for="link in importedLinks?.publicLinks"
        v-bind:key="link.name"
        v-bind:to="link.path"
        v-show="!currentUser"
      >
        {{ link.name }}
      </router-link>
      <v-btn
        @click="useAuthStore().logout()"
        v-show="currentUser"
      >
        Logout
      </v-btn>
    </div>
  </v-app-bar>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';
import { useAuthStore } from '@/store';

const props = defineProps({
  currentUser: Object, 
  importedLinks: Object
})

const { currentUser, importedLinks } = toRefs(props);
</script>