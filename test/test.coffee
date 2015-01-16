Mixin = require '../src/mixin'

class Util
  @utilMethod1: -> 'util1'
  @utilMethod2: -> 'util2'

class Parent
  constructor: (@name) ->
  parentMethod: ->

class Child1 extends Parent
  Mixin.extend @, Util
  constructor: (name) -> super name
  child1Method: -> @name

class Child2 extends Parent
  Mixin.include @, Util
  constructor: (name) -> super name
  child2Method: -> @name

class Child3
  Mixin.inherit @, Parent
  Mixin.extend @, Util
  Mixin.include @, Util
  constructor: (name) -> super name
  child3Method: -> @name

class Child4
  Mixin.inheritance @, Parent
  Mixin.extend @, Util
  Mixin.include @, Util
  constructor: (name) -> super name
  child4Method: -> @name



# @inherit()
describe '@inherit()', ->
  it '適切に継承ができていること', ->
    child3 = new Child3 'child3'

    assert child3.child3Method() is 'child3'
    assert Child3.utilMethod1() is 'util1'
    assert child3.utilMethod2() is 'util2'

# @inheritance()
# Aliases for @inherit
describe '@inheritance() # Aliases for @inherit', ->
  it '適切に継承ができていること', ->
    child4 = new Child4 'child4'

    assert child4.child4Method() is 'child4'
    assert Child4.utilMethod1() is 'util1'
    assert child4.utilMethod2() is 'util2'

# @extend()
describe '@extend()', ->
  it 'クラスメソッドが拡張できていること', ->
    child1 = new Child1 'child1'

    assert Child1.utilMethod1() is 'util1'
    assert Child1.utilMethod2() is 'util2'

# @include()
describe '@include()', ->
  it 'インスタンスメソッドが拡張できていること', ->
    child2 = new Child2 'child2'

    assert child2.utilMethod1() is 'util1'
    assert child2.utilMethod2() is 'util2'
