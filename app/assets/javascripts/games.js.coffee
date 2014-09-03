# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

sortList = (options) ->
  mylist = $(".games-list ul")
  listitems = mylist.children("li").get()
  listitems.sort (a, b) ->
    try
      compA = $(a).data('name')
      compB = $(b).data('name')
    catch error
      $(a)
    (if (compA < compB) then -1 else (if (compA > compB) then 1 else 0))

  $.each listitems, (idx, itm) ->
    mylist.append itm
    return

$(document).ready ()-> 
  $('.logo').tooltip()
 

  # Filter games
  $("#search").keyup ()->
    regex = new RegExp($(this).val(), 'i')
    $(".games-list ul>li").each ->
      text = $(this).data('name').toLowerCase()
      (if (text.match(regex) != null) then $(this).fadeIn(600) else $(this).fadeOut(600))
      return

    return

  $('#played-v-never').click (e) ->
    e.preventDefault()
    $('#charts').slideToggle()
