Feature: Assign Best Offer

  Background:
    Given Deliverer 'D1' registers with email 'd1@minisuper.app', name 'Juan', and then and logs in
    And Deliverer 'D1' sends request to set location to '28.1867348', '-105.4608849'
    And Deliverer 'D2' registers with email 'd2@minisuper.app', name 'Maria', and then and logs in
    And Deliverer 'D2' sends request to set location to '28.1867348', '-105.4608849'
    And Customer access the application
    And Customer sends request to set location to '28.1867348', '-105.4608849'

  Scenario: Assign Lowest-Price Offer
    Given Deliverer 'D1' publishes a new offer for product 'tortillas_de_maiz' with price '20.99'
    And Deliverer 'D2' publishes a new offer for product 'tortillas_de_maiz' with price '19.99'
    When Customer sends request to assign best offer for product 'tortillas_de_maiz'
    Then Customer should receive successful response
    And the offer unit price for product 'tortillas_de_maiz' should be '19.99'
    And the offer should have the deliverer reputation
    And the best offer deliverer name should be 'Maria'

  Scenario: Assign Multiple Offer For Multiple Products
    Given Deliverer 'D1' publishes a new offer for product 'tortillas_de_maiz'
    And Deliverer 'D2' publishes a new offer for product 'red_apple'
    When Customer sends request to assign best offer these products
      | code           | quantity |
      | tortillas_de_maiz | 1        |
      | red_apple         | 1        |
    Then Customer should receive an offer for product 'tortillas_de_maiz' from deliverer 'Juan'
    And Customer should receive an offer for product 'red_apple' from deliverer 'Maria'


