Feature: Eliminamos complemente un objeto con un ID válido en Restful Api

  Background:
    * url 'https://api.restful-api.dev'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }

  Scenario: Eliminamos objeto usando una ID válida
#    Creamos un nuevo objeto válido y almacenamos el ID que se genera.
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
    * def obId = response.id
    * print 'Objeto creado con la id', obId

#    Llamomos al objeto creado usando su Id.
    Given path 'objects', obId
    When method GET
    Then status 200
    * print 'Objeto obtenido: ', response

#    Eliminamos el objeto creado
    Given path 'objects', obId
    When method DELETE
    Then status 200

#    Llamamos al objeto eliminado
    Given path 'objects', obId
    When method GET
    Then status 404
    * print 'Objeto modificado obtenido: ', response