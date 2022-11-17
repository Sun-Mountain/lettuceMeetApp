<template>
  <nav>
    <div class="nav_logo_container">
      <img src="@/assets/images/lettuce_logo_ph.png" class="logo" />
    </div>
    <div class="nav_links_container">
      <CAccordion flush class="nav_accordion">
        <CAccordionItem>
          <CAccordionHeader @click="activeDropDown = !activeDropDown">
            <div v-if="activeDropDown">
              <span style="font-size: 25px;">
                <font-awesome-icon icon="fa-solid fa-angles-up" class="nav-direction" />
              </span>
            </div>
            <div v-else>
              <span style="font-size: 25px;">
                <font-awesome-icon icon="fa-solid fa-angles-down" class="nav-direction" />
              </span>
            </div>
          </CAccordionHeader>
          <CAccordionBody>
            <div class="nav-links">
              <RouterLink :to="{name: 'home'}">Home</RouterLink>
              <button @click="logoutUser" class="logout-button" v-if="isLoggedIn">Logout</button>
              <RouterLink :to="{name: 'signup'}" v-if="!isLoggedIn">Sign Up</RouterLink>
            </div>
          </CAccordionBody>
        </CAccordionItem>
      </CAccordion>
    </div>
  </nav>
</template>
    
<script>
  import { mapActions, mapGetters } from "vuex";
  import { CAccordion, CAccordionHeader, CAccordionBody } from '@coreui/vue';
  export default {
    name: "Navigation",
    computed: {
        ...mapGetters(["isLoggedIn"]),
    },
    data() {
      return {
        activeDropDown: false
      }
    },
    methods: {
        ...mapActions(["logoutUser"])
    }
  }
</script>