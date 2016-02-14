// Generated by CoffeeScript 1.10.0
(function() {
  var method, methodName, ref, utils,
    hasProp = {}.hasOwnProperty;

  utils = {
    times: function(fn) {
      var i, j, ref, results;
      results = [];
      for (i = j = 0, ref = this.valueOf(); 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
        results.push(fn(i));
      }
      return results;
    },
    floor: function() {
      return Math.floor(this);
    },
    ceil: function() {
      return Math.ceil(this);
    },
    abs: function() {
      return Math.abs(this);
    },
    sign: function() {
      return this && this / Math.abs(this);
    },
    compareTo: function(other) {
      return this - other;
    },
    getRandomArbitrary: function(min, max) {
      return Math.random() * (max - min) + min;
    }
  };

  ref = require('./comparable');
  for (methodName in ref) {
    if (!hasProp.call(ref, methodName)) continue;
    method = ref[methodName];
    utils[methodName] = method;
  }

  utils.install = function() {
    for (methodName in utils) {
      if (!hasProp.call(utils, methodName)) continue;
      method = utils[methodName];
      if ((Number.prototype[methodName] == null) && (methodName !== "install" || methodName !== "getRandomArbitrary")) {
        Number.prototype[methodName] = method;
      }
    }
    if (Number.getRandomArbitrary == null) {
      return Number.getRandomArbitrary = utils.getRandomArbitrary;
    }
  };

  module.exports = utils;

}).call(this);
