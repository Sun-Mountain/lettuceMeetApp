<template>
  <v-card>
    <h2>{{ event?.event_title }}</h2>
    <div>
      {{ event?.start_date }}
    </div>

    {{ event }}
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ event: Object })

const { event } = toRefs(props);
</script>