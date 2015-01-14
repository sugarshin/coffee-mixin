###!
 * @license coffee-mixin v2.2.0
 * (c) 2015 sugarshin https://github.com/sugarshin
 * License: MIT
###
###!
 * @license coffee-mixin v2.1.0
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

    @extend: (obj, mixin) ->
      for own key, value of mixin
        obj[key] = value
      return this

    @include: (obj, mixin) ->
      for own key, value of mixin
        obj::[key] = value
      return this
