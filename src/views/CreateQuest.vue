<template>
    <div>
        <div class="createQuest">
            <input type="text" v-model="questName" placeholder="Название квеста" id="qName">
            <button v-on:click="addNameQuest()">Добавить</button>
            <h1 v-if="questName!=''">Название квеста - {{questName}}</h1>
        </div>
        
        <CreateQuestion @addQuestions="add"
                        v-if="questName!=''"/>

        <p> Вопросы: {{quesions}} </p>
        <p> Ответы: {{answers}} </p>

        <button @click="sendIdentity">Отправить</button>
    </div>
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
import CreateQuestion from '../components/CreateQuestion.vue'

export default {
    data(){
        return{
            questName: "",
            quesions: [],
            answers: [],
            
        }
    },
    methods:{
        addNameQuest(){
            document.querySelector("#qName").setAttribute("disabled", "disabled")
        },
        add(data){
            this.answers = data.answers
            this.quesions = data.quesions
            console.log(data)
            console.log(this.answers)
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
    },
    components:{
        CreateQuestion
    }
}
</script>

<style scoped>

</style>