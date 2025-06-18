Given("I am on the quest list page") do
  visit "/quests"
end

When("I click on the new quest button") do
  find("[data-testid='new-quest-button']").click
end

When("I fill in the quest title with {string}") do |title|
  fill_in find("[data-testid='quest-title-input']")[:name], with: title
end

When("I click the create button") do
  find("[data-testid='submit-new-quest']").click
end

Then("I should see a quest titled {string}") do |title|
  expect(page).to have_css("[data-testid^='quest-title-']", text: title)
end

Then("I should not see the quest titled {string}") do |title|
  expect(page).not_to have_css("[data-testid^='quest-title-']", text: title)
end

Given("the quest {string} exists") do |title|
  Quest.create!(title: title, status: false)
  visit "/quests"
end

When("I toggle the quest {string}") do |title|
  frame = find(:css, "[data-testid^='quest-title-']", text: title).ancestor("turbo-frame")
  frame.find("input[type='checkbox']").click
end

# Then("the quest {string} should be marked as completed") do |title|
#   element = find("[data-testid^='quest-title-']", text: title)
#   expect(element[:class]).to include("line-through")
# end
# Then("the quest {string} should be marked as completed") do |title|
#   quest = Quest.find_by(title: title)
#   frame_id = "quest_#{quest.id}"

#   using_wait_time 5 do
#     expect(page).to have_css("turbo-frame##{frame_id} span.line-through", text: title)
#   end
# end

When("I delete the quest {string}") do |title|
  frame = find(:css, "[data-testid^='quest-title-']", text: title).ancestor("turbo-frame")
  frame.find("[data-testid^='delete-quest-button']").click
end
