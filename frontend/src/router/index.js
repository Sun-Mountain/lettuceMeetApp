import { createRouter, createWebHashHistory } from 'vue-router';
import LandingPageVue from '@/views/LandingPage.vue';
import SignUpPageVue from '@/views/SignUpPage.vue';

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component:  LandingPageVue
    },
    {
      path: '/signup',
      name: 'signup',
      component: SignUpPageVue
    }
  ]
})

export default router