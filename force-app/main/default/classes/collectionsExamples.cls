public with sharing class collectionsExamples {
    public static void main(String[] args){
        testEjemploListas();
    }
    public static void testEjemploListas(){
        List<String> listNull; //Lista vacia o nulo
        String[] anotherListNull;
        system.debug('Valor de listNull : ' + listNull);
        system.debug('Valor de anotherListNull : ' + anotherListNull);
        
        // Lista vacia para almacenar valores de tipo string
    	//List<String> listInicializada = new List<String>();
    	
    	// Lista a la cual le pasamos como parametros algunos valores de tipo String.
        List<String> listInicializada = new List<String>{'Teresa', 'Eulises', 'Maria'};
        String[] anotherListInicializada = new List<String>();
        system.debug('Valor de listNull : ' + listInicializada);
        system.debug('Valor de anotherListNull : ' + anotherListInicializada);
        
        // Agregando un nuevo elemento a una lista existente usando el metodo 'nameList.add('Valor nuevo');
        listInicializada.add('Camila bonita');
		System.debug(listInicializada);
        
        // Accedemos a la posicion de un elemento dentro de una lista
        System.debug(listInicializada[3]);
		// Accedemos a la posicion de un elemento dentro de una lista usando el metodo .get(posicion del elemento)
        System.debug(listInicializada.get(2));
        
        // Obtenemos el tamaño de la lista usando la funcion '.size()' esto nos dara la cantidad de elementos en la lista.
        System.debug('Tamaño de la lista : ' + listInicializada.size());
        
        // Para cambiar un valor que esta dentro de una lista, usamos el metodo '.set(posicion, valorNuevo)'
        listInicializada.set(1, 'Sergito');
        System.debug(listInicializada.get(1));
        
        // Para limpiar una lista por completo se debe usar el metodo '.clear()' luego del nombre de la lista que se quiere limpiar.
        // listInicializada.clear();
        // System.debug(listInicializada);

        List<String> newListCountry = new List<String>{'Chile', 'Argentina', 'Brasil'};
        System.debug('Lista nueva: ' + newListCountry);
        

        if (newListCountry.isEmpty()) {
            System.debug('La lista esta vacia' + newListCountry);
        } else {
            newListCountry.add('Nuevo nombre');
            System.debug(newListCountry);
        }
        
        // Para orderna los elementos de una lista de forma Ascendente, usamos el metodo '.sort()' luego del nombre de la lista, esto
        // ordenara todos los elementos segun su letra inicial.
        listInicializada.sort();
        System.debug(listInicializada);
        
        // Creacion de una lista con valores ingresados a mano
        List<String> listOfNames = new List<String>{'Seba', 'Benjita', 'Sergio'};
        // Uso de validacion de si una lista esta vacia o no usando la funcion nameList.isEmpty();
        listOfNames.addAll(new List<String>{'Seba', 'Benjita', 'Sergio'});
        listOfNames.clear();
        System.debug('La lista esta vacia?' + listOfNames.isEmpty());
        System.debug('El valor actual de listOfNames usando addAll es: ' + listOfNames);
        
        /* Utilizamos la funcion nameList.contains(valor); para consulta si la lista o algun conjunto de datos contiene un valor en
        especifico */ 
        System.debug('Contiene un valor llamado Booker la lista?' + listOfNames.contains('Booker')); //False
        System.debug(listOfNames);
        
        /* Usando la funcion nameList.indexOf(valorPosicion); nos indicara la posicion del elemento buscando dentro de la lista*/
        System.debug('La posicion del valor es: ' + listOfNames.indexOf('Booker')); // Devolvera siempre -1 dado que el valor no existe
		System.debug('La posicion del valor es: ' + listOfNames.indexOf('Seba')); //Devolvera el valor numerico equivalente a la posicion del elemento

        List<String> NameslistExisted = new List<String>{'Maria','Carla','Camila'};

        //Clonar una lista existente
        List<String> listNameCloned = new List<String>(NameslistExisted);
        System.debug('Lsita clon:' + listNameCloned);

    }

    // Uso de SET o Conjuntos en Apex
    public static void testEjemplosSets(){
        Set<String> setNull;
        System.debug('Set vacio : ' + setNull);

        Set<String> setOfCountry = new Set<String>{'Chile','España','Brasil'};
        System.debug('La lista de Paises actual es de : ' + setOfCountry);
        setOfCountry.add('Guatemala');
        System.debug('La lista de Paises actualziada es de : ' + setOfCountry);

        //Consultar si contiene un pais que tenga la letra 'C'
        System.debug('La lista contiene paises con C : ' + setOfCountry.contains('C'));

        //Limpiar el set
        setOfCountry.clear();
        // System.debug('Limpiamos nuestro SET y lo dejamos vacio: ' + setOfCountry.clear());

    }
    
    public static void testEjemplosMapas(){
        Map<String, Integer> mapNull; // Mapa nulo
        Map<String, String> newMap = new Map<String, String>(); // Declaracion de mapa vacio
        Map<String, String> mapName = new Map<String, String>{'Seba'=>'Albornoz'};
            
        // nameMap.put(valor, valor); | nameMap.put('Seba', 25);
        mapName.put('Benjita', 'Camilo');
        System.debug(mapName);
        
        // Usamos la funcion .size() para saber cuantos elementos o que tamaño tiene el mapa
        system.debug('El tamaño de este map es de : ' + mapName.size());
        
        Map<String, String> mapaCloned = mapName.clone();
        system.debug('Mapa clonado : ' + mapaCloned);
        mapaCloned.clear(); // Se utiliza la funcion nameMap.clear(); para limpiar
        
        // .keySet(), esta funcion recupera todas las llaves del mapa.
        System.debug('Las llaves de mapaCloned son : ' + mapaCloned.keySet());
        
        // .value(), con esta funcion recuperamos todos los valores existentes en un Mapa
        System.debug('Los valores de mapaCloned son : ' + mapaCloned.values());
        
        // .get(), con esta funcion nos retornara el valor del elemento dada la llave correspondiente
        System.debug('El valor en el mapaCloned ' + mapaCloned.get('Camilo'));
        
        // .toString(), esta funcion es usada para retornar el valor en string del mapa
        Map<String, String> MapaName = new Map<String, String>{'Name' => 'Camila', 'Carin' => 'Blanco'};
        String mapaTexto = MapaName.toString();
        System.debug('El valor en String del mapa mapaCloned es : ' + mapaTexto);

        Map<String, String> mapExample = new Map<String, String>();
        mapExample.put('Nombre','Sebastian');
        System.debug(mapExample);
        System.debug('El valor o valores de esta llave son: ' + mapExample.get('Sebastian'));
        Map<String, Integer> UserData = new Map<String, Integer>{'Seba' => 25};
        System.debug(UserData);
        // System.debug(UserData.size()); //.size() te da el tamaño del Map
        // Map<String, Integer> UserDt = UserData.clone();
        // UserData.clear(); // Funcion .clear() para limpiar el map por completo

        //keySet(); Recupera todas las llaves del mapa
        Map<String, Integer> keySetExample = new Map<String, Integer>();
        keySetExample.put('Seba', 25);
        keySetExample.put('Camila', 26);
        keySetExample.put('Juaco', 30);
        keySetExample.put('Carlota', 56);
        System.debug('Map kkeySetExample: ' + keySetExample);
    }

    // public static void testColeccionesSOQL(){
    //     // Lista de registro de cuentas
    //     List<Account> listaDeCuentas = new List<Account>();
    //     listaDeCuentas = [SELECT id, Name, Type FROM Account WHERE Type != '' ORDER BY Name ASC LIMIT 5];
    //     System.debug('Resultado de la consulta :' + listaDeCuentas);
        
    //     // usando la funcion .get(N_posicion), accedemos al valor en la posicion idicada como parametro
    //     System.debug('Resultado de la consulta :' + listaDeCuentas.get(0));
        
    //     // Para acceder a algun valor en especifico del resultado en la posicion que buscamos le concatenamos luego del .get(N_posicion).valor
    //     System.debug('Resultado de la consulta :' + listaDeCuentas.get(0).Name);
        
        
    //     // Funcion para agregar un valor a la lista de cuentas 
    //     Account objCuenta = new Account(); // Instanciamos el obj Cuenta y le asignamos un alias
    //     objCuenta.Name = 'Cuenta nueva test'; // Le agregamos un valor nuevo al nombre en el campo Name del obj Cuenta
    //     objCuenta.Type = 'Prospect';
        
    //     listaDeCuentas.add(objCuenta);
    //     System.debug(objCuenta);
    //     System.debug(listaDeCuentas.contains(objCuenta));
    //     List<Account> newObjAccount = new List<Account>();
    //     System.debug(newObjAccount);
        
    //     // Para poder acceder al ultimo elemento de una lista podemos combinar funciones como .get() y .size() agregando -1
    //     System.debug('Ultimo elemento : ' + listaDeCuentas.get(listaDeCuentas.size()-1));
    //     // listaDeCuentas.get() -> lo utilizamos para obtener un valor en especifico
    //     // listaDeCuentas.size()-1 -> lo utilizamos para obtener la cantidad de elementos existentes y le restamos 1 (-1).
    //     // Si lo combinamos, le estamos solicitando que obtenga elementos en la posicion que le especificamos como parametro -> listaDeCuentas.get(listaDeCuentas.size()-1);
        
    //      // Ahora usaremos la funcion .indexOf(valor);
    //      Integer posicionCuenta = listaDeCuentas.indexOf(objCuenta);
    //      System.debug('Usando el indexOf para obtener la posicion de una cuenta desde el obj : ' + listaDeCuentas.get(listaDeCuentas.indexOf(objCuenta)));             

    //      List<Integer> listRut = new List<Integer>{1111111, 22222222, 333333};
    //      System.debug('IndexOF de listRut : ' + listRut.indexOf(22222222));
    // }
    
    public static void collectionAllAccount(){
        
        // Creacion de un obj de tipo cuenta y le seteamos valores a los campos seleccionados
        Account AllAccount = new Account();
        
        AllAccount.Name = 'Naelito';
        AllAccount.AccountNumber = '12345';
        AllAccount.AccountSource = 'No Identificado';
        AllAccount.AnnualRevenue = 2100;
        AllAccount.NumberOfEmployees = 12;
        System.debug(AllAccount);
        
        
        // Esta es otra manera de instancia un objeto y asignar valores a los campos del obj Opp
        Opportunity ObjOpp = new Opportunity(
        	Name = 'Sebastian Albornoz Camilo',
            Description = 'Oportunidad test',
            LeadSource = 'No identificado',
            isPrivate = true
        );
        System.debug(ObjOpp);
        
        Empleado__c  ObjEmployes = new Empleado__c(
        	Name = 'Naelito blanco',
            Email__c = 'ing.seba@gmail.com',
            Departamento__c = 'Medicina',
            Salario__c = 2500
        );
        System.debug('Datos registrado : ' + ObjEmployes);
        
        
        
        Map<String, List<sObject>> mapaDeOpp = new Map<String, List<sObject>>();
        
    }

    public static String getConsultingSAP(String name, String Cargo){

        Account cto = New Account();

        String nameConsulting = name;
        String cargoConsulting = Cargo;

        return '';
    }
    
    public static void testColeccionesSOQL_dos(){
        List<Account> listaDeCuentas = new List<Account>();
        
        listaDeCuentas = [SELECT Id, name, type FROM Account WHERE Name != ''];
        System.debug('Lista de cuentas -> ' + listaDeCuentas);

        // Aqui estoy instanciando el obj cuenta para crear una nueva cuenta de forma manual y luego asignarla en la lista de Cuentas.
        Account objCuenta = new Account();
        objCuenta.Name = '';
        objCuenta.Type = 'Other';
        System.debug('Validar si la lista cuenta contiene objCuenta -> ' + listaDeCuentas.contains(objCuenta));
        listaDeCuentas.add(objCuenta);
        System.debug('Validar si la lista cuenta contiene objCuenta -> ' + listaDeCuentas.contains(objCuenta));
        Integer posicionCuenta = listaDeCuentas.indexOf(objCuenta);
        System.debug('Otra forma de ir por la nueva Cuenta usando indexOf' + listaDeCuentas.get(posicionCuenta));

        System.debug('USO DE SET');

        Set<Account> setDeCuentas = new Set<Account>([SELECT Id, Name, Type FROM Account WHERE Type != '' ORDER BY Name ASC LIMIT 5]);
        System.debug('Conjunto de valores en mi SET de Cuentas' + setDeCuentas);
        System.debug('Conjunto de valores en mi SET de Cuentas' + setDeCuentas.size());
        //Pedir a Feña quue me explique este uso de remove desde un set hacia una list
        setDeCuentas.remove(listaDeCuentas.get(0));

        System.debug('USO DE MAP');

        // Key - Value
        Map<Id, Account> MapaDeCuentas = new Map<Id, Account>([SELECT Id, Name, Type FROM Account WHERE Type != '' ORDER BY Name ASC LIMIT 3]);
        System.debug('>> Mapa de cuentas' + MapaDeCuentas);
        System.debug('Tamaño de mapa de cuentas ' + MapaDeCuentas.size());
        System.debug('Llaves mapa de cuentas ' + MapaDeCuentas.keySet());
        System.debug('Valores mapa de cuentas ' + MapaDeCuentas.values());

        Set<Id> idsCuentas = new Map<Id, sObject>([SELECT Id, Name FROM Account ORDER BY Name ASC LIMIT 3]).keySet();
        System.debug('Set -> Map de IdsCuentas ' + idsCuentas);

        List<Account> listaDeCuentasForMap = [SELECT Id, Name, Type FROM Account WHERE Type != '' ORDER BY Name ASC LIMIT 3];
        Map<Id, Account> mapaConCuentas = new Map<Id, Account>(listaDeCuentasForMap);
        System.debug('Lista de Cuentas mapeada en un Map ' + mapaConCuentas);

        Account objetoCuenta = [SELECT Id FROM Account LIMIT 1];
        //Cuando se usan variables en consultas SOQL se deben usar y anteponer luego del operador logico los ':' dos puntos y seguido tipiar la variable que se quiere consultar
        Account objetoCuentaExtra = [SELECT Id FROM Account WHERE Id != :objetoCuenta.id LIMIT 1];
        List<Account> listElementosCuentas = new List<Account>{objetoCuenta, objetoCuentaExtra};
        System.debug('Lista objetoCuenta >> ' + listElementosCuentas.get(0) + ' y lista de objetoCuentaExte >> ' + listElementosCuentas.get(1));

    }

    public static void testEjemplosSet(){
        // Declaración de SET nulo
        Set<String> setStringNull;
        System.debug('Declaración de un set nulo : ' + setStringNull);

        Set<String> setString = new Set<String>{'Brasil', 'Canada', 'Mexico'};
        setString.add('Chile');
        System.debug('Valores de mi SET : ' + setString);

        // Funcion clonar SET
        Set<String> setClonado = setString.clone(); 
        System.debug('Declaración de un set nulo : ' + setClonado);

        
        
    }
}