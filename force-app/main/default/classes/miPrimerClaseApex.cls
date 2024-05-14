public with sharing class miPrimerClaseApex {
    public void metodoPrueba(){
        miPrimerClaseApex.AccountUp();
    }

    public static String AccountUp(){
        list<Account> listaDeCuentas = new list<Account>();
        listaDeCuentas = [SELECT Id, Name, Description FROM Account WHERE Name LIKE '%test%'];
        list<Account> listaDeCuentasParaActualizar = new list<Account>();
        for(Account objetoCuenta: listaDeCuentas){
            objetoCuenta.Description = 'Cuenta Actualizada';
            listaDeCuentasParaActualizar.add(objetoCuenta);
        }
        try {
            if (listaDeCuentasParaActualizar != null && listaDeCuentasParaActualizar.size() > 0) {
                UPDATE listaDeCuentasParaActualizar;
            }
        } catch (Exception e) {
            String error = e.getMessage();
            System.debug(error);
        }
        return 'Cuenta Actualizada';
    }
}