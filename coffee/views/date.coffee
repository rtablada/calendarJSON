define ['backbone'], ->
	class DateView extends Backbone.View
		tagName: 'td'

		events:
			'click button': 'clicked'

		clicked: ->
			App.Vent.trigger 'fetchAppointments', @model.get 'date'

		render: ->
			date = @model.get 'date'
			if @model.get 'today'
				@$el.append '<button class"today date">' + date.getDate() + '</button>'
			else if date isnt ''
				@$el.append '<button class"date">' + date.getDate() + '</button>'
			this

	return DateView