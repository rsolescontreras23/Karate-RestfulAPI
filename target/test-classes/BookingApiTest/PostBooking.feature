Feature: Crear un booking en Restful-Booker

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }

  Scenario:
    Given path 'booking'
    And request
      """
      {
        "firstname": "Jim",
        "lastname": "Brown",
        "totalprice": 111,
        "depositpaid": true,
        "bookingdates": {
          "checkin": "2018-01-01",
          "checkout": "2019-01-01"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method POST
    Then status 200
    And match response.booking.firstname == "Jim"
    And match response.booking.lastname == "Brown"
    And assert responseTime < 2000
    * def bookingId = response.bookingid



