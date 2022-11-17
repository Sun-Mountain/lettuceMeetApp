import { createRouter, createWebHashHistory } from 'vue-router'
import LandingPage from '@/views/LandingPage.vue'
import SignUpPage from '@/views/SignUpPage.vue'

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component:  LandingPage
    },
    {
      path: '/signup',
      name: 'signup',
      component:  SignUpPage
    },
  ]
})

export default router