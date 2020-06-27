<template>
    <div>
        <p>Подтвердите свою почту кодом из вашей почты.</p>
        <input class="number_input text-center" v-model="l1" type="number" maxlength="1" tabindex=1>
        <input class="number_input text-center" v-model="l2" type="number" maxlength="1" tabindex=2>
        <input class="number_input text-center" v-model="l3" type="number" maxlength="1" tabindex=3>
        <input class="number_input text-center" v-model="l4" type="number" maxlength="1" tabindex=4>
        <input class="number_input text-center" v-model="l5" type="number" maxlength="1" tabindex=5>

        <button @click="checkHash"> Подтвердить </button>
    </div>
</template>

<script>
import router from '../router'
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
    data(){
        return{
            l1:'',
            l2:'',
            l3:'',
            l4:'',
            l5:'',
        }
    },
    mounted(){
        $('.number_input').on('keyup', function(e) {
            let value = $(this).val();
            let len = value.length;
            let curTabIndex = parseInt($(this).attr('tabindex'));
            let nextTabIndex = curTabIndex + 1;
            let prevTabIndex = curTabIndex - 1;
            if (len >= 1) {
                $(this).val(value.substr(0, 1));
                $('[tabindex=' + nextTabIndex + ']').focus();
            } else if (len == 0 && prevTabIndex !== 0) {
                $('[tabindex=' + prevTabIndex + ']').focus();
            }
        });
    },
    methods:{
        checkHash(){
            let hash = String(this.l1) + String(this.l2) + String(this.l3) + String(this.l4) + String(this.l5)
            //let hash = this.l1 + this.l2 + this.l3 + this.l4 + this.l5
            console.log(hash)

            let json = {
                Id: localStorage.Id,
                name: localStorage.name,
                hash: hash
            }

            const str = JSON.stringify(json);

            axios.post('http://localhost/quedu_server/CheckEmail.php',str)
                .then((response)=>{
                    console.log(response.data)
                    localStorage.setItem('hash',response.data.Hash)
                    router.push({ path: '/play-quest' })
                })
                .catch((e)=>{
                    console.log(e)
                })
        },
    }
}
</script>

<style scoped>
    input[type="number"] {
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 5px;
    font-size: 20px;
    }

    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0;
    }
</style>