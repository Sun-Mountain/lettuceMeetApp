<script setup>
import { storeToRefs } from "pinia";

import { useAlertStore } from "@/stores";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);
console.log(alert.message);
</script>

<template>
  <div v-if="alert" class="alert-container">
    <div class="alert alert-dismissable" :class="alert.type">
      {{ alert.message }}
      <button @click="alertStore.clear()" class="btn btn-link close">×</button>
    </div>
  </div>
</template>
