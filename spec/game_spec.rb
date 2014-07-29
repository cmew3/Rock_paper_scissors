	require 'game' 

describe Game do 
	let(:player1) {double :player1, name: "Stephen"}
	let(:player2) {double :player2, name: "Enrique"}
	let(:game){Game.new}

	it "is initialized without players" do
		expect(game.players).to eq []
	end

	it 'can add a player' do
		game.add_player player1
		expect(game.players.count).to eq 1
	end

	it 'raises an error if more than two players are added' do
		game.add_player player1
		game.add_player player2
		expect{game.add_player(player1)}.to raise_error(RuntimeError)
	end

	it 'knows when it has the correct number of players' do
		game.add_player player1
		expect(game.ready_to_start?).to be false
		game.add_player player2
		expect(game.ready_to_start?).to be true
	end

	it 'can identify a player by obejct id' do
		game = Game.new([player1,player2])
		expect(game.select_player_with(player1.object_id)).to eq player1
	end

	context 'when playing' do

		let(:game){Game.new([player1, player2])}

		it 'player one picks rock, player two picks scissors' do
			allow(player1).to receive(:pick).and_return("Rock")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player1
		end

		it 'player one picks paper, player two picks scissors' do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Scissors")
			expect(game.winner).to eq player2
		end

		it "player one picks paper, player two picks rock" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Rock")
			expect(game.winner).to eq player1
		end

		it "can be a draw" do
			allow(player1).to receive(:pick).and_return("Paper")
			allow(player2).to receive(:pick).and_return("Paper")
			expect(game.winner).to eq "Draw"
		end

	end

end