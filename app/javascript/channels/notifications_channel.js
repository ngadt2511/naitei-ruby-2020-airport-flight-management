import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    if ($("#type_account_air_traffic_officer")[0] && $("#type_account_air_traffic_officer")[0].attributes[2].value != data.from && !data.status_req) {
      let $msg_notification = $('#my-alert .my-alert .msg')
      $msg_notification.text(`${data.from} ${data.message}`)
      $('#btn-show-notification').click()
      let $bell_sidebar = $('.badge.badge-pill.badge-success.notification')
      $bell_sidebar[0].innerText++
    }

    if ($("#type_account_air_traffic_officer")[0] && data.status_req == 3) {
      $(`#row_request_${data.request_id}`)[0].innerHTML = ""
    } else if (`owner_notification_${data.owner_id}` != data.to) {
      if ($(`#${data.to}`)[0]) {
        let $msg_notification = $('#my-alert .my-alert .msg')
        let status_approve = 1
        $msg_notification.text(`${data.from} ${data.message}`)
        $('#btn-show-notification').click()
        let $bell_sidebar = $('.badge.badge-pill.badge-success.notification')
        $bell_sidebar[0].innerText++
  
        let status_req = $(`.status_request_${data.request_id}`)
        let action_req = $(`.action_request_${data.request_id}`)
        action_req[0].innerHTML = `<small class="badge badge-success" style="text-decoration: none;">
                                    Đã xử lý
                                  </small>`
        status_req[0].innerHTML = (data.status_req == status_approve) ? `<small class="badge badge-success"
                                                                          style="text-decoration: none;">
                                                                          approve
                                                                        </small>` : `<small class="badge badge-danger"
                                                                                      style="text-decoration: none;">
                                                                                      rejected
                                                                                    </small>`
      }
    }
  }
})
