<script setup>
import { useRoute } from 'vue-router';

import { EventForm } from '@/components';

const route = useRoute();
const uid = route.params.uid;
</script>

<template>
  <div>
    <EventForm :uid="uid" />
  </div>
</template>
