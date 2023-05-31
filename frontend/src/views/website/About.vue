<template>
  <v-container>
    <v-container>
      <h1>Welcome to the Lettuce Meet App alpha!</h1>
        <p>
          Lettuce Meet App started as a joke in 2019 at a coding bootcamp and evolved into a passion project and professional development exercise. This application is currently in alpha (otherwise known as: not its final form).
        </p>
      <h2 class="construction-header">
        <v-icon color="orange-darken-2" icon="mdi:mdi-progress-wrench" />
        Under Construction
        <v-icon color="orange-darken-2" icon="mdi:mdi-progress-wrench" />
      </h2>
        <p>
          This site is currently in the progress of being built. This may mean users may experience outages in some features.
        </p>
      <h2>Our Goal</h2>
        <p>
          To make organizing events--private or public, personal or professional--easy.
        </p>
        <p>
          Community is how we thrive, but nothing is more painful than trying to wrangle human beings. It has been compared to herding cats, but at least cats are territorial and can be generally counted on to show up for food (eventually).
        </p>
        <p>
          Simply, Lettuce Meet wants its users to be able to create events, invite people (whether or not they're on the application) and allow invitees to respond to the invitation.
        </p>
    </v-container>
    <BackToHome />
  </v-container>
</template>

<script lang="ts" setup>
import { BackToHome } from '@/components';
</script>