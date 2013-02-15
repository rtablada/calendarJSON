define ['backbone', 'collections/dates', 'models/date'], (Backbone, DatesCollection, DateModel) ->
	class CalendarModel extends Backbone.Model
		defaults:
			daysOfWeek: ['Sun','Mon','Tues','Wed','Thurs','Fri','Sat']
			monthsOfYear: ['January','February','March','April','May','June','July','August','September','October','November','December']
			today: new Date()
			current: new Date()
			days: new DatesCollection()

		adjustMonth: (num) =>
			if(@attributes.current.getDate() > 28) then @attributes.current.setDate(28)
			@attributes.current.setMonth( @attributes.current.getMonth() + num )
			@setFirstLast()
			App.Vent.trigger 'rerender'

		setFirstLast: ->
			@firstOfMonth = new Date @get('current').getFullYear(), @get('current').getMonth(), 1
			@lastOfMonth = new Date @get('current').getFullYear(), @get('current').getMonth() + 1, 0

		initialize: ->
			@fillDays()

		fillDays: () ->
			@setFirstLast()
			@set 'days', new DatesCollection()
			for i in [0...@firstOfMonth.getDay()]
				@get('days').add new DateModel
			for i in [1..@lastOfMonth.getDate()]
				if i is @get('today').getDate()
					@get('days').add new DateModel({'date': new Date( @get('current').getFullYear(), @get('current').getMonth(), i), 'today': true})
				else @get('days').add new DateModel({'date': new Date @get('current').getFullYear(), @get('current').getMonth(), i})

	return CalendarModel