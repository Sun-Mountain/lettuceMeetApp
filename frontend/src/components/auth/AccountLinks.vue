<template>
  <v-container>
    <v-card class="form-container" variant="flat">
      <v-card-item>
        <div v-show="page != 'register'">
          Don't have an account?  <router-link to="register">Register Here</router-link>
        </div>
        <div v-show="page != 'login'">
          Have an account?  <router-link to="login">Login Here</router-link>
        </div>
        <div v-show="page != 'password'">
          <router-link to="passwordReset">Forgot your password?</router-link>
        </div>
        <div v-show="page != 'confirmation'">
          <router-link to="confirmationHelp">Didn't receive confirmation instructions?</router-link>
        </div>
      </v-card-item>
    </v-card>
  </v-container>
</template>

<script lang="ts" setup>
import { toRefs } from 'vue';
const props = defineProps({
  page: String
});
const { page } = toRefs(props);
</script>