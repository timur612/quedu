<template>
    <div class="PlayQuest">
        <Loader v-if="loading"/>
        <ul>
            <li v-for="(quest,index) in quests" :key="index">
                <button class="margint"
                        @click="goToTheQuest(index)">
                         {{quest.name}} </button> - <p> {{quest.id}} </p>
            </li>
        </ul>
    </div>
</template>

<script>
import router from '../router'
import axios from 'axios'
import VueAxios from 'vue-axios'
import Loader from '../components/Loader.vue'

export default {
    data(){
        return{
            quests: [],
            loading: true,
        }
    },
    mounted(){
                axios.get('http://localhost/quedu_server/ols.php')
                    .then(response => {
                        //console.log(response.data.Name[0][0])
                        setTimeout(()=>{
                            this.loading = false
                            for(let i=0;i<response.data.Name.length;i++){
                                this.quests.push({id:response.data.Id[i][0],name:response.data.Name[i][0]})
                            }
                        },1)
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
               //console.log(this.quests.name)
    },
    methods:{
        goToTheQuest(index){
            //console.log(this.quests[index].id)
            router.push({ path: '/quest',query:{questId:this.quests[index].id} })
        },
    },
    components: {
        Loader
  }
}
</script>

<style scoped>
    .margint{
        margin-top: 5vh;
    }
</style>