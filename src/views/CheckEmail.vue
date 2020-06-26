<template>
    <div class="container-fluid">
		<input v-model="name" aria-describedby="name"class="form-control" style="margin-bottom:20px;">
        <button @click="Checkit" class="btn btn-primary" style=""> Подтвердить </button>
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
		Id: '',
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
methods :{
Checkit(){
		this.Id=localStorage.getItem("Id");
		let param=  {
		name: this.name,
		Id : this.Id,
		
		}
             const str = JSON.stringify(param);
        axios.post('http://localhost/quedu_server/CheckEmail.php',param)
                    .then(response =>{
                        console.log(response.data);
						localStorage.setItem("Hash",response.data.Hash)
                        }
                    )
                    .catch(function (error) {
                        console.log(error);
                    });
}
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