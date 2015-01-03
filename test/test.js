(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var Child1, Child2, Child3, Mixin, Parent, Util,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Mixin = require('../dest/mixin');

Util = (function() {
  function Util() {}

  Util.utilMethod1 = function() {
    return 'util1';
  };

  Util.utilMethod2 = function() {
    return 'util2';
  };

  return Util;

})();

Parent = (function() {
  function Parent(name) {
    this.name = name;
  }

  Parent.prototype.parentMethod = function() {};

  return Parent;

})();

Child1 = (function(_super) {
  __extends(Child1, _super);

  Mixin.extend(Child1, Util);

  function Child1(name) {
    Child1.__super__.constructor.call(this, name);
  }

  Child1.prototype.child1Method = function() {
    return this.name;
  };

  return Child1;

})(Parent);

Child2 = (function(_super) {
  __extends(Child2, _super);

  Mixin.include(Child2, Util);

  function Child2(name) {
    Child2.__super__.constructor.call(this, name);
  }

  Child2.prototype.child2Method = function() {
    return this.name;
  };

  return Child2;

})(Parent);

Child3 = (function() {
  Mixin.inheritance(Child3, Parent);

  Mixin.extend(Child3, Util);

  Mixin.include(Child3, Util);

  function Child3(name) {
    Child3.__super__.constructor.call(this, name);
  }

  Child3.prototype.child3Method = function() {
    return this.name;
  };

  return Child3;

})();

describe('@inheritance()', function() {
  return it('適切に継承ができていること', function() {
    var child3;
    child3 = new Child3('child3');
    expect(child3.child3Method()).to.be('child3');
    expect(Child3.utilMethod1()).to.be('util1');
    return expect(child3.utilMethod2()).to.be('util2');
  });
});

describe('@extend()', function() {
  return it('クラスメソッドが拡張できていること', function() {
    var child1;
    child1 = new Child1('child1');
    expect(Child1.utilMethod1()).to.be('util1');
    return expect(Child1.utilMethod2()).to.be('util2');
  });
});

describe('@include()', function() {
  return it('インスタンスメソッドが拡張できていること', function() {
    var child2;
    child2 = new Child2('child2');
    expect(child2.utilMethod1()).to.be('util1');
    return expect(child2.utilMethod2()).to.be('util2');
  });
});



},{"../dest/mixin":2}],2:[function(require,module,exports){

/*!
 * @license coffee-mixin v2.1.0
 * (c) 2014 sugarshin https://github.com/sugarshin
 * License: MIT
 */
var Mixin,
  __hasProp = {}.hasOwnProperty;

module.exports = Mixin = (function() {
  function Mixin() {}

  Mixin.inheritance = function(child, parent) {
    var ctor, key;
    for (key in parent) {
      if (!__hasProp.call(parent, key)) continue;
      child[key] = parent[key];
    }
    ctor = function() {
      this.constructor = child;
    };
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };

  Mixin.extend = function(obj, mixin) {
    var key, value;
    for (key in mixin) {
      if (!__hasProp.call(mixin, key)) continue;
      value = mixin[key];
      obj[key] = value;
    }
    return this;
  };

  Mixin.include = function(obj, mixin) {
    var key, value;
    for (key in mixin) {
      if (!__hasProp.call(mixin, key)) continue;
      value = mixin[key];
      obj.prototype[key] = value;
    }
    return this;
  };

  return Mixin;

})();



},{}]},{},[1]);
