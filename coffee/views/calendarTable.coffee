define ['models/calendar', 'views/calendarThead', 'views/calendarTbody'], (CalendarModel, CalendarThead, CalendarTbody) ->
	class CalendarTableView extends Backbone.View
		tagName: 'table'

		initialize: ->
			@calendarThead = new CalendarThead( {model: @model }).render()
			@calendarTbody = new CalendarTbody( {model: @model }).render()

		render: ->
			@$el.append @calendarThead.el
			@$el.append @calendarTbody.el
			this

	return CalendarTableView