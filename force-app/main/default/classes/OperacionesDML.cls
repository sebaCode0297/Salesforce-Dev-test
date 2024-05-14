public with sharing class OperacionesDML {
    // public static String operacionesDML{}(

    // Account obeCuenta = new Account();
    // obeCuenta.Name = 'Sebastian';
    // obeCuenta.AccountNumber = '123456789';
    // obeCuenta.AccountSource = 'No Identificado';
    // obeCuenta.AnnualRevenue = 2100;
    // obeCuenta.NumberOfEmployees = 12;

    // System.debug('Datos Objeto Cuenta: ' + obeCuenta);

    
    // System.debug('Datos Opp : ' + ObjOpp);
    
    // Empleado__c ObjEmpleado = new Empleado__c(
    //     Name = 'Sebastian Opp',
    //     Email__c = 'seba@gmail.com',
    //     Departamento__c = 'Informatica',
    //     Salario__c = 2500
    //     );
        
    //     System.debug('Campos Objeto Empelado : ' + ObjEmpleado);
        
    //     Opportunity ObjOpp = new Opportunity(
    //         Name = 'Sebastian Opp',
    //         Description = 'Opp Test',
    //         LeadSource = 'No Indexado',
    //         isPrivate = true
    //     );
    //     List<Opportunity> LsOpp = new List<Opportunity>{ObjOpp};
    //     Map<String, List<sObject>> mapaDeOpp = new Map<String, List<sObject>>();
    //     mapaDeOpp.put('Oportunidad', LsOpp);
    //     System.debug('mapa de opp : ' + mapaDeOpp);

    // )

    //Metodo declaradp como decimal debe retornar un resultado Decimal
    public static Decimal operacioMatematica(Decimal elementoA, Decimal elementoB){
        Decimal resultadoDeOperaciones = elementoA * elementoB;
        return resultadoDeOperaciones;
    }

    /* Este metodo recibe como parametro un string de cuenta, instancia el obj cuenta, setea el valor que recibe por paremetro
    y lo asigna al objeto instanciado, y luego le pasamos el return con el nombre de varibale que instancia el obj cuenta*/
    public static Account crearCuenta(String nombCuenta){
        Account ObjCuenta = new Account();
        ObjCuenta.Name = nombCuenta;
        ObjCuenta.AccountSource = 'Cuenta generada pro codigo';

        return ObjCuenta;

    }

    public static void callMethods(){
        Account cuentaFromMethods = OperacionesDML.crearCuenta('Cuenta por CallMetrhods'); //Llama y usa la funcion de otro metodo existente
        Account cuentaFromCall = OperacionesDML.crearCuenta('Una cuenta extra');
        System.debug('Cuenta creada por callMethods:' + cuentaFromMethods);
        System.debug('Cuenta creada extra' + cuentaFromCall);

        Decimal resultadoDeOperaciones = OperacionesDML.operacioMatematica(2, 10);
        System.debug('Resultado operación: ' + resultadoDeOperaciones);
    }
}