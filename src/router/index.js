import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import CreateQuest from '../views/CreateQuest.vue'
import PlayQuest from '../views/PlayQuest.vue'
import Quest from '../views/Quest.vue'
import Question from '../views/Question.vue'

Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
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
    component: CreateQuest
  },
  {
    path: '/play-quest',
    name: 'Play Quest',
    component: PlayQuest
  },
  {
    path: '/quest',
    name: 'Quest',
    component: Quest
  },
  {
    path: '/question',
    name: 'Question',
    component: Question
  }
  
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
