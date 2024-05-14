public with sharing class StringArrayTest {

    public static List<String> generateStringArray(Integer n){
        // List<String> listaPrueba = new List<String> {'Prueba 1', 'Prueba 2', 'Prueba 3', 'Prueba 4', 'Prueba 5', 'Prueba 6'};
        List<String> TestList = new List<String>();
        for (Integer i = 0; i < n; i++) {
            TestList.add('Test ' + i);
            System.debug(TestList[i]);
        }
        return TestList;
    }

    public StringArrayTest() {
        Account acct = new Account();

        acct.Name = 'Test Account';
        acct.Description = 'Test Email';
        acct.NumberOfEmployees = 100;
    }

    public void sObjectGeneric(){
        sObject objGenericContact = new Contact();
        // COnversion de un sObject Generico a un tipo de sObject Especifico
        Contact cont = (Contact)objGenericContact;
        
        sObject objGenericoAccount = new Account();
        // COnversion de un sObject Generico a un tipo de sObject Especifico
        Account Acct = (Account)objGenericoAccount;
    }

    
}