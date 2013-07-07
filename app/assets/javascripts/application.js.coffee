# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .
$(document).ready ->
	$('div.turtle_item a.upvote, div.turtle_item a.downvote').click (event) ->
		event.preventDefault()

		upvote = $(this).hasClass('upvote')
		url = $(this).attr('href')
		link = $(this)

		# check if already voted, and if so, clear the vote
		if ((upvote && link.hasClass('red_arrow')) || link.hasClass('blue_arrow'))
			clearVote = true
			url = link.parent().attr('clear_url')

		# remove all css classes
		link.parent().find('a.upvote, a.downvote').removeClass('red_arrow blue_arrow')

		console.log(url)
		$.ajax
			type: 'put',
			url: url,
			success: (data) ->
				link.parent().find('p.score').html(data.score)
				unless clearVote
					if upvote
						link.addClass('red_arrow')
					else
						link.addClass('blue_arrow')
		false
