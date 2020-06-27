<template>
    <div>
        <h2> Ваше имя -  {{name}} </h2>
    </div>
</template>

<script>
export default {
    data(){
        return{
            name: localStorage.name
        }
    }
}
</script>