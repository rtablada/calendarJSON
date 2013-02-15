define ['views/date', 'backbone'], (DateView) ->
	class DatesCollectionView extends Backbone.View
		tagName: 'tr'

		render: ->
			@collection.each @.addOne
			this

		addOne: (date) =>
			dateView = new DateView({ model:date }).render()
			@$el.append dateView.el

	return DatesCollectionView