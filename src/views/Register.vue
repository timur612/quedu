<template>
    <div>
        <div class="container">
            <form>
                <div class="form-group">
                    <label for="InputName">ФИО</label>
                    <input type="text" v-model="name" class="form-control" id="InputName" aria-describedby="name">
                    <small id="name" class="form-text text-muted">Напишите свое полное имя.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" v-model="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" v-model="password" class="form-control" id="exampleInputPassword1">
                </div>
                <button type="button" class="btn btn-primary" @click="registr">Регистрация</button>
            </form>
            <button @click="goToLogin" style='margin-top:10px;' class="btn btn-primary">Логин</button>
        </div>
    </div>
</template>

<script>
import router from '../router'
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
    data(){
        return{
            name: '',
            email: '',
            password: ''
        }
    },
    methods:{
        registr(){
		if(this.name!='' && this.password!='', this.email!=''){
            let param = {
                    name: this.name,
                    email: this.email,
                    password: this.password,
            };
            const str = JSON.stringify(param);
            this.$store.dispatch('register', str)
                .then(() => this.$router.push('/'))
                .catch(err => console.log(err))
        }else{
            alert("Заполни все!")
        }
            
          //  axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
               // axios.defaults.withCredentials = true
                // axios.post('http://localhost/quedu_server/add_user.php',str)
                //     .then(response=> {
                //         console.log(response.data);
                //         localStorage.setItem("Id",response.data.Id)
                //         localStorage.setItem("name",this.name);
                //         router.push({ path: '/check',query:{} })
                //     })
                //     .catch(function (error) {
                //         console.log(error);
                //     });
        },
        goToLogin(){
            router.push({path:'/login'})
        }
    },
    created(){
        
    }
}
</script>