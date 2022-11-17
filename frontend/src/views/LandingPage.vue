<template>
  <div>
    Landing Page
  </div>
</template>

<script>
  import "@/store/index";
  import { mapActions, mapGetters } from "vuex";
  export default {
    name: "Landing Page",
    computed: {
        ...mapGetters(["getAuthToken", "getUserEmail", "getUserID", "isLoggedIn"]),
    },
    data() {
        return {
        signUpEmail: "",
        signUpPassword: "",
        loginEmail: "",
        loginPassword: "",
        };
    },
    methods: {
        ...mapActions(["registerUser", "loginUser", "logoutUser"]),
        onSignUp(event) {
            event.preventDefault();
            let data = {
            user: {
            email: this.signUpEmail,
            password: this.signUpPassword,
            },
        };
        this.registerUser(data);
        this.resetData();
        },
        onLogin(event) {
            event.preventDefault();
            let data = {
                user: {
                    email: this.loginEmail,
                    password: this.loginPassword,
                },
            };
            this.loginUser(data);
            this.resetData();
        },
        resetData() {
            this.signUpEmail = "";
            this.signUpPassword = "";
            this.loginEmail = "";
            this.loginPassword = "";
        },
    },
  }

</script>