Feature: Crear un objecto en Restful Api

  Background:
    * url 'https://api.restful-api.dev'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }

  Scenario: Crear un nuevo objeto
# Creamos un nuevo objeto
    Given path 'objects'
    And request
      """
     {
         "name": "Objeto de prueba",
         "data": {
            "year": 2025,
            "price": 199.99,
            "CPU model": "Intel Core i9",
            "Hard disk size": "1 TB"
         }
      }
      """
    When method POST
    Then status 200
    And match response.name == "Objeto de prueba"

