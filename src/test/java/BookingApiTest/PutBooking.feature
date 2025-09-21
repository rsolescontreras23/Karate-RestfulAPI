Feature: Actualizar un booking en Restful-Booker

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }

  Scenario: Actualizar un booking existente.
    Given path 'auth'
    And request
      """
      {
      "username": "admin",
      "password": "password123"
      }
      """
    When method POST
    Then status 200
    * print 'respuesta', response
    * def token = response.token

    Given path 'booking', 1
    And header Cookie = "token="+token
    And request
      """
      {
        "firstname": "James",
        "lastname": "Brown",
        "totalprice": 333,
        "depositpaid": true,
        "bookingdates": {
          "checkin": "2025-06-01",
          "checkout": "2025-06-10"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method PUT
    Then status 200
    * print 'respuesta', response
