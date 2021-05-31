
Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome To check the latest deals, create an account or login with github.")
end

Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
    Profile.create! profile
  end 
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create! user
  end 
end

Given /the following authorizations exist/ do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create! authorization
  end 
end

 Then /^I will see "([^"]*)"$/ do |message|
   # puts page.body
   expect(page.body).to have_content(message)
 end


# features/step_definitions/movie_steps.rb
Given /I am logged into Deals4all/ do
  steps %Q{
    Given I am on the Deals4all Landing Page   
    And I press "Register or Login with GitHub"
    And I am on the Deals4all Home Page
    }
end

Given /the following products exist/ do |products_table|
  products_table.hashes.each do |product|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
      Product.create(product)
  end
  #fail "Unimplemented"
end

# Then /^I will see "([^"]*)"$/ do |message|
#  puts page.body # <---
#  expect(page.body).to have_content(message)
# end

