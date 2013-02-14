define ['models/calendar', 'views/calendarTable'], (CalendarModel, CalendarTableView) ->
	class CalendarView extends Backbone.View
		el: '.calendar'

		initialize: ->
			App.Vent.on 'rerender', @updateView, this

		updateView: ->
			@model.fillDays()
			@$el.html('')
			@render()

		events:
			'click .prev': 'prevCal'
			'click .next': 'nextCal'

		prevCal: ->
			@model.adjustMonth -1

		nextCal: ->
			@model.adjustMonth 1

		render: ->
			@calendarTableView = new CalendarTableView( {model: @model} ).render()
			@renderTop()
			table = @calendarTableView.el
			@$el.append table

			# I wish there was a better way to do this b4 going on template
			$('table').wrap('<div class="cal" />')
			this

		renderTop: ->
			top = [
				'<div class="top">'
				'<button class="prev"><</button>'
				'<h1>', @model.get('monthsOfYear')[@model.get('current').getMonth()], '</h1>'
				'<button class="next">></button>'
				'</div>'
			].join('')
			@$el.append(top)
			return			

	return CalendarView