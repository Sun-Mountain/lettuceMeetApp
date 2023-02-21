<script setup>
import { storeToRefs } from "pinia";

import { EventForm } from "@/components";

import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
const { user } = storeToRefs(authStore);
</script>

<template>
  <div v-if="user">
    <h1>Hi {{ user?.user_name }}!</h1>
    <p>{{user}}</p>
    <EventForm />
  </div>
  <div v-else>Hello</div>
</template>
