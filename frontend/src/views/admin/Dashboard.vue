<template>
  <v-container>
    <DashCard
      :count="eventCount"
      :header_class="'event-stats-header'"
      :icon_color="'success'"
      :icon_name="'mdi:mdi-calendar-multiple'"
      :path_name="'eventManager'"
      :title="'Events'"
    />
    <DashCard
      :count="userCount"
      :header_class="'user-stats-header'"
      :icon_color="'info'"
      :icon_name="'mdi:mdi-account-group'"
      :path_name="'userManager'"
      :title="'Users'"
    />
  </v-container>
</template>

<script lang="ts" setup>
import { storeToRefs } from 'pinia';
import { DashCard } from '@/components';
import { useEventStore, useUsersStore } from '@/store';
const usersStore = useUsersStore();
const eventStore = useEventStore();

usersStore.getAllUsers();
eventStore.getAllEvents();

const { users } = storeToRefs(usersStore);
const userCount = (users.value).length;

const { allEvents } = storeToRefs(eventStore);
const eventCount = (allEvents.value).length;
</script>