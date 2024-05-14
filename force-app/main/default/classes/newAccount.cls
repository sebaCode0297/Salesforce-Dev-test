public with sharing class newAccount {
    public static void sObjectInsert(){
        // Creacion de un nuevo objeto a partid de el Objeto Cuenta
        Account tiendaGamer = new Account();

        tiendaGamer.Name = 'PC Vale';
        tiendaGamer.AccountNumber = '1234567';
        tiendaGamer.Phone = '12345';

        insert tiendaGamer;

    }
}