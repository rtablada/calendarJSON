define ['backbone'], ->
	class CalendarTbody extends Backbone.View
		tagName: 'thead'

		render: -> 
			@$el.append '<th>' + day + '</th>' for day in @model.get('daysOfWeek')
			this