<script setup>
import { CAccordion, CAccordionHeader, CAccordionBody } from "@coreui/vue";
import { ref } from "vue";
import { useAuthStore } from "@/stores";

const authStore = useAuthStore();
const mobileDropDown = ref(false);

function shiftMobileNav() {
  mobileDropDown.value = !mobileDropDown.value;
}
</script>

<template>
  <div>
    <CAccordion flush class="nav_accordion">
      <CAccordionItem>
        <CAccordionHeader @click="shiftMobileNav" class="mobile_nav_header">
          <font-awesome-icon
            class="nav-direction"
            icon="fa-solid fa-angles-up"
            v-show="mobileDropDown"
          />
          <font-awesome-icon
            class="nav-direction"
            icon="fa-solid fa-angles-down"
            v-show="!mobileDropDown"
          />
        </CAccordionHeader>
        <CAccordionBody>
          <div class="nav-links">
            <router-link to="/" class="nav-item nav-link">Home</router-link>
            <router-link
              id="profile"
              to="profile"
              v-show="authStore.user"
              class="nav-item nav-link"
              >Profile</router-link
            >
            <button
              id="logout"
              @click="authStore.logout()"
              v-show="authStore.user"
              class="btn btn-link nav-item nav-link"
            >
              Logout
            </button>
            <router-link
              id="register"
              v-show="!authStore.user"
              to="register"
              class="nav-item nav-link"
              >Register</router-link
            >
          </div>
        </CAccordionBody>
      </CAccordionItem>
    </CAccordion>
  </div>
</template>
