define ['backbone'], ->
	class DateModel extends Backbone.Model
		defaults:
			date: ''

	return DateModel