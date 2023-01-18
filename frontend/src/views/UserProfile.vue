<script setup>
import { reactive } from "vue";
import { useAlertStore, useAuthStore, useUsersStore } from "@/stores";
import { Alert } from "@/components";
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

const alertStore = useAlertStore();
const authStore = useAuthStore();
const usersStore = useUsersStore();

const user = authStore.user;

const userProfile = reactive({
  _id: user.id,
  firstName: user.first_name,
  lastName: user.last_name,
  userName: user.user_name,
  userEmail: user.email,
  userOldPassword: "",
  userNewPassword: "",
  userNewPasswordConfirm: "",
  passwordToDelete: "",
});

async function editUserProfile(event) {
  event.preventDefault();
  const data = {
    first_name: userProfile.firstName,
    last_name: userProfile.lastName,
    user_name: userProfile.userName,
    email: userProfile.userEmail,
    password: userProfile.userOldPassword,
  };
  try {
    await usersStore.update(userProfile._id, data);
    userProfile.userOldPassword = "";
    alertStore.success("Updated!");
  } catch (error) {
    alertStore.error(error);
  }
}

async function deleteUser(event) {
  event.preventDefault();
  const data = {
    password: userProfile.passwordToDelete,
  };
  try {
    await usersStore.delete(userProfile._id, data);
    await router.push("/account/login");
    alertStore.success("Account successfully deleted");
  } catch (error) {
    alertStore.error(error);
  }
}
</script>

<template>
  <div>
    <div class="card">
      <Alert />
      <h1>Profile Settings</h1>
      <CForm @submit="editUserProfile">
        <div class="form-group">
          <CFormInput
            class="form-control"
            id="UserFirstName"
            label="First Name"
            name="firstName"
            type="text"
            :value="userProfile.firstName"
            v-model="userProfile.firstName"
          />
        </div>
        <div class="form-group">
          <CFormInput
            class="form-control"
            id="UserLastName"
            label="Last Name"
            name="lastName"
            type="text"
            :value="userProfile.lastName"
            v-model="userProfile.lastName"
          />
        </div>
        <div class="form-group">
          <CFormInput
            class="form-control"
            id="UserEmail"
            label="Email"
            name="email"
            type="text"
            :value="userProfile.userEmail"
            v-model="userProfile.userEmail"
          />
        </div>
        <div class="form-group">
          <CFormInput
            class="form-control"
            id="UserUsername"
            label="Username"
            name="username"
            type="text"
            :value="userProfile.userName"
            v-model="userProfile.userName"
          />
        </div>
        <div class="form-group">
          <CFormInput
            id="OldPassword"
            label="Password"
            placeholder="Password"
            type="password"
            v-model="userProfile.userOldPassword"
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
              <CForm @submit="deleteUser">
                <div class="form-group">
                  <CFormInput
                    type="password"
                    id="passwordToDelete"
                    label="Password"
                    placeholder="Password"
                    v-model="userProfile.passwordToDelete"
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
