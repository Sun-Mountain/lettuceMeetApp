<script setup>
import { useRoute } from 'vue-router'
import { storeToRefs } from 'pinia'
import { useEventStore } from "@/stores";

const route = useRoute();
const uid = route.params.uid;
const eventStore = useEventStore();
const { getEventById, cancelEvent } = eventStore;

getEventById(uid);

const { stagedEvent } = storeToRefs(eventStore);
const editLink = `edit/${uid}`;

async function cancelStaged() {
  cancelEvent(uid);
}
</script>

<template>
  <div>
    <div class="staged-event-header">
      <h2>{{ stagedEvent.eventTitle }}</h2>
      <div class="staged-event-byline">
        <div>
          {{ stagedEvent.startDate }}
        </div>
        <div>
          <router-link :to="editLink">
            Edit
          </router-link>
          <v-btn
            variant="plain"
            color="error"
            @click="cancelStaged()"
          >
            Cancel Event
          </v-btn>
        </div>
      </div>
    </div>
    <div class="staged-event-details">
      {{ stagedEvent }}
    </div>
  </div>
</template>
