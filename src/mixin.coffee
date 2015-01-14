module.exports =
  class Mixin
    @inherit: (child, parent) ->
      for own key of parent
        child[key] = parent[key]

      ctor = ->
        @constructor = child
        return

      ctor:: = parent::
      child:: = new ctor
      child.__super__ = parent::

      return child

    # Aliases for @inherit
    @inheritance: @inherit

    @extend: (obj, mixin) ->
      for own key, value of mixin
        obj[key] = value
      return this

    @include: (obj, mixin) ->
      for own key, value of mixin
        obj::[key] = value
      return this
