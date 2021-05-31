Feature:
As a user
I want to check an offer
So that I can get a deal

Background: authorization and user in database  # <---- Add this block

  Given the following authorizations exist:
  | provider|uid    |user_id|
  | github  |123456 |1      | 
  
  Given the following users exist:
  |name        | email                 |
  |Tester Suny| stester@binghamton.edu |
  
  Given the following products exist:
  |productcode | title | offer | 
  |1234 | iphone | New deals available for iphone 11 and above |
  
 


