###!
 * @license coffee-mixin v2.0.0
 * (c) 2014 sugarshin https://github.com/sugarshin
 * License: MIT
###
module.exports =
  class Mixin
    @inheritance: (child, parent) ->
      for own key of parent
        child[key] = parent[key]

      ctor = ->
        @constructor = child
        return

      ctor:: = parent::
      child:: = new ctor
      child.__super__ = parent::

      return child

    @include: (obj, mixin) ->
      for own key, value of mixin
        obj::[key] = value
      return this
