@RestResource(urlMapping='/id/*')
global with sharing class AnimalLocator {

    Integer dato;
    String Id;
    
    global static HttpResponse getAnimalNameById(String Id) {
        // Creamos un objeto nuevo Http
        Http http = new Http();
        // Creamos un objeto de tipo HttpRequest para realizar consultas.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/id');
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            // Tipos de Arrays para almacenar varios datos
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }

        return response;
    }
}