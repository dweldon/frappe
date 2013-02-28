#= require vendor/jquery.js
#= require vendor/bootstrap.js
#= require_tree shared

$ ->
  if $('#users_new_view').length > 0
    $('form').submit ->
      $('button').button 'loading'
