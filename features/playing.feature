Feature: Playing
	In order to play Rock Paper Scissors
	As a player
	I need to get two players

Scenario: A player can register
	Given I am on the homepage
	When I click "New Game"
	And I enter my name
	When I press "Play!"
	Then I should see "Please choose"

	Scenario: A player chooses to play computer
	Given I've registered to play
	When I choose "Play Computer"
	Then I should see "Let's duel"

	Scenario: A player chooses to play opponent
	Given I've registered to play
	When I choose "Play Live Opponent"
	Then I should see "Waiting for a second player"

Scenario: A second player can register
	Given another player has registered to play
	When I choose "Play Live Opponent"
	Then I should see "Let's duel"


Scenario: Playing a two player game
	Given two players have registered to play
	When I am first to choose "Paper"
	Then I should see "Waiting for"

Scenario: Playing a two player game
	Given two players have registered to play
	And the other player has selected "Rock" 
	When I choose "Paper"
	Then I should see "RESULTS"
