import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store'

import Home from '../views/Home.vue'
import CreateQuest from '../views/CreateQuest.vue'
import PlayQuest from '../views/PlayQuest.vue'
import Quest from '../views/Quest.vue'
import Question from '../views/Question.vue'
import Register from '../views/Register.vue'
import CheckEmail from '../views/CheckEmail.vue'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: { 
      requiresAuth: true
    }
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: function () {
      return import(/* webpackChunkName: "about" */ '../views/About.vue')
    }
  },
  {
    path: '/create-quest',
    name: 'Create Quest',
    component: CreateQuest,
    meta: { 
      requiresAuth: true
    }
  },
  {
    path: '/play-quest',
    name: 'Play Quest',
    component: PlayQuest,
    meta: { 
      requiresAuth: true
    }
  },
  {
    path: '/quest',
    name: 'Quest',
    component: Quest,
    meta: { 
      requiresAuth: true
    }
  },
  {
    path: '/question',
    name: 'Question',
    component: Question,
    meta: { 
      requiresAuth: true
    }
  },
  {
    path: '/regisration',
    name: 'Registration',
    component: Register
  },
  {
    path: '/check',
    name: 'Check',
    component: CheckEmail
  },
   {
    path: '/login',
    name: 'Login',
    component: function () {
      return import('../views/Login.vue')
    }
  },
  {
    path: '/profile',
    name: 'Profile',
    component: function () {
      return import('../views/Profile.vue')
    },
    meta: { 
      requiresAuth: true
    }
  },
  
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if(to.matched.some(record => record.meta.requiresAuth)) {
    if (store.getters.isLoggedIn) {
      next()
      return
    }
    next('/login') 
  } else {
    next() 
  }
})
export default router
