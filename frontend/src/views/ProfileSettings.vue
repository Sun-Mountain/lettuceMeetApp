<script setup>
import { useAlertStore, useAuthStore, useUsersStore } from "@/stores";
import {
  CAccordion,
  CAccordionBody,
  CAccordionHeader,
  CAccordionItem,
  CButton,
  CForm,
  CFormInput,
} from "@coreui/vue";
import { router } from "@/router";

const authStore = useAuthStore();
const user = authStore.user;
</script>

<template>
  <div>

    <div class="card">
      <h1>Profile Settings</h1>
  
      <CForm @submit="patchUser">
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
        <div class="form-group">
          <CFormInput
            :value="user.user_name"
            name="username"
            id="UserUsername"
            label="Username"
            type="text"
            class="form-control"
          />
        </div>
        <div class="form-group">
          <CFormInput
            type="password"
            id="UserPassword"
            label="Password"
            placeholder="Password"
            v-model="UserPassword"
          />
        </div>
        <div class="submit-btn-container">
          <CButton type="submit" color="primary"> Update Profile </CButton>
        </div>
      </CForm>
    </div>

    <div class="card">
      <div class="delete-accordion-container">
        <CAccordion>
          <CAccordionItem>
            <CAccordionHeader class="delete-btn-container">
              Delete Your Account
            </CAccordionHeader>
            <CAccordionBody>
              <CForm @submit="onDelete">
                <div class="form-group">
                  <CFormInput
                    type="password"
                    id="UserPassword"
                    label="Password"
                    placeholder="Password"
                    v-model="UserPassword"
                  />
                </div>
                <div class="submit-btn-container">
                  <CButton type="submit" color="danger" variant="outline">
                    Delete Account
                  </CButton>
                </div>
              </CForm>
            </CAccordionBody>
          </CAccordionItem>
        </CAccordion>
      </div>
    </div>
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
        await router.push("/account/login");
        alertStore.success("Account successfully deleted");
      } catch (error) {
        alertStore.error(error);
      }
    },

    async patchUser(event) {
      event.preventDefault();
    },
  },
};
</script>
