class Nnt.Models.Vote extends Backbone.RelationalModel
	defaults: null
	urlRoot: Routes.votes_path

class Nnt.Models.VotesCollection extends Backbone.Collection
	model: Nnt.Models.Vote
	