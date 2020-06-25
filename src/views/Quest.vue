<template>
    <div>
        <h1>{{questId}}</h1>
        <Loader v-if="loading"/>
        <ul>
            <li v-for="(name,index) in questionName" :key="index">
                <button @click="goToTheQuest(index)">{{name}}</button>
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
            questId: "",
            questionName: [],
            questionNumber:[],
            loading: true,
        }
    },
    mounted() {
        console.log(this.$route.query.questId)
        this.questId = this.$route.query.questId;
        const str = JSON.stringify(this.questId);
        //axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
            axios.post('http://localhost/quedu_server/question.php',this.questId)
                    .then(response =>{
                        //console.log(response.data.Question.length);
                        for(let i=0;i<response.data.Question.length;i++){
                            this.questionName.push(response.data.Question[i][0])
                           // console.log(response.data)
                        }
                    })
                    .then(()=>{
                        this.loading = false
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
        
    },
    methods:{
        goToTheQuest(index){
            //console.log(this.quests[index].id)
            router.push({ path: '/question',query:{numberId:index,questId:this.questId} })
        },
    },
    components:{
        Loader
    }
}
</script>