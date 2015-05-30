# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("li").on("ajax:success", (e, data, status, xhr) ->
    $(@).parent().append(xhr.responseText)
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"


  $("#new_question").on("ajax:success", (e, data, status, xhr) ->
    $('ol').append(xhr.responseText)
  ).on "ajax:error", (e, xhr, status, error) ->
    alert(error)
    $("#new_article").append "<p>ERROR</p>"
