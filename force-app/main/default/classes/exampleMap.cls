public with sharing class exampleMap {

    public static void testMapas(){
        Map<String, String> mapNull;
        System.debug('El valor de mapNull es : ' + mapNull );

        Map<String , String> mapInicializado = new Map<String, String>();
        System.debug('El valor de mapInicializado es : ' + mapInicializado);

        Map<String, String> datosMapas = new Map<String, String>{'EUR' => 'Euro', 'MXN' => 'Peso Mexicano'};
        System.debug(datosMapas);

        // Funcion .put(); -> Permite agregar datos a un Map<>
        datosMapas.put('CLP', 'Peso Chileno');
        System.debug(datosMapas);

        // Funcion .size(); -> Permite obtener la cantidad de elementos del mapa - Mao<>
        System.debug('La cantidad de elementos que tiene mi Map esv: ' + datosMapas.size());

        Map<String, String> datos = datosMapas.clone();
        System.debug('Aqui esta la copia del Map - > datosMapas' + datos);

        // .keySet(); -> Recupera todas las llaves del mapa 
        System.debug('Recuperacion de todas las lavves del Map : ' + datos.keySet());
        // .values(); -> Recupera todos los valores del Mapa
        System.debug('Recuperando todos los valores del mapa : ' + datos.values());

        // Funcion para capturar el valor de la llave de un Mapa.
        // .get('nombreLlave'); -> se le debe asignar el valor de la llave para capturar el valor de esta.
        System.debug('Capturando el valor de una llave de un Mapa :' + datos.get('EUR'));

        //.toString(); -> convierte cadena de datos en tipo texto.
        // .containsKey('valor o nombre de la llave'); -> Podemos saber si el mapa contiene ese valor de llave
        // y nos devolvera un True or || false
    }
    public exampleMap() {

    }
}