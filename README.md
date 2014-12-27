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

### `@extend child, parent`

Extend

About the same as `extends`

## Contributing

[gulp.js](//gulpjs.com/)

## License

MIT

© sugarshin
