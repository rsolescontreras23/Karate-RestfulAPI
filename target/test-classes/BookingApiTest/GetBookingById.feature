Feature: Obtener una reserva por ID

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json' }


  Scenario: Obtener una reserva usando un ID válido
#    Creamos un booking
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
    * print 'ID del Booking creado: ', response.bookingid
    * def bookingId = response.bookingid

#   Llamamos un booking utilizando el ID del booking creado
    Given path 'booking', bookingId
    When method GET
    Then status 200
    * print 'Booking obtenido: ', response