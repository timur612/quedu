<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
  created(){
   
  },
  mounted(){
    setTimeout(()=>{
      this.checkUser()
    },1500)
    
  },
  methods:{
    checkUser(){
        let user={
            id: localStorage.Id,
            hash: localStorage.hash 
        }
        const json = JSON.stringify(user);
        axios.post('http://localhost/quedu_server/checkReal.php',json)
              .then(response=>{
                  console.log(response.data)
                  if(response.data==0){
                    localStorage.clear()
                  }
                  else if(response.data=="200"){
                    console.log('надо зарегаться или залогиниться')
                  }
              })
              .catch(e=>{
                  console.log(e)
              })
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>