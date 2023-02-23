<script setup>
import { MobileNav } from ".";
import { DeskNav } from ".";
</script>

<template>
  <nav>
    <div class="nav_logo_container">
      <router-link to="/">
        <img src="@/assets/images/lettuce_nav_logo.png" class="logo" />
      </router-link>
    </div>

    <div class="nav_links_container">
      <MobileNav class="mobile-break" />
      <DeskNav class="desktop-break" />
    </div>
  </nav>
</template>
