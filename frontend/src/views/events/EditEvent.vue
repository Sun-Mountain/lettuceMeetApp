<template>
  <EventForm :uid="(uid as string)" />
</template>

<script lang="ts" setup>
import { useRoute } from 'vue-router';
import { EventForm } from '@/components';

const route = useRoute();
const uid = route.params.uid;
</script>