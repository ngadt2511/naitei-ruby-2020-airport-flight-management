jQuery(function ($) {
  if (window.location.pathname === '/vi/users/sign_in' ||  window.location.pathname === '/users/sign_in'
    || window.location.pathname === '/ja/users/sign_in') {
    $('.page-wrapper').addClass('header-befor-login')
  }

  $('.sidebar-dropdown > a').click(function() {
    $('.sidebar-submenu').slideUp(200)
    if (
      $(this)
        .parent()
        .hasClass('active')
    ) {
      $('.sidebar-dropdown').removeClass('active')
      $(this)
        .parent()
        .removeClass('active')
    } else {
      $('.sidebar-dropdown').removeClass('active')
      $(this)
        .next('.sidebar-submenu')
        .slideDown(200)
      $(this)
        .parent()
        .addClass('active')
    }
  });

  $('#close-sidebar').click(function() {
    $('.page-wrapper').removeClass('toggled')
    $('.page-wrapper').removeClass('header-befor-login')
  })

  $('#show-sidebar').click(function() {
    $('.page-wrapper').addClass('toggled')
  })
})
