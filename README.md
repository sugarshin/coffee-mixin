# Module

Mixins class for CoffeeScript

Like Ruby modules and mixins

```coffeescript
Module = require './module'
Utility = require './utility'

class Child extends Parent
  Module.include @, Utility

  @classMethod: ->

  constructor: (name) -> super name
  someMethod: ->

child = new Child 'name'
child.parentMethod()
child.utilMethod()
```

## api

### `@include obj, mixin`

Include

As instance method

### `@inheritance child, parent`

Inheritance

About the same as `extends` keyword

## Contributing

[gulp.js](//gulpjs.com/)

## License

MIT

© sugarshin
