Mixin = require '../dest/mixin'

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
  Mixin.inheritance @, Parent
  Mixin.extend @, Util
  Mixin.include @, Util
  constructor: (name) -> super name
  child3Method: -> @name



# @inheritance()
describe '@inheritance()', ->
  it '適切に継承ができていること', ->
    child3 = new Child3 'child3'

    expect(child3.child3Method())
    .to
    .be 'child3'

    expect(Child3.utilMethod1())
    .to
    .be 'util1'

    expect(child3.utilMethod2())
    .to
    .be 'util2'



# @extend()
describe '@extend()', ->
  it 'クラスメソッドが拡張できていること', ->
    child1 = new Child1 'child1'

    expect(Child1.utilMethod1())
    .to
    .be 'util1'

    expect(Child1.utilMethod2())
    .to
    .be 'util2'



# @include()
describe '@include()', ->
  it 'インスタンスメソッドが拡張できていること', ->
    child2 = new Child2 'child2'

    expect(child2.utilMethod1())
    .to
    .be 'util1'

    expect(child2.utilMethod2())
    .to
    .be 'util2'
