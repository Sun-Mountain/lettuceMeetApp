<template>
  <v-container>
    <h2>{{ stagedEvent.event_title }}</h2>
    <div>
      <router-link :to="editLink">
        <svg-icon type="mdi" :path="mdiSquareEditOutline"></svg-icon> Edit
      </router-link>
      <v-btn
        variant="plain"
        color="error"
        @click="cancelStaged()"
      >
        Cancel Event
      </v-btn>
    </div>
    {{ stagedEvent}}
  </v-container>
</template>

<script lang="ts" setup>
import SvgIcon from '@jamescoyle/vue-icon';
import { mdiSquareEditOutline } from '@mdi/js';

import { useRoute } from 'vue-router';
import { storeToRefs } from 'pinia';
import { useEventStore } from '@/store';

const eventStore = useEventStore();
const route = useRoute();
const { getEventById, cancelEvent } = eventStore;

let uid: string = route.params.uid as string

getEventById(uid)

const { stagedEvent } = storeToRefs(eventStore);
const editLink = `${uid}/edit`;

async function cancelStaged() {
  cancelEvent(uid);
}
</script>