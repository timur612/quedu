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
                    <input type="text" class="inpQuestion" v-model="input.answer" placeholder="Ответ"> <br>
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
            message: ""
        }
    },
    methods:{
        addNameQuest(){
            document.querySelector("#qName").setAttribute("disabled", "disabled")
        },
        addRow() {
            this.inputsQuestion.push({
                questionValue: '',
                answer: ''
            })
        },
        deleteRow(index) {
            this.inputsQuestion.splice(index,1)
            this.quesions.splice(index)
            this.answers.splice(index)
        },
        addQuestions(){
           for(let i=0;i<this.inputsQuestion.length;i++){
                this.quesions.push(this.inputsQuestion[i].questionValue)
                this.answers.push(this.inputsQuestion[i].answer)
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