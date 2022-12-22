import { createApp } from "vue";
import { createPinia } from "pinia";
import CoreUI from "@coreui/vue";

import App from "./App.vue";
import { router } from "./router";

const app = createApp(App);

app.use(createPinia());
app.use(router);
app.use(CoreUI);

app.mount("#app");
