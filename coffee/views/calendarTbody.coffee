define ['backbone'], ->
	class CalendarTbody extends Backbone.View
		tagName: 'tbody'

		render: -> 
			ret = ['<tr>']
			for i in [0...@model.get('days').length]
				ret.push '<td>' + @model.get('days').at(i).get('date') + '</td>'
				if (i+1) % 7 is 0
					ret.push '</tr><tr>'
			ret.push '</tr>'
			@$el.append ret.join('')
			this