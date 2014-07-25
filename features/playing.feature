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

	Scenario: A player chooses opponent
	Given I've registered to play
	When I choose "Play Computer"
	Then I should see "Let's duel"

	Scenario: A player chooses opponent
	Given I've registered to play
	When I choose "Play Live Opponent"
	Then I should see "Waiting for a second player"

Scenario: A second player can register
	Given a player has already registered
	And another player has registered to play
	When I choose "Play Live Opponent"
	Then I should see "Let's duel"
	When I choose "Paper"
	Then I should see "Waiting for"

@wip
Scenario: A player is playing
	Given I've registered to play
	When I choose "Paper"
	Then I should see "RESULTS"