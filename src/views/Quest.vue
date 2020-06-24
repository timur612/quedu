<template>
    <div>
        <h1>{{questId}}</h1>
    </div>
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
    data(){
        return{
            quests: [{id:1,name:'Quest 1'},{id:2,name:'Quest 2'},{id:3,name:'Quest 3'},{id:4,name:'Quest 4'}],
            questId: ""
        }
    },
    created  () {
        console.log(this.$route.query.questId)
        this.questId = this.$route.query.questId;

        const str = JSON.stringify(this.questId);
        axios.defaults.headers.common["Access-Control-Allow-Origin"] = "*";
            axios.post('http://localhost/quedu_server/question.php',this.questId)
                    .then(function(response) {
                        console.log(response.data);
                    })
                    .catch(function (error) {
                        console.log(error);
                    });

    },
    methods:{
    }
}
</script>