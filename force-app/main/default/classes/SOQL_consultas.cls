public with sharing class SOQL_consultas {
    public static void consultasDeContactos(){
        List<Contact> listofContacts;
        listofContacts = [SELECT FirstName, LastName FROM Contact LIMIT 2];
        System.debug('Valor de la Lista de Contactos : ' + listofContacts);
    }
}