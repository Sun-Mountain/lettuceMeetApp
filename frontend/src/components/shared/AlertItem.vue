<template>
  <v-alert
    v-model="alert"
    border="start"
    variant="tonal"
    closable
    close-label="Close Alert"
    color="deep-purple-accent-4"
    title="Closable Alert"
  >
    Aenean imperdiet. Quisque id odio. Cras dapibus. Pellentesque ut neque. Cras dapibus.

    Vivamus consectetuer hendrerit lacus. Sed mollis, eros et ultrices tempus, mauris ipsum aliquam libero, non adipiscing dolor urna a orci. Sed mollis, eros et ultrices tempus, mauris ipsum aliquam libero, non adipiscing dolor urna a orci. Curabitur blandit mollis lacus. Curabitur ligula sapien, tincidunt non, euismod vitae, posuere imperdiet, leo.
  </v-alert>
  <!-- <v-alert
    v-if="alert"
    border="start"
    variant="tonal"
    closable
    close-label="Close Alert"
    :title="alert?.type"
    :text="alert?.message"
    :type="alert?.type"
    :icon="alert?.icon"
  /> -->
</template>

<script lang="ts" setup>
import { storeToRefs } from "pinia";
import { useAlertStore } from "@/store";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);
</script>