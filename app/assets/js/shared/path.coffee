PLURALIZATION_RULES = [
  [/(m)an$/gi, '$1en']
  [/(pe)rson$/gi, '$1ople']
  [/(child)$/gi, '$1ren']
  [/^(ox)$/gi, '$1en']
  [/(ax|test)is$/gi, '$1es']
  [/(octop|vir)us$/gi, '$1i']
  [/(alias|status)$/gi, '$1es']
  [/(bu)s$/gi, '$1ses']
  [/(buffal|tomat|potat)o$/gi, '$1oes']
  [/([ti])um$/gi, '$1a']
  [/sis$/gi, 'ses']
  [/(?:([^f])fe|([lr])f)$/gi, '$1$2ves']
  [/(hive)$/gi, '$1s']
  [/([^aeiouy]|qu)y$/gi, '$1ies']
  [/(x|ch|ss|sh)$/gi, '$1es']
  [/(matr|vert|ind)ix|ex$/gi, '$1ices']
  [/([m|l])ouse$/gi, '$1ice']
  [/(quiz)$/gi, '$1zes']
  [/s$/gi, 's']
  [/$/gi, 's']
]

UNCOUNTABLES = [
  'advice'
  'energy'
  'excretion'
  'digestion'
  'cooperation'
  'health'
  'justice'
  'labour'
  'machinery'
  'equipment'
  'information'
  'pollution'
  'sewage'
  'paper'
  'money'
  'species'
  'series'
  'rain'
  'rice'
  'fish'
  'sheep'
  'moose'
  'deer'
  'news'
  'expertise'
  'status'
  'media'
]

TOKEN_OVERRIDES =
  'login': 'login'
  'logout': 'logout'
  'signup': 'signup'

RESERVED = ['index', 'new', 'create', 'show', 'edit', 'update', 'destroy']

# pluralize 'factory' => 'factories'
pluralize  = (str) ->
  str = str.toLowerCase()
  return str if str in UNCOUNTABLES
  for rule in PLURALIZATION_RULES
    if str.match rule[0]
      return str.replace rule[0], rule[1]
  return str

# formatUrl ['users', 'new'] => '/users/new'
# formatUrl ['users', 'new'], ['id=abc123'] => '/users/new?id=abc123'
formatUrl = (tokens, query = []) ->
  url = '/' + tokens.join '/'
  if query.length > 0
    url += '?' + query.join '&'
  url

# id 'user' => ':userid'
id = (str) ->
  ":#{str}id"

###
GET     /forums              ->  index
GET     /forums/new          ->  new
POST    /forums              ->  create
GET     /forums/:forum       ->  show
GET     /forums/:forum/edit  ->  edit
PUT     /forums/:forum       ->  update
DELETE  /forums/:forum       ->  destroy
###

# pathRaw 'user.forum.new' => '/users/:userid/forums/new'
# pathRaw 'user.message.index' => '/users/:userid/messages'
# pathRaw 'user.new' => '/users/new'
pathRaw = (name) ->
  result = []
  tokens = name.split '.'

  for token, index in tokens
    previous = tokens[index - 1]

    if token in RESERVED
      if token is 'new'
        result.push token
      else if token in ['show', 'update', 'destroy']
        result.push id previous
      else if token is 'edit'
        result.push id previous
        result.push token
    else
      if previous
        result.push id previous
      if TOKEN_OVERRIDES[token]
        result.push TOKEN_OVERRIDES[token]
      else
        result.push pluralize token

  formatUrl result

# pathFor 'user.forum.new', {userid: 'u1'} => '/users/u1/forums/new'
# pathFor 'user.message.index', {userid: 'u1'} => '/users/u1/messages'
# pathFor 'user.new', {id: 'abc123'} => '/users/new?id=abc123'
pathFor = (name, params = {}) ->
  #shallow copy params
  _params = {}
  _params[k] = v for k, v of params

  result = []
  tokens = pathRaw(name).split '/'

  for token in tokens when token isnt ''
    param = token[1...token.length]
    if token[0] is ':' and _params[param]
      result.push _params[param]
      delete _params[param]
    else
      result.push token

  query = []
  for k, v of _params
    query.push "#{encodeURIComponent k}=#{encodeURIComponent v}"

  formatUrl result, query

if exports?
  module.exports = (app) ->
    {pathRaw, pathFor}
else
  @pathFor = pathFor
