Calendar.Views.Header = new Backbone.View.extend({
	className: 'calendarHead',

	template: _.template( [ '<button class="prev"><</button>', '<h1><%= month %></h1>', '<button class="next">></button>'].join( "\n" ) ),

	render: function () {
		this.$el.append( this.template( this.model.toJSON() ));
		return this;
	}
});

Calendar.Views.TableHead = new Backbone.View.extend({
	tagName: 'thead',

	render: function () {
		this.$el.append( '<tr>' );
		this.model.daysInWeek.each( this.addDay, this );
		this.$el.append( '</tr>' );
		return this;
	},

	addDay: function (day) {
		this.$el.append( '<th>' + day + '</th>' );
		return this;
	}
});

Calendar.Views.Table = new Backbone.View.extend({
	tagName: 'table',

	initialize: function () {
		this.thead = new Calendar.Views.TableHead({ model: this.model }).render();
		// this.tbody = new Calendar.Views.TableBody({ model: this.model }).render()
	},

	render: function () {
		this.$el.append( this.thead.el );
		this.$el.append( this.tbody.el );
		return this;
	}
});

Calendar.Views.Calendar = new Backbone.View.extend({
	className: 'calendar',

	initialize: function () {
		header = new Calendar.Views.Header({ model: this.model }).render();
		table = new Calendar.Views.Table({ model:this.model }).render();
		this.render();
	},

	render: function () {
		this.$el.append( this.header.el );
		this.$el.append( '<div class="cal">' );
		this.$el.append( this.table.el );
		this.$el.append( '</div>' );
		return this;
	}
});