// Generated by CoffeeScript 1.10.0
(function() {
  var utils;

  utils = {
    sleep: function(time, callback) {
      var stop;
      stop = new Date().getTime();
      while (new Date().getTime() < stop + time) {}
      return typeof callback === "function" ? callback() : void 0;
    }
  };

  module.exports = utils;

}).call(this);
