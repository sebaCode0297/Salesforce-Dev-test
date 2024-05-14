public with sharing class sObjectTest {
    public static void main(String[] args) {

        Opportunity opor = new Opportunity();

        opor.OrderNumber__c = '12';

    }

    public static String datosCuenta(){
        Account myAcct = new Account();

        myAcct.Name = 'Company LTA';
        myAcct.PersonEmail = 'company@gmail.com';
        myAcct.AccountNumber = '12345';

        String accountName = myAcct.Name;
        

        return 'El nombre de la company es ' + myAcct.Name + ' y su correo es ' + myAcct.PersonEmail + ' y su numero es ' + myAcct.AccountNumber;
    }
}