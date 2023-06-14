<template>
  <v-alert
    v-if="alert"
    :title="alert?.type"
    :text="alert?.message"
    :type="alert?.type"
    :icon="alert?.icon"
  />
</template>

<script lang="ts" setup>
import { storeToRefs } from "pinia";
import { useAlertStore } from "@/store";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);

const icon = (type) => {
  console.log(`$${type}`)
  return `$${type}`;
}
</script>