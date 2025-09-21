# La API solo devuelve 13 objetos a pesar de tener registrados varios más.

Feature: Obtener objetos
  Background:
    * url 'https://api.restful-api.dev'

  Scenario: Obtener todos los objetos válidos
    Given path 'objects'
    When method get
    Then status 200
    * print 'Objetos obtenidos: ', response
