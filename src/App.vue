<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
      <router-link to="/create-quest">Создать квест</router-link> |
      <router-link to="/play-quest">Играть в квест</router-link>
    </div>
    <router-view/>
  </div>
</template>

<script>
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'
export default {
    data(){
        return{
		Hash : "",
		Id : "",
        }
    },
	mounted() {
	this.Hash=localStorage.getItem("Hash");
	this.Id=localStorage.getItem("Id");
	let param= {
		Id: this.Id,
		Hash: this.Hash,
		}
	const str = JSON.stringify(param);
	axios.post('http://localhost/quedu_server/CheckReal.php',param)
                    .then(response =>{
                        console.log(response.data);
						if (response.data=='0') { router.push({ path: '/regisration' })}
                        }
                    )
                    .catch(function (error) {
                        console.log(error);
                    });
},
  created(){
    if(localStorage.length==1){
      router.push({ path: '/regisration' })
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

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>