<template>
  <v-card className="user-card" variant="outlined">
    <div className="icon-container"><v-icon color="success" icon="mdi:mdi-sprout" size="50px" /></div>
    <div className="info-container">
      <h2>{{ fullName }}</h2>
    </div>
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ user: Object })

const { user } = toRefs(props);
const userValue = user?.value;

const fullName = userValue?.first_name + ' ' + userValue?.last_name
</script>