Calendar.Models.Day = new Backbone.Model.extend({
	defaults: {
		id: '',
		date: '',
		today: false
	}
});

Calendar.Models.Calendar = Backbone.Model.extend({});