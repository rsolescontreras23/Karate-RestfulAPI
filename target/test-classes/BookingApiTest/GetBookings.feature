Feature: Obtener todas las reservas

  Scenario: Obtener todas las reservas válidas
    Given url 'https://restful-booker.herokuapp.com/booking'
    When method get
    Then status 200
