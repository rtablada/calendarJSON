// Generated by CoffeeScript 1.3.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['views/date', 'backbone'], function(DateView) {
  var DatesCollectionView;
  DatesCollectionView = (function(_super) {

    __extends(DatesCollectionView, _super);

    function DatesCollectionView() {
      this.addOne = __bind(this.addOne, this);
      return DatesCollectionView.__super__.constructor.apply(this, arguments);
    }

    DatesCollectionView.prototype.tagName = 'tr';

    DatesCollectionView.prototype.render = function() {
      this.collection.each(this.addOne);
      return this;
    };

    DatesCollectionView.prototype.addOne = function(date) {
      var dateView;
      dateView = new DateView({
        model: date
      }).render();
      return this.$el.append(dateView.el);
    };

    return DatesCollectionView;

  })(Backbone.View);
  return DatesCollectionView;
});
