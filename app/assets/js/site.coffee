#= require vendor/jquery.js
#= require vendor/bootstrap-2.1.1.min.js

$ ->
  if $('#users_new_view').length > 0
    $('form').submit ->
      $('button').button 'loading'
