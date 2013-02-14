define ['backbone'], ->
	class DateView extends Backbone.View
		tagName: 'td'

		render: ->
			console.log @model
			date = @model.get('date')
			if date is '' then ret = '<td></td>'
			else ret = '<td>' + date.getDate() + '</td>'
			@$el.append ret
			this

	return DateView