# Mixin

Mixins for CoffeeScript

Like Ruby modules and mixins

```coffeescript
# Include

Mixin = require './mixin'
Utility = require './utility'

class Child extends Parent
  Mixin.include @, Utility
  @classMethod: ->
  constructor: (name) -> super name
  someMethod: ->

child = new Child 'name'
child.parentMethod()
child.utilMethod()
```

## API

### `@extend(obj, mixin)`

Extend

As class method

### `@include(obj, mixin)`

Include

As instance method

### `@inherit(child, parent)`

Inheritance

About the same as `extends` keyword

## Contributing
  
[gulp.js](//gulpjs.com/)

```shell
npm i
```

## Test

[Mocha](//mochajs.org/)

[power-assert](//github.com/twada/power-assert)

```shell
bower i

gulp test
```

## License

MIT

© sugarshin
