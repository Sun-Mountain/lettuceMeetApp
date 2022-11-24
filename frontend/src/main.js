import { createApp } from "vue";
import App from "./App.vue";
import store from "./store";
import router from './router';
import CoreUI from "@coreui/vue";

/**
 * Load JWT from Local Storage on Refresh.
 */
let localAuthToken = localStorage.auth_token;
let cookieExists = localAuthToken !== "undefined" && localAuthToken !== null;
if (cookieExists) {
  const auth_token = localStorage.getItem("auth_token");
  const authTokenExists = auth_token !== "undefined" && auth_token !== null;
  if (authTokenExists) {
    store.dispatch("loginUserWithToken", { auth_token });
  }
}

/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core';
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome';
import { 
  faAnglesDown,
  faAnglesUp,
  faTriangleExclamation,
  faUserSecret,
} from "@fortawesome/free-solid-svg-icons";
library.add(faAnglesDown, faAnglesUp, faTriangleExclamation, faUserSecret)

const app = createApp(App)

app.use(store)
app.use(CoreUI)
app.use(router)
app.component('font-awesome-icon', FontAwesomeIcon)

app.mount("#app");