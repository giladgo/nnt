#=require js-routes

class Nnt.Models.Turtle extends Backbone.RelationalModel
  urlRoot: Routes.turtles_path
  defaults: null
  relations: [{
  	type: Backbone.HasMany,
  	key: 'votes',
  	relatedModel: 'Nnt.Models.Vote',
  	collectionType: 'Nnt.Models.VotesCollection',
  	reverseRelation: {
  		key: 'turtle',
  		includeInJSON: 'id,upvote,user_id,turtle_id'
  	}
  }]

  createVote: (votes, up) ->
    vote = new Nnt.Models.Vote()
    vote.set('upvote', up)
    vote.set('turtle_id', @get('id'))
    votes.add(vote)
    vote.save()
    console.log "increase"
    @set('score', @get('score')+(if up then 1 else -1))

  destroyVote: (votes) ->
    up = votes.models[0].get('upvote')
    votes.models[0].destroy()
    console.log "decrease"
    @set('score', @get('score')+(if up then -1 else 1))

  doVote: (up) ->
    votes = @get('votes')
    if votes.length == 0
      @createVote(votes, up)
    else if up != votes.models[0].get('upvote')
      # WHY
      @destroyVote(votes)
      @createVote(votes, up)
    else
      @destroyVote(votes)


  upvote: ->
  	@doVote(true)

  downvote: ->
  	@doVote(false)


class Nnt.Collections.TurtlesCollection extends Backbone.Collection
  model: Nnt.Models.Turtle
  url: Routes.turtles_path()
