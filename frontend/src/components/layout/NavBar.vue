<script setup>
import { MobileNav } from "../mobile";
import { DeskNav } from "../desktop";
</script>

<template>
  <nav>
    <div class="nav_logo_container">
      <img src="@/assets/images/lettuce_nav_logo.png" class="logo" />
    </div>

    <div class="nav_links_container">
      <MobileNav class="mobile-break" />
      <DeskNav class="desktop-break" />
    </div>
  </nav>
</template>
