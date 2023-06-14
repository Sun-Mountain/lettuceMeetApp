<template>
  <v-alert v-if="alert" :text="alert?.message" />
</template>

<script lang="ts" setup>
import { storeToRefs } from "pinia";
import { useAlertStore } from "@/store";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);
</script>