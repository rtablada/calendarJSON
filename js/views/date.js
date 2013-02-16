// Generated by CoffeeScript 1.3.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['backbone'], function() {
  var DateView;
  DateView = (function(_super) {

    __extends(DateView, _super);

    function DateView() {
      return DateView.__super__.constructor.apply(this, arguments);
    }

    DateView.prototype.tagName = 'td';

    DateView.prototype.events = {
      'click button': 'clicked'
    };

    DateView.prototype.clicked = function() {
      return App.Vent.trigger('fetchAppointments', this.model.get('date'));
    };

    DateView.prototype.render = function() {
      var date;
      date = this.model.get('date');
      if (this.model.get('today')) {
        this.$el.append('<button class"today date">' + date.getDate() + '</button>');
      } else if (date !== '') {
        this.$el.append('<button class"date">' + date.getDate() + '</button>');
      }
      return this;
    };

    return DateView;

  })(Backbone.View);
  return DateView;
});