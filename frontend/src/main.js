import { createApp } from "vue";
import { createPinia } from "pinia";
import CoreUI from "@coreui/vue";
// import CoreUIPro from "@coreui/coreui-pro";

import App from "./App.vue";
import { router } from "./router";

/* import the fontawesome core */
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import {
  faUserSecret,
  faAnglesDown,
  faAnglesUp,
} from "@fortawesome/free-solid-svg-icons";
library.add(faUserSecret, faAnglesDown, faAnglesUp);

const app = createApp(App);

app.component("font-awesome-icon", FontAwesomeIcon);
app.use(createPinia());
app.use(router);
app.use(CoreUI);
// app.use(CoreUIPro);

app.mount("#app");
