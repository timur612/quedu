<template>
    <div>
        <div class="container">
            <form>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" v-model="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Пароль</label>
                    <input type="password" v-model="password" class="form-control" id="exampleInputPassword1">
                </div>
                <button type="button" class="btn btn-primary" @click="login">Логин</button>
            </form>
            <button @click="goToRegister" style='margin-top:10px;' class="btn btn-primary">Регистрация</button>
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
            email:'',
            password: ''
        }
    },
    methods:{
        login(){
            if(this.name!='' && this.password!='', this.email!=''){
                 let user = {
                email: this.email,
                pass: this.password
            }
            const json = JSON.stringify(user)
            this.$store.dispatch('login', json)
                .then(() => this.$router.push('/'))
                .catch(err => console.log(err))
            }else{
                alert('Заполни все!')
            }
          
        },
        goToRegister(){
            router.push({path:'/regisration'})
        }
    }
}
</script>

