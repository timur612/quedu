<template>
  <div class="home">
    <div v-if="logined">
      <p>hello, {{userName}} </p>
      <router-link to="/profile">| Профиль | </router-link>
      <router-link to="/play-quest">Играть | </router-link>
      <router-link to="/create-quest">Создать квест |</router-link>
      
    </div>
    <span v-if="isLoggedIn"> | <a @click="logout">Logout</a></span>
    <div v-if="logined===false" style="margin-top:10vh">
      <p><router-link to="/regisration">Регистрация</router-link></p> 
      <p><router-link to="/login">Логин</router-link></p>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src


export default {
  data(){
    return{
      userName: "",
      logined: false
    }
  },
  computed : {
      isLoggedIn : function(){ return this.$store.getters.isLoggedIn}
  },
  created(){
    if(localStorage.length!=1){
      this.userName = localStorage.name
      this.logined = true
    }
  },
  methods:{
    logout: function () {
        this.$store.dispatch('logout')
        .then(() => {
          this.$router.push('/login')
        })
      }
  }
}
</script>
