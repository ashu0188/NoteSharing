$(document).ready(function(){"use strict";$(window).outerWidth()>992&&$(window).on("load",function(){$("nav.side-navbar").mCustomScrollbar({scrollInertia:200})}),$("#toggle-btn").on("click",function(e){e.preventDefault(),$(window).outerWidth()>1194?($("nav.side-navbar").toggleClass("shrink"),$(".page").toggleClass("active")):($("nav.side-navbar").toggleClass("show-sm"),$(".page").toggleClass("active-sm"))}),$("#login-form").validate({messages:{loginUsername:"please enter your username",loginPassword:"please enter your password"}}),$("#register-form").validate({messages:{registerUsername:"please enter your first name",registerEmail:"please enter a vaild Email Address",registerPassword:"please enter your password"}});var e=$("input.input-material");e.filter(function(){return""!==$(this).val()}).siblings(".label-material").addClass("active"),e.on("focus",function(){$(this).siblings(".label-material").addClass("active")}),e.on("blur",function(){$(this).siblings(".label-material").removeClass("active"),""!==$(this).val()?$(this).siblings(".label-material").addClass("active"):$(this).siblings(".label-material").removeClass("active")});$("#progress-circle").gmpc({color:"#33b35a",line_width:5,percent:80}).gmpc("animate",80,3e3),$(".external").on("click",function(e){e.preventDefault(),window.open($(this).attr("href"))});var s=$("link#theme-stylesheet");$("<link id='new-stylesheet' rel='stylesheet'>").insertAfter(s);var t=$("link#new-stylesheet");$.cookie("theme_csspath")&&t.attr("href",$.cookie("theme_csspath")),$("#colour").change(function(){if(""!==$(this).val()){var e="css/style."+$(this).val()+".css";t.attr("href",e),$.cookie("theme_csspath",e,{expires:365,path:document.URL.substr(0,document.URL.lastIndexOf("/"))})}return!1})});