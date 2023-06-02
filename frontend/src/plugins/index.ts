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
import VueDatePicker from '@vuepic/vue-datepicker';
import VueMq from 'vue-mq'
import '@vuepic/vue-datepicker/dist/main.css'

// Types
import type { App } from 'vue'

export function registerPlugins (app: App) {
  loadFonts()
  app
    .component('VueDatePicker', VueDatePicker)
    .use(VueMq, {
      breakpoints: {
        mobile: 450,
        tablet: 900,
        laptop: 1250,
        desktop: Infinity,
      }
    })
    .use(vuetify)
    .use(router)
    .use(createPinia())
}
