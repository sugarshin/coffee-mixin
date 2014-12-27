# Mixin

Mixins for CoffeeScript

Like Ruby modules and mixins

```coffeescript
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

### `@include(obj, mixin)`

Include

As instance method

### `@inheritance(child, parent)`

Inheritance

About the same as `extends` keyword

## Contributing

[gulp.js](//gulpjs.com/)

## License

MIT

© sugarshin
