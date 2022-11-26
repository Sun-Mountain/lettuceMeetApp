<template>
  <div>
    <h3>Login!</h3>
    <CForm @submit="onLogin">
      <div>
        <CFormInput
          type="email"
          id="exampleFormControlInput1"
          label="Email"
          placeholder="name@example.com"
          aria-describedby="exampleFormControlInputHelpInline"
          v-model="loginEmail"
        />
      </div>
      <div>
        <CFormLabel for="inputPassword2">Password</CFormLabel>
        <CFormInput type="password" id="inputPassword2" placeholder="Password" v-model="loginPassword" />
      </div>
      <div class="button-container">
        <CButton type="submit" color="primary" value="Login">Login</CButton>
      </div>
    </CForm>
  </div>
</template>

<script>
  import "@/store/index";
  import { CButton, CForm, CFormInput, CFormLabel } from "@coreui/vue";
  import { mapActions } from "vuex";
  export default {
    data() {
      return {
        signUpEmail: "",
        signUpPassword: "",
        loginEmail: "",
        loginPassword: "",
        errors: "",
      };
    },
    components: { CButton, CForm, CFormInput, CFormLabel },
    methods: {
      ...mapActions(["loginUser", "logoutUser"]),
      onLogin(event) {
        // Reset the alert to empty
        this.state.errors = "";
        event.preventDefault();
        let data = {
            user: {
                email: this.loginEmail,
                password: this.loginPassword,
            },
        };
        this.loginUser(data)
        this.resetData();
      },
      resetData() {
        this.signUpEmail = "";
        this.signUpPassword = "";
        this.loginEmail = "";
        this.loginPassword = "";
      },
    }
  };
</script>
