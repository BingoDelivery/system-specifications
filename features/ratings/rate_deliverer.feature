Feature: Rate Deliverer

  Background:
    Given Customer access the application
    And Deliverer 'D1' registers and logs in
    And Deliverer 'D1' publishes a new offer for product 'tortillas_de_maiz'
    And Customer sends request to get offers for product 'tortillas_de_maiz'
    And Customer places an order using offer from deliverer 'D1'

  Scenario: Customer Rates Deliverer For Order Service
    When Customer rates last order deliverer for 'SERVICE' with rating 2
    Then Customer should receive successful response

  Scenario: Deliverer Gets Reputation Updated When Customers Rates Him
    Given Customer rates last order deliverer for 'SERVICE' with rating -1
    When Deliverer 'D1' publishes a new offer for product 'RED_APPLE'
    Then Deliverer publishing 'RED_APPLE' should have reputation of -1
