# I'm gonna need to refactor this as the daysCollectionView
# Then template this all!

define ['backbone', 'views/datesCollection', 'collections/dates'], (Backbone, DatesCollectionView, DatesCollection)->
	class CalendarTbody extends Backbone.View
		tagName: 'tbody'

		render: ->
			days = @model.get 'days'
			for i in [0..days.length/7]
				week = new DatesCollection()
				for x in [i*7...i*7+7]
					week.add days.at x
				datesCollectionView = new DatesCollectionView({ collection: week}).render()
				@$el.append datesCollectionView.el
			this

	return CalendarTbody