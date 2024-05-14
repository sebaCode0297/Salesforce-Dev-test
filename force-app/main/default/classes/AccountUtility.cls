public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList;
        accountsList = [SELECT Name, AnnualRevenue FROM Account];
        System.debug('Valores de lista de Cuentas : ' + accountsList);
        for(Account listOfAccount : accountsList){
            String acctRev = 'Account Name : ' + listOfAccount.Name + ', Annual Revenue : ' + listOfAccount.AnnualRevenue;
            System.debug(acctRev);
        }
        
    }

}