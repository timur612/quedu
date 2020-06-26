<template>
    <div>
        <input class="number_input text-center" type="number" maxlength="1" tabindex=1>
        <input class="number_input text-center" type="number" maxlength="1" tabindex=2>
        <input class="number_input text-center" type="number" maxlength="1" tabindex=3>
        <input class="number_input text-center" type="number" maxlength="1" tabindex=4>
        <input class="number_input text-center" type="number" maxlength="1" tabindex=5>

        <button @click="check"> Подтвердить </button>
    </div>
</template>

<script>
export default {
    data(){
        return{

        }
    },
    mounted(){
        $('.number_input').on('keyup', function(e) {
            let value = $(this).val();
            let len = value.length;
            let curTabIndex = parseInt($(this).attr('tabindex'));
            let nextTabIndex = curTabIndex + 1;
            let prevTabIndex = curTabIndex - 1;
            if (len >= 1) {
                $(this).val(value.substr(0, 1));
                $('[tabindex=' + nextTabIndex + ']').focus();
            } else if (len == 0 && prevTabIndex !== 0) {
                $('[tabindex=' + prevTabIndex + ']').focus();
            }
        });
    }
}
</script>

<style scoped>
    input[type="number"] {
    width: 40px;
    height: 40px;
    line-height: 40px;
    border-radius: 5px;
    font-size: 20px;
    }

    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0;
    }
</style>