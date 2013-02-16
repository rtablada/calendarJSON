// Generated by CoffeeScript 1.3.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/calendar', 'views/calendarTable'], function(CalendarModel, CalendarTableView) {
  var CalendarView;
  CalendarView = (function(_super) {

    __extends(CalendarView, _super);

    function CalendarView() {
      return CalendarView.__super__.constructor.apply(this, arguments);
    }

    CalendarView.prototype.el = '.calendar';

    CalendarView.prototype.initialize = function() {
      return App.Vent.on('rerender', this.updateView, this);
    };

    CalendarView.prototype.updateView = function() {
      this.model.fillDays();
      this.$el.html('');
      return this.render();
    };

    CalendarView.prototype.events = {
      'click .prev': 'prevCal',
      'click .next': 'nextCal'
    };

    CalendarView.prototype.prevCal = function() {
      return this.model.adjustMonth(-1);
    };

    CalendarView.prototype.nextCal = function() {
      return this.model.adjustMonth(1);
    };

    CalendarView.prototype.render = function() {
      var table;
      this.calendarTableView = new CalendarTableView({
        model: this.model
      }).render();
      this.renderTop();
      table = this.calendarTableView.el;
      this.$el.append(table);
      $('table').wrap('<div class="cal" />');
      return this;
    };

    CalendarView.prototype.renderTop = function() {
      var top;
      top = ['<div class="top">', '<button class="prev"><</button>', '<h1>', this.model.get('monthsOfYear')[this.model.get('current').getMonth()], '</h1>', '<button class="next">></button>', '</div>'].join('');
      this.$el.append(top);
    };

    return CalendarView;

  })(Backbone.View);
  return CalendarView;
});