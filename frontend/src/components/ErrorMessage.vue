<template>
  <CAlert color="danger"
          class="d-flex align-items-center"
          v-if="this.state.errors"
          dismissible @close="dismiss">
    <span class="error-icon" style="font-size: 24px;">
      <font-awesome-icon icon="fa-solid fa-triangle-exclamation" />
    </span>
    <div>
      {{ this.state.errors }}
    </div>
  </CAlert>
</template>

<script>
  import "@/store/index";
  import { CAlert } from "@coreui/vue";
  export default {
    components: {
      CAlert
    },
    name: "ErrorMessage",
    methods: {
      dismiss () {
        this.state.errors = ""
      },
    }
  };
</script>