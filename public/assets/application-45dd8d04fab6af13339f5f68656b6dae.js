// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require_tree .
function loadSocial(){typeof twttr!="undefined"?twttr.widgets.load():$.getScript("http://platform.twitter.com/widgets.js"),typeof FB!="undefined"?FB.init({status:!0,cookie:!0,xfbml:!0}):$.getScript("http://connect.facebook.net/en_US/all.js#xfbml=1",function(){FB.init({status:!0,cookie:!0,xfbml:!0})}),typeof gapi!="undefined"?$(".g-plusone").each(function(){gapi.plusone.render($(this).get(0))}):$.getScript("https://apis.google.com/js/plusone.js")}$("document").ready(function(){$("#invitation_button").live("click",function(){var e=$("form #user_email").val();if($("form #user_opt_in").is(":checked"))var t=!0;else var t=!1;var n="user[email]="+e+"&user[opt_in]="+t;return $.ajax({type:"POST",url:"/users",data:n,success:function(e){$("#request-invite").html(e),loadSocial()}}),!1})});