public with sharing class envioDatosPost {
    public envioDatosPost() {
        //Creamos un objeto de tipo http para acceder al servicio de HTTP
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        /* Content-Type, se utiliza para decirle al programa que se permite envio de datos
        Utilizando JSON */
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        // Se utiliza el metodo setBody para insertar y enviar un dato calve:valor en el cuerpo con formato JSON
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }

    }
}