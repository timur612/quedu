<template>
    <div>
        <h2> {{questionName[number_id]}} </h2>
        <button @click="goToTheNextQuestion" > далее - {{number_id}} </button>
        <button @click="backToTheQustion"> назад </button>
        <p> {{questionNumber}} </p>
    </div>
</template>

<script>
import router from '../router'
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
    data(){
        return{
            number_id: 0,
            questId: 0,
            questionNumber: [],
            questionName: [],
        }
    },
    created(){
        this.number_id = this.$route.query.numberId
        this.questId = this.$route.query.questId;
        axios.post('http://localhost/quedu_server/question.php',this.questId)
                    .then(response =>{
                        //console.log(response.data.Question.length);
                        for(let i=0;i<response.data.Question.length;i++){
                            this.questionNumber.push(response.data.Question_numbers[i][0])
                            this.questionName.push(response.data.Question[i][0])
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
    },
    mounted(){
        let param = {
                    number_id: this.number_id,
                    questId: this.questId,
            };
        const str = JSON.stringify(param);

        axios.post('http://localhost/quedu_server/PUTHERESCRIPT.php',str)
                .then(response=>{
                    console.log(response.data)
                })
                .catch(e=>{
                    console.log(e)
                })
    },
    methods:{
        goToTheNextQuestion(){
            let id = this.number_id+1;
            console.log (this.number_id);
            for(let i=0;i<this.questionNumber.length;i++){
               if(id == this.questionNumber[i]){
                   router.push({ path: '/question',query:{numberId: id,questId:this.questId} })
                   this.number_id = this.$route.query.numberId
               }
           }
        },
        backToTheQustion(){
            let id = this.number_id-1
            for(let i=0;i<this.questionNumber.length;i++){
               if(id == this.questionNumber[i]){
                   router.push({ path: '/question',query:{numberId: id,questId:this.questId} })
                   this.number_id = this.$route.query.numberId
               }
           }
        }
    }
}
</script>