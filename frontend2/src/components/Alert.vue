<script setup>
import { storeToRefs } from "pinia";

import { useAlertStore } from "@/stores";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);
</script>

<template>
  <v-alert v-if="alert" :text="alert.message" />
</template>
