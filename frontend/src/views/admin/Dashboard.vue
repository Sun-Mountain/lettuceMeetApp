<template>
  <v-container>
    <DashCard
      :count="upcomingCount"
      :header_class="'event-stats-header'"
      :icon_color="'success'"
      :icon_name="'mdi:mdi-calendar-multiple'"
      :path_name="'eventManager'"
      :sub="`Total: ${eventCount}`"
      :title="'Upcoming Events'"
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
import { DashCard } from '@/components';
import { useAdminStore } from '@/store';
const adminStore = useAdminStore();

adminStore.getStats();

const eventCount = adminStore.stats.events.all;
const upcomingCount = adminStore.stats.events.upcoming;
const userCount = adminStore.stats.users;
</script>