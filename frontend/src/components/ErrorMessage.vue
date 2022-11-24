<template>
  <CAlert color="danger"
          class="d-flex align-items-center"
          v-if="this.$store.state.errors"
          dismissible @close="dismiss">
    <span class="error-icon" style="font-size: 24px;">
      <font-awesome-icon icon="fa-solid fa-triangle-exclamation" />
    </span>
    <div>
      {{ this.$store.state.errors }}
    </div>
  </CAlert>
</template>

<script>
  import "@/store/index";
  export default {
    name: "ErrorMessage",
    methods: {
      dismiss () {
        this.$store.state.errors = ""
      },
    }
  };
</script>