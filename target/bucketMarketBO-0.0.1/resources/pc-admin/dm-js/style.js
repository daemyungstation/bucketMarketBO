$(window).on('load',function(){

    //Checkbox & Radio
    if($('.form-checkbox').length > 0){
        checkBox_Ck();//checkbox
    }
    if($('.form-radio').length > 0){
        radioBtn_Ck();//radio
    }
    if($('.form-radio-category').length > 0){
        radioBtnCate_Ck();//radio
    }
});


function checkBox_Ck(){//체크박스
    var objCheckbox = $('.form-checkbox');
    objCheckbox.each(function(){
        if($(this).find('input[type=checkbox]').is(':checked')){
            $(this).addClass('checked')
        }
    });
    objCheckbox.on('click', function(){
        if($(this).find('input[type=checkbox]').is(':checked')){
            $(this).addClass('checked');
            $(this).find('input[type=checkbox]').attr('checked',true);
        }else{
            $(this).removeClass('checked');
            $(this).find('input[type=checkbox]').attr('checked',false);
        }
    });
}

function radioBtn_Ck(){//라디오
    $('.form-radio').on('click',function(){
        sameName = $(this).find('input').attr('name');
        $('input:radio[name="' + sameName + '"]').parent().removeClass('checked')
        $('input:radio[name="' + sameName + '"]').attr('checked', false)
        $(this).addClass('checked');
        $(this).find('input').attr('checked', true)
    });
}

function radioBtnCate_Ck(){//라디오-카테고리
    $('.form-radio-category').on('click',function(){
        sameName = $(this).find('input').attr('name');
        $('input:radio[name="' + sameName + '"]').parent().removeClass('checked')
        $('input:radio[name="' + sameName + '"]').attr('checked', false)
        $(this).addClass('checked');
        $(this).find('input').attr('checked', true)
    });
}
