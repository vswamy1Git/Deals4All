Feature:
As a user
I want to search and lookup products
So that I can find a deal for that product

Background: authorization and user in database  # <---- Add this block

  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester Suny| stester@binghamton.edu |
  
  Given the following products exist:
  |productcode | title | offer | create_date |
  |1234 | iphone | New deals available for iphone 11 and above | 05-24-2021 |
  Given I am logged into Deals4all

@omniauth_test5  
Scenario: browse products
Then I will see "Deals4all"
And I press "Log Out"

@omniauth_test6
Scenario: list of products
Given I am on the Browse Products Page
Then I will see "All Products"