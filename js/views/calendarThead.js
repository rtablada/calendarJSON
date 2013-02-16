// Generated by CoffeeScript 1.3.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone'], function() {
  var CalendarTbody;
  return CalendarTbody = (function(_super) {

    __extends(CalendarTbody, _super);

    function CalendarTbody() {
      return CalendarTbody.__super__.constructor.apply(this, arguments);
    }

    CalendarTbody.prototype.tagName = 'thead';

    CalendarTbody.prototype.render = function() {
      var day, _i, _len, _ref;
      _ref = this.model.get('daysOfWeek');
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        day = _ref[_i];
        this.$el.append('<th>' + day + '</th>');
      }
      return this;
    };

    return CalendarTbody;

  })(Backbone.View);
});
