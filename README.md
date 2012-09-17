![Frappe](https://raw.github.com/dweldon/frappe/master/app/public/img/frappe.png)

# Frappé

Template for creating [Express](http://expressjs.com) applications with
[CoffeeScript](http://coffeescript.org).

Inspired by:
* [skeleton](https://github.com/EtienneLem/skeleton)
* [express-coffee](https://github.com/twilson63/express-coffee)
* [full-stack-nodejs part 1](https://peepcode.com/products/full-stack-nodejs-i)
* [full-stack-nodejs part 2](https://peepcode.com/products/full-stack-nodejs-ii)

## Installation

```sh
$ git clone http://github.com/dweldon/frappe [project-name]
$ cd [project-name] && rm -rf .git && npm install
```

## Commands

### start

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

### test

To run the tests:
```sh
$ cake test
```

## Notes

* There are no global dependencies for production. When developing, it is
recommended that CoffeeScript be installed globally so the `cake` command is
available (see above).
* The test and development environments use different port numbers so you can
leave your development server running while testing.

## Technologies

### Dependencies

* [node](http://nodejs.org/)
* [express](https://github.com/visionmedia/express)
* [coffee-script](https://github.com/jashkenas/coffee-script)
* [jade](https://github.com/visionmedia/jade)
* [stylus](https://github.com/learnboost/stylus)

### Development Dependencies

* [node-dev](https://github.com/fgnass/node-dev)
* [mocha](https://github.com/visionmedia/mocha)
* [should](https://github.com/visionmedia/should.js)
* [request](https://github.com/mikeal/request)

### Also Included

* [jquery 1.8.1](http://jquery.com/)
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
