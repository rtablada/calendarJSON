require.config
	shim:
		'backbone':
			deps: ['vendor/underscore', 'jquery']
			exports: 'Backbone'

	paths:
		jquery: 'vendor/jquery.min'
		backbone: 'vendor/backbone'

require ['models/calendar', 'views/calendar', 'jquery'], (CalendarModel, CalendarView)->
	window.App =
		Vent: _.extend({}, Backbone.Events)

	calendar = new CalendarModel()
	calendarView = new CalendarView({model: calendar}).render()
	