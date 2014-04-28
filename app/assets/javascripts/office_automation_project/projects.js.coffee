call_function = ->

  $(".customdatepicker").datepicker format: "dd-mm-yyyy"

check_user = ->
  user_array = []
  $.each $(".userdata:visible"), ->
    uid = $(this).val()
    user_array.push(uid)
  hasDups = not user_array.every((v, i) ->
    user_array.indexOf(v) is i
  )
  if hasDups
    alert "Duplicate User found"
    return false
     
           
$(document).ready(call_function)
$(document).on 'page:load', call_function
$(document).submit(check_user)


