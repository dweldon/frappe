_s = require 'underscore.string'

BASE_TITLE = "My Site"

module.exports = ->
  (title = '') ->
    # ' my title ' => 'My Title"
    title = (_s.capitalize word for word in _s.words title).join(' ')
    if title is '' then BASE_TITLE else "#{BASE_TITLE} - #{title}"
