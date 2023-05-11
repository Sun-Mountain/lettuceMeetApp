// Composables
import { createRouter, createWebHistory } from 'vue-router';

import accountRoutes from './accounts.routes';
import eventsRoutes from './events.routes';

const routes = [
  {
    path: '/',
    component: () => import('@/layouts/View.vue'),
    children: [
      {
        path: '',
        name: 'Home',
        component: () => import('@/views/Home.vue'),
      },
      { path: "/login", name: "login", component: () => import("@/components/forms/LoginForm.vue") },
      { path: "/register", name: "register", component: () => import("@/components/forms/UserForm.vue") },
      { ...accountRoutes },
      { ...eventsRoutes }
    ],
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
