jQuery(function ($){
  $('#delete-schedule').click(function (e) {
    e.preventDefault()
    $('#q_plane_name_eq').val('')
    $('#q_runway_name_eq').val('')
    $('#q_time_eq').val('')
    $('#q_from_gteq').val('')
    $('#q_to_lteq').val('')
  })  
})
