Calendar = {
	Models: {},
	Collections: {},
	Views: {},
	Router: {}
};

Calendar.Models.Day = Backbone.Model.extend({
	defaults: {
		id: '',
		date: '',
		today: false
	}
});

Calendar.Models.Calendar = Backbone.Model.extend({

});

calendar = { Month: 'Feb', Year: 2013, daysInWeek: ['Sunday'], days: [], start_cell: 5, date: {month: 2, year: 2013} };

Calendar.Views.Calendar = Backbone.View.extend({
	el: '.calendar',

	initialize: function () {
		this.header = new Calendar.Views.Header({ model: this.model }).render();
		this.table = new Calendar.Views.Table({ model: this.model }).render();
		this.render();
	},

	render: function () {
		this.$el.append( this.header.el );
		this.$el.append( this.table.el );
	}
});

Calendar.Views.Header = Backbone.View.extend({
	className: 'calendarHead',

	template: _.template([	'<button class="prev"><</button>',
							'<h1><%= month %></h1>',
							'<button class="next">></button>'].join("\n")),

	render: function () {
		this.$el.append( this.template(this.model.toJSON() ) );
		return this;
	}
});