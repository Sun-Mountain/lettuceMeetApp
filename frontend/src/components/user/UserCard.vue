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
        </div>
      </div>
      <div className="badges-container">
        <v-icon color="info" icon="mdi:mdi-shield" v-if="userValue?.admin" />
      </div>
    </v-card-item>
  </v-card>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';

const props = defineProps({ user: Object })

const { user } = toRefs(props);
const userValue = user?.value;

const fullName = userValue?.first_name + ' ' + userValue?.last_name

console.log(userValue)
</script>