<template>
  <CAlert color="danger"
          class="d-flex align-items-center"
          v-if="this.getAlerts"
          dismissible
          @close="dismiss">
    <CIcon icon="cil-warning" class="flex-shrink-0 me-2" width="24" height="24" />
    <div>
      {{ this.getAlerts }}
    </div>
  </CAlert>
</template>

<script>
  import "@/store/index";
  import { mapActions, mapGetters } from "vuex";
  export default {
    name: "ErrorMessage",
    computed: {
        ...mapGetters(["getAlerts"]),
    },
    methods: {
      dismiss() {
        this.getAlerts = null;
      },
    },
  };
</script>