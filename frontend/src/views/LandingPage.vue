<template>
  <div>
    <div v-if="isLoggedIn">
      You're logged in!
    </div>
    <div v-else>
      <LoginFormVue />
    </div>
  </div>
</template>

<script>
  import "@/store/index";
  import { mapGetters } from "vuex";
  import LoginFormVue from "@/components/LoginForm.vue";
  export default {
    name: "Landing Page",
    components: {
      LoginFormVue
    },
    computed: {
        ...mapGetters(["isLoggedIn"]),
    }
  };
</script>