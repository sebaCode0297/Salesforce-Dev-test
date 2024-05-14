public with sharing class examplesDecisiones {
    public static void condiciones(String palabra, Decimal numeroCualquiera, Boolean bandera, Account objCuenta, List<Account> lstDeCuentas, Map<String, Account> mapDeCuentas){


        String nombreCuenta = 'Valido';
        if (palabra == 'Valido') {
            System.debug('IF - La condicion es verdadera, la palabra es : ' + palabra);
        }

        Decimal numeroRandom = 12;
        if (numeroRandom >= 10) {
            System.debug('IF - La condicion es verdadera, el numeroCualquiera es : ' + numeroCualquiera);
        } else {
            System.debug('ELSE - La condicion no se cumplio, valor esperado: ' + numeroCualquiera);
        }

        Boolean flagSend = bandera;
        flagSend = false;
        if (bandera == true) {
            System.debug('IF - El valor de la Bandera es : ' + bandera);
        }

        Account ctaNueva = new Account();
        ctaNueva.Name = 'Teresa';

        if (objCuenta != NULL) {
            System.debug('IF - El valor del obj Cuenta es : ' + objCuenta);
            if ((objCuenta.Name).equals('Teresa')) {
                System.debug('Segundo IF - La condicion es verdadera, el objCuenta.Name es : ' + objCuenta.Name);
            }
        }

        List<Account> lstConCuenta = new List<Account>{ctaNueva};
        if (!lstDeCuentas.isEmpty()) {
            System.debug('IF - La condicion es verdadera, la lista de Cuentas no es vacia: ' + lstDeCuentas);
        }

        Map<String, Account> mapaConCuenta = new Map<String, Account>();
        mapaConCuenta.put('Principal', ctaNueva);
        if (mapDeCuentas.containsKey('Principal')) {
            System.debug('IF - La condicion es verdadera, el mapa de cuentas contiene la llave Principal : ' + mapDeCuentas);
        }
    }

    public static void elseIfCondition(Decimal numCualquiera){
        System.debug('ELSE-IF - el numero que ingresa al metodo es: ' + numCualquiera);
        if (numCualquiera == 10) {
            System.debug('la validación es correcta');   
        }else {
            System.debug('La validacion no es correcta: ' + numCualquiera);
        }
    }

    public static String diaDeLaSemana(Decimal numeroDelDia){
        if (numeroDelDia == 1) {
            return 'Lunes';
        } else if (numeroDelDia == 2) {
            return 'Martes';
        }  else if (numeroDelDia == 3) {
            return 'Miercoles';
        }  else if (numeroDelDia == 4) {
            return 'Jueves';
        }  else if (numeroDelDia == 5) {
            return 'viernes';
        }  else if (numeroDelDia == 6) {
            return 'Sabado';
        }  else if (numeroDelDia == 7) {
            return 'Domingo';
        }  else {
            return 'El numero no coincide';
        } 
    }

    public static void operacionMatematica(Decimal numeroA, Decimal numeroB, String operacionMatematicas){
        Decimal result = 0;

        switch on operacionMatematicas{
            when 'Suma'{
                result = numeroA + numeroB;
                System.debug('La suma de A más B : ' + result);
            }
            when 'Resta'{
                result = numeroA - numeroB;
                System.debug('La resta de A más B : ' + result);
            }
            when 'Multiplicacion'{
                result = numeroA * numeroB;
                System.debug('La multiplicacion de A más B : ' + result);
            }
            when 'Division'{
                result = numeroA / numeroB;
                System.debug('La division de A más B : ' + result);
            }

            when else {
                System.debug('Operacion matematicas no encontrada');
            }
        }

        // Ejecucion del metodo de SWITCH 
            // examplesDecisiones.operacionMatematica(10, 40, 'Suma');
            // examplesDecisiones.operacionMatematica(10, 40, 'Resta');
            // examplesDecisiones.operacionMatematica(10, 40, 'Multiplicacion');
            // examplesDecisiones.operacionMatematica(10, 40, 'Division');
    }
}