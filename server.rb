require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base

enable :sessions
GAME = Game.new

  get '/' do
    erb :index
  end

  get '/new-game' do
  	erb :new_player
  end

  get '/reset' do
    GAME=Game.new
  end

  post '/reset' do
    if GAME.players.count == 2
      GAME.players=[]
    elsif GAME.players.count == 1
      GAME.players.delete(GAME.select_player_with(session[:my_id]))
    end
    @name = session[:my_name]
    erb :choose_opponent 
  end

  post '/register' do
    @name = params[:name] 
    session[:my_name] = @name
    erb :choose_opponent  
  end

  post "/holding_page" do
    @player = Player.new(params[:name])
    session[:my_id] = @player.object_id
    selection = params[:opponent]
    if selection == "Computer"
      GAME.players =[]
      GAME.add_player @player
      GAME.add_player generate_computer
      redirect '/playgame'
    else
      GAME.add_player @player
      redirect '/holding_page'
    end
  end

  get '/holding_page' do
    if GAME.ready_to_start?
      redirect '/playgame'
    else
      erb :holding_page
    end
  end

  get '/playgame' do
    @my_id = session[:my_id]
    erb :playgame
  end

  post '/play_game' do
    GAME.select_player_with(session[:my_id]).picks=params[:pick].downcase.to_sym
      redirect '/wait_for_pick'
  end

  get '/wait_for_pick' do
     if GAME.player1.pick == nil || GAME.player2.pick == nil
      erb :wait_for_pick
    else
      @me= GAME.select_player_with(session[:my_id])
      @winner=GAME.winner
      @loser = GAME.loser
    erb :outcome
    end
  end

  def generate_computer
  	comp = Player.new("He-Who-Must-Not-Be-Named")
  	comp.picks = [:wand,:cloak,:potion].sample
  	comp
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
