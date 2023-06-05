<template>
  <v-container class="event-container">
    <h2>{{ stagedEvent.event_title }}</h2>
    <div id="event-date">
      {{ stagedEvent.start_date }} {{ stagedEvent.end_date ? `- ${stagedEvent.end_date}` : null }}
    </div>
    <div className="event-actions-container" v-show="stagedEvent.user_id === currentUser.id">
      <router-link className="edit-link" :to="editLink">
        <v-icon size="16px" color="info" icon="mdi:mdi-square-edit-outline" /> Edit
      </router-link>
      <v-btn
        variant="plain"
        color="error"
        @click="cancelStaged()"
      >
        Cancel Event
      </v-btn>
    </div>
    <h3>About</h3>
    <div id="description-container" :class="{ 'no-description': !stagedEvent.description }">
      {{ stagedEvent.description ?
        stagedEvent.description :
        'No description has been given for the event.'
      }}
    </div>
  </v-container>
</template>

<script lang="ts" setup>
import { useRoute } from 'vue-router';
import { storeToRefs } from 'pinia';
import { useAuthStore, useEventStore } from '@/store';

const authStore = useAuthStore();
const { currentUser } = authStore;
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