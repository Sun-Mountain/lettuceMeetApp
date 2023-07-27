<template>
  <v-card
    class="user-card"
    variant="outlined"
  >
    <v-card-item>
      <div className="info-container">
        <div className="icon-container"><v-icon color="success" icon="mdi:mdi-sprout" size="50px" /></div>
        <div className="name-container">
          <h2>{{ fullName }}</h2>
          <div className="joined-container">
            Joined on: {{ joinedOn }}
          </div>
        </div>
      </div>
      <div className="badges-container">
        <v-icon color="info" icon="mdi:mdi-shield" v-show="userValue?.admin" />
        <v-icon color="success" icon="mdi:mdi-check-circle" v-if="!userConfirmed" />
        <v-icon color="red-darken-4" icon="mdi:mdi-close-circle" v-else />
      </div>
    </v-card-item>
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ user: Object });

const { user } = toRefs(props);
const userValue = user?.value;
const userConfirmed = !userValue?.confirmed;

const fullName = userValue?.first_name + ' ' + userValue?.last_name;
const createdAt = new Date(userValue?.created_at);
const joinedOn = createdAt.toString()
console.log(userValue)
</script>