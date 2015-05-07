//= require jquery
//= require jquery_ujs
//= require jsapi
//= require chartkick
//= require_tree .

$(function() {
  $("a:not(.no-loading)").on("click", function (){
    ShopifyApp.Bar.loadingOn();  
  })
})

ShopifyApp.ready(function() {
  ShopifyApp.Bar.loadingOff();  
});
