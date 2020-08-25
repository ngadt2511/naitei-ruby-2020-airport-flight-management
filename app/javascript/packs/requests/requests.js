jQuery(function ($) {
  $('#request_schedule_id').change(function() {
    getDataFromRequest(this.value)
  })

  function getDataFromRequest(schedules_id){
    $.ajax({
      dataType: 'json',
      cache: false,
      url: '/schedules/' + schedules_id,
      timeout: 120000,
      error: function(){
        alert(I18n.t("requests.alert"))
      },
      success: function(data){
        $data_get_from_request = data.request_schedule
        $('#title').text($data_get_from_request.title)
        $('#from').text($data_get_from_request.from)
        $('#to').text($data_get_from_request.to)
      }
    })
  }
})
