#= require hamlcoffee
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Nnt =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

$ ->
	currentUser = new Nnt.Models.User(id: 'current')
	currentUser.fetch().done ->
		turtlesCollection = new Nnt.Collections.TurtlesCollection()
		turtlesCollection.fetch().done ->
			turtleListView = new Nnt.Views.TurtleListView( collection: turtlesCollection, currentUser: currentUser.get('name') )
			turtleListView.render()
			$('#turtles').append turtleListView.el
				
