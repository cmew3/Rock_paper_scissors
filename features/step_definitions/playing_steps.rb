
Given(/^I am on the homepage$/) do
	visit '/'
end

When(/^I click "(.*?)"$/) do |arg1|
  click_link arg1

end

When(/^I press "(.*?)"$/) do |arg1|
	click_button(arg1)
end

When(/^I choose "(.*?)"$/) do |arg1|
	click_button(arg1)
end

Then(/^I should see "(.*?)"$/) do |text|
	page.should have_content text
end

When(/^I enter my name$/) do
  fill_in "name", with: "Stephen"
end

Then(/^I should be ready to play$/) do
  expect(page).to have_content("Welcome")
end

Given(/^a player has already registered$/) do
	GAME = Game.new
	GAME.add_player(Player.new("Sam"))
end

Given(/^two players have registered to play$/) do
  GAME = Game.new
  GAME.add_player(Player.new(name: "Nikesh"))
  me = Player.new("Charlotte")
  GAME.add_player(me)
  @my_id=me.object_id
  visit '/playgame'
end

Given(/^I've registered to play$/) do
	visit '/reset'
  	visit '/new-game'
  	click_button "Play!"
end

Then(/^another player has registered to play$/) do
  visit '/new-game'
  click_button "Play!"
end

Given(/^a new game$/) do
	visit '/reset'
end

When(/^I choose Paper$/) do
  click_button('Paper')
end
