# feature/register.feature
Feature: Register
  As a potential member
  So that can see information about the latest deals
  I want register for the Deals4all application
  
Background: profiles in database

  Given the following profiles exists:
  | primary_language|secondary_language|favorite_movie|worst_movie|favorite_genre|user_id|
  | English         | Music            | Blade Runner |Ishtar     |SciFi         |       |    

@omniauth_test1
Scenario: Register
  Given I am on the Deals4all Landing Page
  And I press "Register or Login with GitHub"
  Then I will see "Welcome Tester Suny! You have signed up via github."
  And I will see "Editing profile"

@omniauth_test2
Scenario:  Can't Register without SUNY ID
  Given I am on the Deals4all Landing Page
  And I press "Register or Login with GitHub"
  Then I will see "ActiveRecord::RecordInvalid: Validation failed: Email must be for Binghamton University"