class Game 

	def initialize players = []
		@players = players
	end

	BEATS = {rock: :scissors, scissors: :paper, paper: :rock}

	attr_reader :players, :player1, :player2
	attr_writer :players

	def add_player player
		if players.count == 2 
			raise "Two players already playing"
		end
		@players<<player
	end	

	def select_player_with object_id
		players.select {|player| player.object_id == object_id}.first
	end

	def ready_to_start?
		players.count == 2
	end

	def player1
		players[0]
	end

	def player2
		players[1]
	end

	def winner
		return "Draw" if player1.pick == player2.pick
		return player1  if BEATS[normalize(player1.pick)] == normalize(player2.pick)
		player2
	end

	def normalize(pick)
		pick.downcase.to_sym
	end
end