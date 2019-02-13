$('.captain_select').keyup(function(){
$.ajax 'get_users',
  type: 'GET'
  url:"users/show"
  dataType: 'json'
  data: {
    captain_id: id
  }
  error: (jqXHR, textStatus, errorThrown) ->
    console.log("AJAX Error: #{textStatus}")
  success: (data, textStatus, jqXHR) ->
    console.log(" select one captain")
