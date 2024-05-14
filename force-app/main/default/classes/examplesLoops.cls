public with sharing class examplesLoops {
    public static void traditionalLoops(){
        Integer large = 20;
        // Se inicializa / se implementa una condicion hasta que se cumpla / se itera en +1 
        // for (Integer i = 0; i < large; i++) {
        //     System.debug('Valor de la iteracion del for : ' + I);
        // }

        Integer x = 0;
        while (x < 11) {
            System.debug('While : ' + x);
            System.debug('Cumplio la condicion y salio del WHILE');
            x++;
        }

        Integer y = 0;
        do {
            System.debug('Entro en el DO del WHILE : ' + y);
        } while (y < 10);

        List<Account> listaDeCuentas = [SELECT Name FROM Account LIMIT 11];
        for (Integer i = 0; i < 10; i++) {
            System.debug('Nombre de la cuenta es : ' + listaDeCuentas);
        }
    }

    public static void advancedLoop(){
        List<String> listOfColor = new List<String>{'Azul', 'Rojo', 'Blanco', 'Negro', 'Plateado', 'Verde', 'Dorado'};
        // for(tipoDeVariable nombreDeCadaElemento : listaQueSeIterara){}
        // for(String/Integer... nombreQueSeLeAsignaraDesdeLaLista : NombreDeLaVariableDeLista/EJ:listOfAccount){}
        for (String color : listOfColor) {
            System.debug('los colores de la lista son : ' + color);
        }
        List<Account> listAccount = [SELECT Name FROM Account LIMIT 10];
        for (Account CTA : listAccount) {
            System.debug('La consulta trae estas cuentas : ' + CTA);
            System.debug('Cuenta : ' + listAccount.get(1).Name);
        }
    }

    public static void LoopSOQL(){
        for (Account cta : [SELECT Name FROM Account LIMIT 2]) {
            System.debug('Nombre de las cuentas desde LoopSOQL : ' + cta.Name);
        }
    }
}