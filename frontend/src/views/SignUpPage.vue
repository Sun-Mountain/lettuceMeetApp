<template>
  <div v-if="isLoggedIn">
    You're logged in!
  </div>
  <div v-else>
    <h3>Sign up!</h3>
    <CForm @submit="onSignUp">
      <div>
        <CFormLabel for="inputEmail">Email</CFormLabel>
        <CFormInput
          type="email"
          id="inputEmail"
          placeholder="name@example.com"
          aria-describedby="exampleFormControlInputHelpInline"
          v-model="signUpEmail"
        />
      </div>
      <div>
        <CFormLabel for="inputPassword2">Password</CFormLabel>
        <CFormInput type="password" id="inputPassword2" placeholder="Password" v-model="signUpPassword" />
      </div>
      <div>
        <CFormLabel for="inputPassword3">Verify Password</CFormLabel>
        <CFormInput type="password" id="inputPassword3" placeholder="Verify Password" v-model="passwordVerify" />
      </div>
      <div class="button-container">
        <CButton
          type="submit"
          color="primary"
          value="Sign Up">Sign Up</CButton>
      </div>
    </CForm>
  </div>
</template>

<script>
  import "@/store/index";
  import { CFormInput } from "@coreui/vue";
  import { mapActions, mapGetters } from "vuex";
  export default {
    name: "SignUpPage",
    computed: {
        ...mapGetters(["isLoggedIn"]),
    },
    data() {
        return {
            signUpEmail: "",
            signUpPassword: "",
            passwordVerify: "",
            errors: "",
        };
    },
    methods: {
        ...mapActions(["registerUser"]),
        onSignUp(event) {
        // Reset the alert to empty
        this.$store.state.errors = "";
        // Verify that the passwords match
        if (this.signUpPassword !== this.passwordVerify) {
          this.$store.state.errors = "Passwords must match";
          return;
        }
          event.preventDefault();
          let data = {
              user: {
                  email: this.signUpEmail,
                  password: this.signUpPassword,
              },
          };
          this.registerUser(data)
          this.resetData();
        },
        resetData() {
          this.signUpEmail = "";
          this.signUpPassword = "";
          this.passwordVerify = "";
          this.loginEmail = "";
          this.loginPassword = "";
        }
    },
    components: { CFormInput }
}
</script>