define ['backbone', 'collections/dates', 'models/date'], (Backbone, DatesCollection, DateModel) ->
	class CalendarModel extends Backbone.Model
		defaults:
			daysOfWeek: ['Sun','Mon','Tues','Wed','Thurs','Fri','Sat']
			monthsOfYear: ['January','February','March','April','May','June','July','August','September','October','November','December']
			today: new Date()
			current: new Date()
			month: new Date().getMonth()
			days: new DatesCollection()

		adjustMonth: (num) =>
			if(@attributes.current.getDate() > 28) then @attributes.current.setDate(28)
			@attributes.current.setMonth( @attributes.current.getMonth() + num )
			@attributes.month = @attributes.current.getMonth()
			@setFirstLast()
			console.log @firstOfMonth.toString()

		setFirstLast: ->
			@firstOfMonth = new Date @get('current').getFullYear(), @get('current').getMonth(), 0
			@lastOfMonth = new Date @get('current').getFullYear(), @get('current').getMonth() + 1, 0

		initialize: ->
			firstOfMonth = new Date @get('today').getFullYear(), @get('today').getMonth(), 0
			lastOfMonth = new Date @get('today').getFullYear(), @get('today').getMonth() + 1, 0
			@fillDays firstOfMonth, lastOfMonth

		fillDays: (firstOfMonth, lastOfMonth) ->
			for i in [0..firstOfMonth.getDay()]
				@get('days').add new DateModel
			for i in [0...lastOfMonth.getDate()]
				if i is @get('today').getDate then @get('days').add new DateModel({'date': i+1, 'today': true})
				else @get('days').add new DateModel({'date': i+1})

	return CalendarModel