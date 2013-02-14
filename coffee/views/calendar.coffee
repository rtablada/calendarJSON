define ['models/calendar', 'views/calendarTable'], (CalendarModel, CalendarTableView) ->
	class CalendarView extends Backbone.View
		el: '.calendar'

		initialize: ->
			@calendarTableView = new CalendarTableView( {model: @model} ).render()

		events:
			'click .prev': 'prevCal'
			'click .next': 'nextCal'

		prevCal: ->
			@model.adjustMonth -1

		nextCal: ->
			@model.adjustMonth 1

		render: ->
			@renderTop()
			table = @calendarTableView.el
			@$el.append table
			this

		renderTop: ->
			top = [
				'<div class="top">'
				'<button class="prev"><</button>'
				'<h1>', @model.get('monthsOfYear')[@model.get('month')], '</h1>'
				'<button class="next">></button>'
				'</div>'
			].join('')
			@$el.append(top)
			return			

	return CalendarView