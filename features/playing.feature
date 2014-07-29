Feature: Playing
	In order to play Rock Paper Scissors
	As a player
	I need to get two players

Scenario: A player can register
	Given I am on the homepage
	When I click "Prepare to duel"
	And I enter my name
	When I press "Duel!"
	Then I should see "Please choose"

	Scenario: A player chooses to play computer
	Given I've registered to play
	When I choose "He-Who-Must-Not-Be-Named"
	Then I should see "Choose your weapon"

	Scenario: A player chooses to play opponent
	Given I've registered to play
	When I choose "Play Live Wizard"
	Then I should see "Waiting for"

Scenario: A second player can register
	Given another player has registered to play
	When I choose "Play Live Wizard"
	Then I should see "Choose your"


