jQuery(function ($) {
  $('.btn.btn-link.btn-link-notification').click(function() {
    let bell = $('#btn-link-notification-' + this.dataset.id)[0]
    if (bell && bell.classList[1] != "color-gray") {
      bell.classList.remove("color-red")
      bell.classList.add("color-gray")
      let bell_sidebar = $('.badge.badge-pill.badge-success.notification')
      bell_sidebar[0].innerText--
    }
  })
})
