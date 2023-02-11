<script setup>
import { useAuthStore } from "@/stores";
import { router } from "@/router";
import { Alert } from "@/components";

// redirect home if already logged in
const authStore = useAuthStore();
if (authStore.user) {
  router.push("/");
}
</script>

<template>
  <div class="card">
    <div class="account-form-container form-container">
      <Alert />
      <router-view />
    </div>
  </div>
</template>
