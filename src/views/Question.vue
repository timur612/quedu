<template>
    <div>
        <h2> {{questionName[number_id]}} </h2>
        <button @click="goToTheNextQuestion" > далее - {{number_id}} </button>
        <button @click="backToTheQustion"> назад </button>
		
        <p> {{questionNumber}} </p>

<div v-for="(ans,i) in answers" :key="i" class="form-check">
   <input @click="that(ans.true_answer,ans.answer)" class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
  <label class="form-check-label" for="exampleRadios2">
                {{ans.answer}} - {{ans.true_answer}}
  </label>
  </div>
  <button @click="proverka(); goToTheNextQuestion()" class="btn btn-primary">Ответить </button>
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
            answers: [],
			proverk:[]
        }
    },
    created(){
        this.number_id = this.$route.query.numberId;
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
                this.getAnswers()
    },
    methods:{
		that(peremen,answer,) {
			this.proverk[0]=peremen;
			this.proverk[1]=answer;
	},
		proverka() {
			if (this.proverk!='') {
				let user_id = localStorage.getItem("Id");
				let quest_id= this.$route.query.questId;
				let number_id= this.$route.query.numberId;
				let param = {
						Quest_id : quest_id,
						User_id : user_id,
						Id: number_id,
						Answer_true : this.proverk[0],
						Answer : this.proverk[1]
					}
				console.log (param);	
				const str = JSON.stringify(param);
				axios.post('http://localhost/quedu_server/checkAnswer.php',param)
                    .then(response =>{
                        console.log(response.data);
                        }
                    )
                    .catch(function (error) {
                        console.log(error);
                    });
	}
	},
        goToTheNextQuestion(){
            this.answers = []
            let id = this.number_id-1;
			id=id+2;
            for(let i=0;i<this.questionNumber.length;i++){
               if(id == this.questionNumber[i]){
                   router.push({ path: '/question',query:{numberId: id,questId:this.questId} })
                   this.number_id = this.$route.query.numberId
               }
           }
           this.getAnswers()
        },
        backToTheQustion(){
            this.answers = []
            let id = this.number_id-1
            for(let i=0;i<this.questionNumber.length;i++){
               if(id == this.questionNumber[i]){
                   router.push({ path: '/question',query:{numberId: id,questId:this.questId} })
                   this.number_id = this.$route.query.numberId
               }
           }
           this.getAnswers()
        },
        getAnswers: async function(){
            let param = {
                    number_id: this.number_id,
                    questId: this.questId,
            };
        const str = JSON.stringify(param);

        axios.post('http://localhost/quedu_server/answer.php',str)
                .then(response=>{
          //          console.log(response.data)
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