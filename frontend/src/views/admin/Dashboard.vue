<template>
  <v-container>
    <DashCard
      :count="userCount"
      :header_class="'user-stats-header'"
      :icon_color="'success'"
      :icon_name="'mdi-account-group'"
      :path_name="'eventManager'"
      :title="'Events'"
    />
    <DashCard
      :count="userCount"
      :header_class="'user-stats-header'"
      :icon_color="'info'"
      :icon_name="'mdi-account-group'"
      :path_name="'userManager'"
      :title="'Users'"
    />
  </v-container>
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { DashCard } from '@/components';
import { useUsersStore } from '@/store';
const usersStore = useUsersStore();

usersStore.getAllUsers();

const { users } = storeToRefs(usersStore);
const userCount = (users.value).length;
</script>