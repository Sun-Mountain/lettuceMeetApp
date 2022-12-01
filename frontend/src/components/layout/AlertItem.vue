<script setup>
import { storeToRefs } from "pinia";
import { CAlert } from "@coreui/vue";

import { useAlertStore } from "@/stores";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);
</script>

<template>
  <div class="alert-container">
    <CAlert
      v-if="alert"
      dismissible
      :color="alert.type"
      @close="alertStore.clear()"
    >
      {{ alert.message }}
    </CAlert>
  </div>
</template>
