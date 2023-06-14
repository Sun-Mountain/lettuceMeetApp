<template v-slot:close="{toggle}">
  <v-alert
    v-if="alert"
    border="start"
    variant="tonal"
    closable
    close-label="Close Alert"
    :title="alert?.type"
    :text="alert?.message"
    :type="alert?.type"
    :icon="alert?.icon"
  >
    <!--  Close slot for custom close behavior -->
    <template v-slot:close="{toggle}">
      <v-btn @click="closeAlert(toggle)">
        <v-icon size="22px" icon="mdi:mdiClose" />
      </v-btn>
    </template>
    <!--    -->
  </v-alert>
</template>

<script lang="ts" setup>
import { storeToRefs } from "pinia";
import { useAlertStore } from "@/store";

const alertStore = useAlertStore();
const { alert } = storeToRefs(alertStore);

const closeAlert = (toggle) => {
  alertStore.clear();
}
</script>