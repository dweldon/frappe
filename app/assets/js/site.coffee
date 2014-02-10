#= require js/vendor/jquery.js
#= require js/vendor/bootstrap.js
#= require_tree shared

$ ->
  if $('#users_new_view').length > 0
    $('form').submit ->
      $('button').button 'loading'
