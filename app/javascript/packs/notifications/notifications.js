jQuery(function ($) {
  let alert_time = null

  $('.btn.btn-link.btn-link-notification').click(function() {
    let bell = $('#btn-link-notification-' + this.dataset.id)[0]
    if (bell && bell.classList[1] != 'color-gray') {
      bell.classList.remove('color-red')
      bell.classList.add('color-gray')
      let bell_sidebar = $('.badge.badge-pill.badge-success.notification')
      bell_sidebar[0].innerText--
    }
  })

  $('#btn-show-notification').click(function () {
    clearTimeout(alert_time)

    $('.my-alert').removeClass('hide')
    $('.my-alert').addClass('show')

    alert_time = setTimeout(() => {
      $('.my-alert').addClass('hide')
      $('.my-alert').removeClass('show')
    }, 4000)
  })

  $('#close-btn-alert').click(function () {
    $('.my-alert').addClass('hide')
    $('.my-alert').removeClass('show')
    clearTimeout(alert_time)
  })

  $('.header-bell.my-hover').click(function () {
    $('.box_notification_container#box_notification_container')[0].classList.add('show-opacity')
  })

  $('#close-notifications').click(function () {
    $('.box_notification_container#box_notification_container')[0].classList.remove('show-opacity')
  })
})
