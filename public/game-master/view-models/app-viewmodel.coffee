warp = require 'nexus-warp'

class AppViewModel
	constructor: (sessionId) ->

		@user_data = new nx.Cell
		@game_session_id = new nx.Cell
		@round_phase = new nx.Cell
		@puzzles = new nx.Cell
		@current_puzzle_index = new nx.Cell
		@node_list = new nx.Cell
		@countdown = new nx.Cell
		@role      = new nx.Cell
		@players = new nx.Collection

		new warp.Client
			transport: new warp.WebSocketTransport address:"ws://#{window.location.host}"
			entities:
				user_data:            @user_data
				game_session_id:      @game_session_id
				role:                 @role

				round_phase:          @round_phase
				puzzles:              @puzzles
				current_puzzle_index: @current_puzzle_index
				node_list:            @node_list
				countdown:            @countdown
				players:         @players

		@game_session_id.value = sessionId

module.exports = AppViewModel
