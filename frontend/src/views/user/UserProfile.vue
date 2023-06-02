<template>
  User Profile
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ user: Object })

const { user } = toRefs(props);

const userId = user?.value?.id;
</script>