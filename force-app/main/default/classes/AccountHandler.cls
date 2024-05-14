public with sharing class AccountHandler {

    Integer N = 1;

    public static void InsertAccount(Integer N){

       List<Account> addAccounts = new List<Account>();

       while (N <= 4) {
           Account nuevasCuentas = new Account();

           nuevasCuentas.Name = 'Acme Inc' + N;
           nuevasCuentas.AccountNumber = 'A000n' + N;
           addAccounts.add(nuevasCuentas);
        
           N = N + 1;           
       }

       insert addAccounts;

    }
}