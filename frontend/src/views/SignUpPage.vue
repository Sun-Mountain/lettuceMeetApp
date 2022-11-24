<template>
  <div v-if="isLoggedIn">
    You're logged in!
  </div>
  <div v-else>
    <SignUpFormVue />
  </div>
</template>

<script>
  import "@/store/index";
  import { mapGetters } from "vuex";
  import SignUpFormVue from "@/components/SignUpForm.vue";
  export default {
    name: "SignUpPage",
    computed: {
        ...mapGetters(["isLoggedIn"]),
    },
    components: { SignUpFormVue }
  }
</script>