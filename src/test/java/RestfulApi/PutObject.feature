Feature: Modificar complemente un objeto con un ID válido en Restful Api

  Background:
    * url 'https://api.restful-api.dev'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }

  Scenario: Modificamos completamente un objeto usando una ID válida
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

#    Modificamos el objeto creado
    Given path 'objects', obId
    And request
    """
     {
         "name": "Objeto de prueba modificado",
         "data": {
            "year": 2026,
            "price": 399.99,
            "CPU model": "Intel Core i11",
            "Hard disk size": "2 TB"
         }
      }
     """
    When method PUT
    Then status 200

#    Llamamos al objeto modificado
    Given path 'objects', obId
    When method GET
    Then status 200
    * print 'Objeto modificado obtenido: ', response