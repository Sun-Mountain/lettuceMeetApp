<template>
  <nav>
    <v-app-bar
      id="navigation_main"
      prominent
    > 
      <v-toolbar-title>My files</v-toolbar-title>
  
      <v-spacer />
      <v-app-bar-nav-icon variant="text" @click.stop="drawer = !drawer" :fullscreen="!mobile" />
    </v-app-bar>
  
    <v-navigation-drawer
      v-model="drawer"
      location="top"
      temporary
    >
      <v-list
        :items="items"
      ></v-list>
    </v-navigation-drawer>
  </nav>
</template>

<script>
  import { useDisplay } from 'vuetify'
  export default {
    data: () => ({
      drawer: false,
      group: null,
      items: [
        {
          title: 'Foo',
          value: 'foo',
        },
        {
          title: 'Bar',
          value: 'bar',
        },
        {
          title: 'Fizz',
          value: 'fizz',
        },
        {
          title: 'Buzz',
          value: 'buzz',
        },
      ],
    }),

    watch: {
      group () {
        this.drawer = false
      },
    },
    setup: () => {
      const { mobile } = useDisplay();

      return { mobile }
    }
  }
</script>