<template>
  <nav>
    <v-app-bar
      id="navigation_main"
      prominent
    >
      <v-app-bar-nav-icon variant="text" @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
  
      <v-toolbar-title>My files</v-toolbar-title>
  
      <v-spacer></v-spacer>
  
      <v-btn variant="text" icon="mdi-magnify"></v-btn>
  
      <v-btn variant="text" icon="mdi-filter"></v-btn>
  
      <v-btn variant="text" icon="mdi-dots-vertical"></v-btn>
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
  }
</script>