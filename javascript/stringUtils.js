// Generated by CoffeeScript 1.10.0
(function() {
  var method, methodName, ref, utils,
    hasProp = {}.hasOwnProperty;

  require("./arrayUtils").install();

  require("./numberUtils").install();

  utils = {
    contains: function(str) {
      return this.indexOf(str) >= 0;
    },
    toInt: function() {
      return parseInt(this, 10);
    },
    startsWith: function(str) {
      return this.indexOf(str) === 0;
    },
    endsWith: function(str) {
      return this.indexOf(str) === (this.length - 1);
    },
    replaceAll: function(str1, str2) {
      return this.replace(new RegExp(str1, 'g'), str2);
    },
    isEmpty: function() {
      return this === null || this === "";
    },
    repeat: function(n) {
      return Array(n).join(this);
    },
    compareTo: function(other) {
      return this.localCompare(other);
    },
    generateToken: function(length) {
      var token;
      token = "";
      length.times(function() {
        var digit, letter;
        letter = 'abcdefghijklmnopqrstuvwxyz'.split('').pickRandom()[['toLowerCase', 'toUpperCase'].pickRandom()]();
        digit = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].pickRandom();
        return token += [letter, digit].pickRandom();
      });
      return token;
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
      method = utils[methodName];
      if ((String.prototype[methodName] == null) && (methodName !== "install" || methodName !== "generateToken")) {
        String.prototype[methodName] = method;
      }
    }
    if (String.generateToken == null) {
      return String.generateToken = utils.generateToken;
    }
  };

  module.exports = utils;

}).call(this);
