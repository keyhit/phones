When(/^He go to the homepage$/) do
  visit root_path
end

Then(/^He would see the welcome message$/) do
  expect(page).to have_content("My greating for you, Guest!!!")
end