/**
 * plugins/index.ts
 *
 * Automatically included in `./src/main.ts`
 */

// Plugins
import { loadFonts } from './webfontloader'
import vuetify from './vuetify'
import { createPinia } from 'pinia'
import router from '@/router'

import VueDatePicker from '@vuepic/vue-datepicker'
import { library } from "@fortawesome/fontawesome-svg-core"
import { fas } from "@fortawesome/free-solid-svg-icons"
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"

import '@vuepic/vue-datepicker/dist/main.css'
import '@fortawesome/fontawesome-free/css/all.css'

import { Vue3Mq } from "vue3-mq";

library.add(fas)

// Types
import type { App } from 'vue'

export function registerPlugins (app: App) {
  loadFonts()
  app
    .component('VueDatePicker', VueDatePicker)
    .component("font-awesome-icon", FontAwesomeIcon)
    .use(vuetify)
    .use(router)
    .use(Vue3Mq, {
      preset: 'vuetify'
      // xs	0
      // sm	600
      // md	960
      // lg	1264
      // xl	1904
    })
    .use(createPinia())
}
