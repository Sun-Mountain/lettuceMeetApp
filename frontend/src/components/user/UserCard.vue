<template>
  <v-card>
    <div><v-icon color="success" icon="mdi:mdi-sprout" /></div>
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ user: Object })

const { user } = toRefs(props);

console.log(user)
</script>