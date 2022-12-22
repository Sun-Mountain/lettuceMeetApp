<script setup>
import { CButton, CForm, CFormInput } from "@coreui/vue";
import { useUsersStore, useAlertStore } from "@/stores";
import { router } from "@/router";
</script>

<template>
  <div>
    <h4>Register</h4>
    <div>
      <CForm @submit="onSubmit">
        <div class="form-group">
          <CFormInput
            name="first_name"
            id="FirstName"
            label="First Name"
            type="text"
            class="form-control"
            v-model="FirstName"
          />
        </div>
        <div class="form-group">
          <CFormInput
            name="last_name"
            id="LastName"
            label="Last Name"
            type="text"
            class="form-control"
            v-model="LastName"
          />
        </div>
        <div class="form-group">
          <CFormInput
            name="user_name"
            id="RegisterUsername"
            label="Username"
            type="text"
            class="form-control"
            v-model="RegisterUsername"
          />
        </div>
        <div class="form-group">
          <CFormInput
            name="email"
            id="RegisterEmail"
            label="Email"
            type="text"
            class="form-control"
            v-model="RegisterEmail"
          />
        </div>
        <div class="form-group">
          <CFormInput
            name="password"
            id="RegisterPassword"
            label="Password"
            type="password"
            class="form-control"
            v-model="RegisterPassword"
          />
        </div>
        <div class="form-group">
          <CFormInput
            name="password_confirmation"
            id="PasswordConfirmation"
            label="Password Confirmation"
            type="password"
            class="form-control"
            v-model="PasswordConfirmation"
          />
        </div>
        <div class="submit-btn-container">
          <CButton type="submit" class="btn btn-primary"> Register </CButton>
          <router-link to="login" class="btn btn-link">Cancel</router-link>
        </div>
      </CForm>
    </div>
  </div>
</template>

<script>
let FirstName,
  LastName,
  RegisterUsername,
  RegisterEmail,
  RegisterPassword,
  PasswordConfirmation;
export default {
  data() {
    return {
      first_name: "",
      last_name: "",
      user_name: "",
      email: "",
      password: "",
      password_confirmation: "",
    };
  },
  methods: {
    async onSubmit(event) {
      event.preventDefault();
      let data = {
        first_name: FirstName,
        last_name: LastName,
        user_name: RegisterUsername,
        email: RegisterEmail,
        password: RegisterPassword,
        password_confirmation: PasswordConfirmation,
      };

      const usersStore = useUsersStore();
      const alertStore = useAlertStore();

      try {
        await usersStore.register(data);
        await router.push("/account/login");
        alertStore.success("Registration successful");
      } catch (error) {
        alertStore.error(error);
      }
    },
  },
};
</script>
