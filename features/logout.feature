# features/logout.feature

Feature: Logout
  As a registered member
  So that I can get back to welcome page
  I want to logout of the Deals4all application

Background: authorization and user in database

  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester SUNY| stester@binghamton.edu |
  
  Given I am logged into Deals4all

@omniauth_test4
Scenario: logout
  When I press "Log Out"
  Then I will see "Tester SUNY has logged out."  
  And I am on the Deals4all Landing Page
  And I will see "Welcome"