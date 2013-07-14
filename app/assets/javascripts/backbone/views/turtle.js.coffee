TEMPLATE_ROOT = "backbone/templates"

tp = (t) ->
	[TEMPLATE_ROOT, t].join("/")

class Nnt.Views.TurtleView extends Backbone.View
	className: 'turtle_item'

	render: ->
		console.log "RENDER"
		html = JST[tp("turtles/_turtle")]({ 'model': @model, 'currentUser': @options.currentUser } )
		@$el.html(html)
		return this

	events: { 
		"click a.upvote": "upvoteClick"
		"click a.downvote": "downvoteClick"
	}

	initialize: ->
		@listenTo(@model, 'change', @render);
		@listenTo(@model, 'add:votes', @render);
		@listenTo(@model, 'remove:votes', @render);
		
	upvoteClick: ->
		@model.upvote()

	downvoteClick: ->
		@model.downvote()

class Nnt.Views.TurtleListView extends Backbone.View
	initialize: ->
		@collection.bind 'add', @addOne
		@collection.bind 'reset', @addAll

	addOne: (turtle) ->
		turtleView = new Nnt.Views.TurtleView({model: turtle, currentUser: @options.currentUser})
		@$el.append turtleView.render().el

	addAll: ->
		@collection.forEach (t) =>
			@addOne(t)

	render: ->
		@addAll()
		