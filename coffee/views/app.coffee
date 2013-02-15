define ['backbone', 'views/calendar', 'views/appointments'], (Backbone, CalendarView, AppointmentsView) ->
	calendarView = new CalendarView()

	appointmentsView = new AppointmentsView()

	return calendarView