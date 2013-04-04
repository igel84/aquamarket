//= require jquery_ujs
//= require_tree ./fancybox
//= require ./alertify/alertify.js

$(document).ready( ->
  $('a.fancybox').fancybox({
    maxWidth: 800,
    maxHeight: 600,
    fitToView: false,
    width: '70%',
    height: '70%',
    autoSize: false,
    closeClick: false,
    openEffect: 'elastic',
    closeEffect: 'elastic',
    prevEffect: 'fade',
    nextEffect: 'fade',
  })
  $('.submit').click () ->
    alertify.success("Товар успешно добавлен в корзину");
    $(this).parent().submit()
)