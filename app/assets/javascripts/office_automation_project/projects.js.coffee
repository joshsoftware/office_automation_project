call_function = ->

    $(".customdatepicker").datepicker format: "dd-mm-yyyy"
    $.each $(".userdata"), -> 
        uid = $(this).val()
        filter_users = $(".userdata").filter (r, ele) ->
            ele if($(ele).val() != uid)

check_user = ->
    user_array = []
    $.each $(".userdata:visible"), ->
        uid = $(this).val()
        user_array.push(uid)
    console.log "asd"
    hasDups = not user_array.every((v, i) ->
        user_array.indexOf(v) is i
    )
    if hasDups
        alert "Duplicate User found"
        return false
     
           
$(document).ready(call_function)
$(document).on 'page:load', call_function
$(document).on 'nested:fieldAdded', call_function
$(document).submit(check_user)


