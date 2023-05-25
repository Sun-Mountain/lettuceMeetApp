import { createRouter, createWebHistory } from 'vue-router';

import accountRoutes from './accounts.routes';
import adminRoutes from './admin.routes';
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
      { path: "/login", name: "login", component: () => import("@/components/auth/LoginForm.vue") },
      { path: "/register", name: "register", component: () => import("@/components/auth/UserForm.vue") },
      { ...accountRoutes },
      { ...adminRoutes },
      { ...eventsRoutes }
    ],
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
