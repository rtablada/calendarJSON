require.config
	shim:
		'backbone':
			deps: ['vendor/underscore', 'jquery']
			exports: 'Backbone'

	paths:
		jquery: 'vendor/jquery.min'
		backbone: 'vendor/backbone'

require ['models/calendar', 'views/calendar', 'jquery'], (CalendarModel, CalendarView)->
	calendar = new CalendarModel()
	calendarView = new CalendarView({model: calendar}).render()
	