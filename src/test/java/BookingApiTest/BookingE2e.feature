# Actividad : hacer un featre que tenga el metodo POST, GET BY ID, PUT, DELETE
Feature: Flujo end-to-end de Restful-Booker
  Background:
    * url 'https://restful-booker.herokuapp.com'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }



  Scenario: Hacer un feature que tenga el método POST, GET BY ID, PUT, DELETE
    # Creamos el token
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
    * def token = response.token

    # Creamos un nuevo booking
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

  # Obtenemos el booking by ID
    Given path 'booking', bookingId
    When method GET
    Then status 200
    * print 'Booking obtenido: ', response


  # Modificamos el booking obtenido
    Given path 'booking', bookingId
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


#    Eliminamos el booking.
    Given path 'booking', bookingId
    And header Cookie = "token="+token
    When method DELETE
    Then status 201