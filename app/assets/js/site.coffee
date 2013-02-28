#= require vendor/jquery.js
#= require vendor/bootstrap.js

$ ->
  if $('#users_new_view').length > 0
    $('form').submit ->
      $('button').button 'loading'
