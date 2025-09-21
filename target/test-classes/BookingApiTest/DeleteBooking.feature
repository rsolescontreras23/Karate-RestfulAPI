Feature: Eliminar un booking en Restful-Booker

  Background:
    * url 'https://restful-booker.herokuapp.com'
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'

  Scenario: Login y eliminar un booking
    # 1. Obtener token
    Given path 'auth'
    And request
      """
      {
        "username" : "admin",
        "password" : "password123"
      }
      """
    When method post
    Then status 200