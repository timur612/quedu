<template>
    <div>
        <div class="createQuest">
            <input type="text" v-model="questName" placeholder="Название квеста" id="qName">
            <button v-on:click="addNameQuest()">Добавить</button>
            <h1 v-if="questName!=''">Название квеста - {{questName}}</h1>
        </div>
        <div class="createQuestion" v-if="questName!=''">
            <ul>
                <li v-for="(input, index) in inputsQuestion" :key="index">
                    <input type="text" class="inpQuestion" v-model="input.questionValue" placeholder="Вопрос"> <br>
                    <!-- <p> {{input.questionValue}} </p> -->
                    
                    <ul>
                        <li v-for="(ans, i) in inputsAnswers" :key="i">
                                <input type="text" class="inpQuestion" v-model="ans.answer" placeholder="Ответ"> <br>
                                <button @click="deleteAns(i)">Удалить ответ</button>
                        </li>
                    </ul>
                    <button @click="addAnsw"
                                v-if="asnVisible"
                        >Добавить Ответ</button>
                    <!-- <p> {{input.answer}} </p> -->
                    <button @click="deleteRow(index)">Удалить</button>
                </li>
            </ul>
            <button @click="addRow">Добавить вопрос</button>
            <button @click="addQuestions">Готово</button>
        </div>
        <p> Вопросы: {{quesions}} </p>
        <p> Ответы: {{answers}} </p>

        <button @click="sendIdentity">Отправить</button>

        <div> {{message}} </div>
    </div>
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
    data(){
        return{
            questName: "",
            quesions: [],
            answers: [],
            inputsQuestion:[],
            inputsAnswers:[],
            message: "",
            asnVisible: true
        }
    },
    methods:{
        addNameQuest(){
            document.querySelector("#qName").setAttribute("disabled", "disabled")
        },
        addRow() {
            this.inputsQuestion.push({
                questionValue: '',
                
            })
        },
        addAnsw(){
            this.inputsAnswers.push({
                answer: ''
            })
            if(this.inputsAnswers.length>4){
                this.asnVisible = false
            }
            console.log(this.inputsAnswers.length)
            console.log(this.asnVisible)
            
        },
        deleteRow(index) {
            this.inputsQuestion.splice(index,1)
            this.quesions.splice(index)
            
        },
        deleteAns(index){
            this.inputsAnswers.splice(index,1)
            this.answers.splice(index)

            if(this.inputsAnswers.length<=5){
                this.asnVisible = true
            }
        },
        addQuestions(){
           for(let i=0;i<this.inputsQuestion.length;i++){
                this.quesions.push(this.inputsQuestion[i].questionValue)
                this.answers.push(this.inputsAnswers[i].answer)
            }  
        },
        sendIdentity: async function() {
            let param = {
                    questName: this.questName,
                    quesions: this.quesions,
                    answers: this.answers,
                    //inputsQuestion: this.inputsQuestion,
                    //message: this.message
            };
            const str = JSON.stringify(param);
            axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
                axios.post('http://localhost/quedu_server/a.php',str)
                    .then(function(response) {
                        console.log(response.data);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
        },
    }
}
</script>

<style scoped>

</style>