<template>
    <div class="createQuestion">       
            <ul>
                <li v-for="(input, index) in inputsQuestion" :key="index">
                    <input type="text" class="inpQuestion" v-model="input.questionValue" placeholder="Вопрос"> <br>
                    <ul>
                        <li v-for="(ans,i) in input.answers" :key="i">
                                <div style="display: inline-block">
                                    <input type="text" class="inpQuestion" v-model="ans.answer" placeholder="Ответ">
                                    <button @click="swapRightAns(index,i)"> {{ans.rightAns}} </button>
                                </div>
                                 
                                <button @click="deleteAns(index,i)">Удалить ответ</button>
                        </li>
                    </ul>
                    <button @click="addAnsw(index)"
                            v-if="input.asnVisible">
                            Добавить Ответ</button>
                    <button @click="deleteRow(index)">Удалить</button>
                </li>
            </ul>
            <button @click="addRow">Добавить вопрос</button>
            <button @click="addQuestions">Готово</button>
        </div>
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
    data(){
        return{
            quesions: [],
            answers: [],
            ansOne: '',
            inputsQuestion:[],
            inputsAnswers:[],
        }
    },
    methods:{
        addRow() {
            this.inputsQuestion.push({
                questionValue: '',
                answers: [],
                asnVisible: true
            })
        },
        addAnsw(index){
            this.inputsQuestion[index].answers.push({  
                    answer:'',
                    rightAns: 'да'
                })
            
            if(this.inputsQuestion[index].answers.length > 4){
                this.inputsQuestion[index].asnVisible = false
            }
        },
        deleteRow(index) {
            this.inputsQuestion.splice(index,1)
            this.quesions.splice(index)
            
        },
        deleteAns(index,i){
            this.inputsQuestion[index].answers.splice(i,1)

            if(this.inputsQuestion[index].answers.length<=5){
                this.inputsQuestion[index].asnVisible = true
            }
        },
        addQuestions(){
           for(let i=0;i<this.inputsQuestion.length;i++){
                this.quesions.push(this.inputsQuestion[i].questionValue)
                this.answers.push(this.inputsQuestion[i].answers)
            }  

            this.$emit("addQuestions", {
                quesions: this.quesions,
                answers: this.answers
            })
        },
        swapRightAns(index,i){
            if(this.inputsQuestion[index].answers[i].rightAns!="да"){
                this.inputsQuestion[index].answers[i].rightAns = "да"
                return
            }
            this.inputsQuestion[index].answers[i].rightAns = "нет"
        }
    }
}
</script>