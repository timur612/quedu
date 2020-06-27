<template>
    <div>
        <h2> {{questionName[number_id]}} </h2>
        <button @click="goToTheNextQuestion" > далее - {{number_id}} </button>
        <button @click="backToTheQustion"> назад </button>
        <p> {{questionNumber}} </p>

        <ul>
            <li v-for="(ans,i) in answers" :key="i">
                {{ans.answer}} - {{ans.true_answer}}
            </li>
        </ul>
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
            answers: []
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
    methods:{
        goToTheNextQuestion(){
            //this.answers = []
            
            let id = this.number_id+1;
            let max = 0
            console.log (this.number_id);
            for(let i=0;i<this.questionNumber.length;i++){
                let maxArr = []
                maxArr.push(i)
                if(id == this.questionNumber[i]){
                    router.push({ path: '/question',query:{numberId: id,questId:this.questId} })
                    this.number_id = this.$route.query.numberId
                }
           }

           
           
        },
        backToTheQustion(){
            //this.answers = []
            let id = this.number_id-1
            for(let i=0;i<this.questionNumber.length;i++){
               if(id == this.questionNumber[i]){
                   router.push({ path: '/question',query:{numberId: id,questId:this.questId} })
                   this.number_id = this.$route.query.numberId
                  
               }
           }
           
        },
        getAnswers(){
            let param = {
                    number_id: this.number_id,
                    questId: this.questId,
            };
        const str = JSON.stringify(param);

        axios.post('http://localhost/quedu_server/answer.php',str)
                .then(response=>{
                    console.log(response.data)
                    for(let i=0;i<response.data.answer.length;i++){
                        this.answers.push({
                            answer: response.data.answer[i][0],
                            true_answer: response.data.true_answer[i][0]
                        })
                    }
                    
                })
                .catch(e=>{
                    console.log(e)
                })
        }
    }
}
</script>