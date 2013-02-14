define ['backbone', 'models/date'], (Backbone, DateModel) ->
	class DatesCollection extends Backbone.Collection
		model: DateModel

	return DatesCollection