Feature: Add Offer As Deliverer

Background:
  Given Deliverer 'D1' registers with phone number '6481095678' and logs in

Scenario: Add Offer Successfully
  When Deliverer 'D1' adds a new offer
  Then Deliverer should receive successful response
