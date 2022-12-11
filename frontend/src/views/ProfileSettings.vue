<script setup>
import { useAlertStore, useAuthStore, useUsersStore } from "@/stores";
import { CButton, CForm, CFormInput } from "@coreui/vue";
import { router } from "@/router";

const authStore = useAuthStore();
const user = authStore.user;
</script>

<template>
  <div class="card">
    <h1>Profile Settings</h1>

    <CForm @submit="onDelete">
      <div class="form-group">
        <CFormInput
          :value="user.first_name"
          name="firstName"
          id="UserFirstName"
          label="First Name"
          type="text"
          class="form-control"
        />
      </div>
      <div class="form-group">
        <CFormInput
          :value="user.last_name"
          name="lastName"
          id="UserLastName"
          label="Last Name"
          type="text"
          class="form-control"
        />
      </div>
      <div class="form-group">
        <CFormInput
          :value="user.email"
          name="email"
          id="UserEmail"
          label="Email"
          type="text"
          class="form-control"
        />
      </div>
      <div class="submit-btn-container">
        <CButton type="submit" color="danger" variant="outline">
          Delete Account
        </CButton>
      </div>
    </CForm>
  </div>
</template>

<script>
export default {
  methods: {
    async onDelete(event) {
      event.preventDefault();
      const usersStore = useUsersStore();
      const alertStore = useAlertStore();
      const authStore = useAuthStore();
      const user = authStore.user;
      let userId = user.id;

      try {
        await usersStore.delete(userId);
        console.log("Maybe?")
        await router.push("/account/login");
        alertStore.success("Registration successful");
      } catch (error) {
        console.log("Boo")
        alertStore.error(error);
      }
    }
  }
}
</script>
