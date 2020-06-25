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
                <button type="submit" class="btn btn-primary" @click="registr">Регистрация</button>
            </form>
            <button class="btn btn-primary">Логин</button>
        </div>
    
        
    </div>
</template>

<script>
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
            localStorage.setItem("name",this.name)
            localStorage.setItem("email",this.email)
            localStorage.setItem("password",this.password)
        }
    },
    created(){
        
    }
}
</script>