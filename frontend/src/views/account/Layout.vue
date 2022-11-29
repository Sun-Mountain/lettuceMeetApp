<script setup>
import { useAuthStore } from "@/stores";
import { router } from "@/router";

// redirect home if already logged in
const authStore = useAuthStore();
if (authStore.user) {
  router.push("/");
}
</script>

<template>
  <div class="card">
    <div class="form-container">
      <router-view />
    </div>
  </div>
</template>
