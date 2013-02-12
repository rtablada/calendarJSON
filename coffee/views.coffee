class Calendar.Views.Calendar extends Backbone.View
	el: '#calendar',

	initialize: () ->
		header = new Calendar.Views.Header({ model: @model }).render()
		table = new Calendar.Views.Table({ model:@model }).render()
		@render()

	render: ->
		@$el.append @header.el
		@$el.append '<div class="cal">'
		@$el.append @table.el
		@$el.append '</div>'
		this

class Calendar.Views.Header extends Backbone.View
	className: 'calendarHead'

	template: _.template [
		'<button class="prev"><</button>',
		'<h1><%= month %></h1>',
		'<button class="next">></button>'].join "\n"

	render: ->
		@$el.append @template @model.toJSON()
		this

class Calendar.Views.Table extends Backbone.View
	tagName: 'table'

	initialize: ->
		@thead = new Calendar.Views.TableHead({ model: @model }).render()
		# @tbody = new Calendar.Views.TableBody({ model: @model }).render()

	render: ->
		@$el.append @thead.el
		@$el.append @tbody.el
		this

class Calendar.Views.TableHead extends Backbone.View
	tagName: 'thead'

	render: ->
		@$el.append '<tr>'
		@model.daysInWeek.each @addDay this
		@$el.append '</tr>'
		this

	addDay: (day) ->
		@$el.append '<th>' + day + '</th>'
		this
