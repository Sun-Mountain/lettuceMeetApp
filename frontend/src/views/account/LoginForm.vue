<script setup>
import { CButton, CForm, CFormInput } from "@coreui/vue";

import { useAuthStore } from "@/stores";
</script>

<template>
  <div id="login-form">
    <h3>Login!</h3>
    <CForm @submit="onSubmit">
      <div class="form-group">
        <CFormInput
          type="email"
          id="LoginEmail"
          label="Email"
          placeholder="name@example.com"
          aria-describedby="exampleFormControlInputHelpInline"
          v-model="LoginEmail"
        />
      </div>
      <div class="form-group">
        <CFormInput
          type="password"
          id="LoginPassword"
          label="Password"
          placeholder="Password"
          v-model="LoginPassword"
        />
      </div>
      <div class="submit-btn-container">
        <CButton type="submit" color="primary" value="Login">Login</CButton>
        <router-link to="register" class="btn btn-link">Register</router-link>
      </div>
    </CForm>
  </div>
</template>

<script>
let LoginEmail, LoginPassword;
export default {
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    async onSubmit(event) {
      event.preventDefault();
      let data = {
        email: LoginEmail,
        password: LoginPassword,
      };
      const authStore = useAuthStore();
      const { email, password } = data;
      await authStore.login(email, password);
      this.resetData();
    },
    resetData() {
      this.email = "";
      this.password = "";
    },
  },
};
</script>
