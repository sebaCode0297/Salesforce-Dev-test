public class objectsExamples {
    public static Decimal opMatematicas(Decimal elementoA, Decimal elementoB){
        Decimal resultadoDeOp = elementoA * elementoB;
        return resultadoDeOp;
    }

    public static Account createAccount(String nameAccount){
        Account objAccount = new Account();
        objAccount.Name = nameAccount;
        objAccount.AccountSource = 'Cuenta creada desde codigo';
        return objAccount;
    }

    public static void callMethods(){
        Account accountFromMethod = objectsExamples.createAccount('Cuenta por codigo - callMthods');
        Account accountFromCall = objectsExamples.createAccount('Cuenta extra creada');
        System.debug('Cuenta From Methods : ' + accountFromMethod);
        System.debug('accountFromCall : ' + accountFromCall);

        Decimal resultadoDeOp = objectsExamples.opMatematicas(2, 10);
        System.debug('El resultado es : ' + resultadoDeOp);
    }

}