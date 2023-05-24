<template>
  <router-link className="stats-container-link" :to="{ name: path_name }">
    <v-icon :color="icon_color" :icon="icon_name" size="100px"></v-icon>
    <div className="stats">
      <div className="count">
        <h2>{{ title }}: <span :className="header_class">{{ count }}</span></h2>
      </div>
    </div>
  </router-link>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ count: String, header_class: String, icon_color: String, icon_name: String, path_name: String, title: String })

const { count, header_class, icon_color, icon_name, path_name, title } = toRefs(props);
</script>