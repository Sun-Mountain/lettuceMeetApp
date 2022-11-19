<template>
  <div v-if="isLoggedIn">
    You're logged in!
  </div>
  <div v-else>
    <h3>Sign up!</h3>
    <CForm @submit="onSignUp">
      <div>
        <CFormInput
          type="email"
          id="exampleFormControlInput1"
          label="Email"
          placeholder="name@example.com"
          aria-describedby="exampleFormControlInputHelpInline"
          v-model="signUpEmail"
        />
      </div>
      <div>
        <CFormLabel for="inputPassword2">Password</CFormLabel>
        <CFormInput type="password" id="inputPassword2" placeholder="Password" v-model="signUpPassword" />
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
            signUpPassword: ""
        };
    },
    methods: {
        ...mapActions(["registerUser"]),
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
        resetData() {
            this.signUpEmail = "";
            this.signUpPassword = "";
            this.loginEmail = "";
            this.loginPassword = "";
        }
    },
    components: { CFormInput }
}
</script>