<template>
  <CAlert color="danger"
          class="d-flex align-items-center"
          v-if="this.$store.state.errors">
    <CIcon icon="cil-warning" class="flex-shrink-0 me-2" width="24" height="24" />
    <div>
      {{ this.$store.state.errors }}
    </div>
  </CAlert>
</template>

<script>
  import "@/store/index";
  export default {
    name: "ErrorMessage"
  };
</script>