import { createApp } from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import { loadFonts } from './plugins/webfontloader'
import store from './store'

loadFonts()

// Load JWT from Local Storage on Refresh
let localAuthToken = localStorage.auth_token;
let cookieExists = localAuthToken !== 'undefined' && localAuthToken !== null;

if (cookieExists) {
  const auth_token = localStorage.getItem("auth_token");
  const authTokenExists = auth_token !== "undefined" && auth_token !== null;
  if (authTokenExists) {
    store.dispatch("loginUserWithToken", { auth_token });
  }
}

createApp(App).use(store)
  .use(vuetify)
  .mount('#app')
