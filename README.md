![Frappe](https://raw.github.com/dweldon/frappe/master/app/public/img/frappe.png)

# Frappé

Template for creating [Express](http://expressjs.com) applications with
[CoffeeScript](http://coffeescript.org).

Inspired by:
* [skeleton](https://github.com/EtienneLem/skeleton)
* [express-coffee](https://github.com/twilson63/express-coffee)
* [full-stack-nodejs](https://peepcode.com/screencasts/javascript)

## Installation

```sh
$ git clone http://github.com/dweldon/frappe [project-name]
$ cd [project-name] && rm -rf .git && npm install
```

## Commands

### Start

To start the server:
```sh
$ npm start
```

For convenience while developing, automatic restarts are provided with:
```sh
$ cake start
```

Additionally, the port and environment variables can be set. The following
example will start the server listening on port 3000 in production mode:
```sh
$ cake -p 3000 -e production start
```

### Test

To run the tests:
```sh
$ cake test
```

### Update

To update all packages and run [npmedge](https://npmjs.org/package/npmedge):
```sh
$ cake update
```

## Conventions

Frappe tries to imposes a very minimal number of conventions. Any or all of them
can be removed if so desired.

### Titles

The application layout uses a title helper. If no title is given when a template
is rendered, the default title of *My Site* is used. If a title is passed to the
view, the helper will upcase each word in the title. So for example if we did:
`res.render 'users/new', title: 'new user'`, the title would be
*My Site – New User*. Obviously, you should change this as appropriate for your
application.

### Ports

The test and development environments use different port numbers so you can
leave your development server running while testing. The default port for
development is **8000**, and the default port for testing is **8001**. These can
be changed dynamically by passing a port parameter to `cake start`.

### Dependencies

There are no global dependencies. When developing, however, it is recommended
that CoffeeScript be installed globally so the `cake` command is available.

### Modules

All modules in the **helpers**, **models**, and **controllers** directories (and
subdirectories) will be automatically required and loaded into `app.locals`. For
example, `app/models/user_model.coffee` will be available as
`app.locals.UserModel`. This was done so we can avoid having to write relative
paths from every module to every other module. Additionally, this makes helpers
available to the views (see title helper). This requires that all modules in the
aforementioned directories export a single function which takes `app` as its
parameter.

### Assets

Files in the assets directory are automatically compiled with connect-assets.
This way you can have a single `site.css` and a single `site.js` in production.

### Body IDs
To facilitate having single assets for css and js, the body of each
view is given a unique id. For example when we call
`res.render 'users/new', title: 'new user', view: 'users_new'`, the value of the
view parameter is used in the layout to render the body tag as
`<body id="users_new_view">`. This way we can reference `body#users_new_view` in
our css and js.

## Example Files
Frappe is both a template and a live example of how to use the few conventions
it suggests. As such, the following files exist in the project to serve as
placeholders:

* `app/controllers/*`
* `app/models/*`
* `app/views/users/*`
* `app/test/*`

Additionally you will probably want to immediately customize the following:

* `app/config/routes.coffee`
* `app/config/db.coffee`
* `app/helpers/title_helper.coffee`
* `app/views/*`
* `app/assets/*`
* `package.json`

## Technologies

### Dependencies

* [node](http://nodejs.org/)
* [express](https://github.com/visionmedia/express)
* [jade](https://github.com/visionmedia/jade)
* [stylus](https://github.com/learnboost/stylus)
* [nib](https://github.com/visionmedia/nib)
* [coffee-script](https://github.com/jashkenas/coffee-script)
* [underscore](http://documentcloud.github.com/underscore/)
* [underscore.string](https://github.com/epeli/underscore.string)
* [connect-assets](https://github.com/TrevorBurnham/connect-assets)
* [mongoose/MongoDB](http://mongoosejs.com)

### Development Dependencies

* [node-dev](https://github.com/fgnass/node-dev)
* [mocha](https://github.com/visionmedia/mocha)
* [should](https://github.com/visionmedia/should.js)
* [request](https://github.com/mikeal/request)
* [npmedge](https://npmjs.org/package/npmedge)

### Also Included

* [jquery 1.8.2](http://jquery.com/)
* [bootstrap 2.1.1](http://twitter.github.com/bootstrap/)

## License

(The MIT License)

Copyright (c) 2012 David Weldon

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
