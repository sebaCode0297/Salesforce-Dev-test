public with sharing class CalloutPokeApi {
     public static final String URL = 'https://pokeapi.co/api/v2/pokemon';
 
     public static void getAllPokemon(){
         Http http = new Http();
         HttpRequest request = new HttpRequest();
         request.setEndpoint(URL);
         request.setMethod('GET');
         httpResponse response =http.send(request);
         Map<String, Object> results = new Map<String, Object>();
         List<Object> listResponse = new List<Object>();
         Integer counter = 0;
         Map<String, Object> pokeName = new Map<String, Object>();
         List<Object> name = new List<Object>();
         // If the request is successful, parse the JSON response.
         if (response.getStatusCode() == 200) {
             // Desealize the JSON string into collections of primitive data types.
             results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             listResponse = (List<Object>) results.get('results');
             }
         
         if(listResponse.isEmpty()){
             for(Object o: listResponse){
                 // casteamos los nombres de los pokemones desde 'o' y lo asignamos a la varibale pokeName.
                 pokeName = (Map<String, Object>)o;
                 if(counter < 10){
                     name.add((String)pokeName.get('name'));
                     
                 }
             }
        }
         System.debug('Name Pokemon : ' + name);
    }
 }