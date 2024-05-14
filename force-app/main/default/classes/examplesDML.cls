public with sharing class examplesDML {

    // Metodo public usando funciones DML para insertar un nuevo ID en el objecto cuenta
    public static Id insertObjectExample(String nameAccount){
        Account objAccount = new Account();
        objAccount.Name = nameAccount;
        insert objAccount;
        //Id idAccount = objAccount.Id;
        return objAccount.Id;
    }

    public static Id insertCustomObjExample(String nomb){
        Empleado__c objEmpleado = new Empleado__c();
        objEmpleado.Name = nomb;
        insert objEmpleado;
        return objEmpleado.Id;
    }

    /*metodo y operacion DML para actualizar registros en un obj*/ 
    public static Account updateObjExample(String idAccount, String newName){
        Account objAccount_1 = new Account();
        objAccount_1.Id = idAccount;
        objAccount_1.Name = newName;
        update objAccount_1;
        return objAccount_1;
    }

    /*metodo y operacion DML para eliminar(DELETE) registros en un obj*/ 
    public static void deleteObjExampli(String idAccount){
        Account objAccount = [SELECT Id FROM Account WHERE Id =: idAccount];
        /*
            Esta es otra forma de eliminar un registro de un objeto en sf - 
            DELETE [SELECT Id FROM Account WHERE Id =: idAccount]; 
        */
        Delete objAccount;
    }

    public static void upsetObjExample(String idAccount, String newName){
        Account objACcountUpset = new Account();
        if (idAccount != '') {
            objACcountUpset.Id = idAccount;
        } else {
            System.debug('Esto no funciona');
        }
        objACcountUpset.Name = newName;
        upsert objACcountUpset;
    }

    /*Metodo para consultar y recuperar los registros que se le pasa por medio de la query/consulta, si existe el registro, se almacena y se ejecuta 
    la funcion de UNDELETE*/
    public static void undeleteObjExample(String NameAccountRestore){
        NameAccountRestore = '%'+NameAccountRestore+'%';
        Account[] cuentasForRestore = [SELECT Id, Name FROM Account WHERE Name like :NameAccountRestore ALL ROWS ];
        undelete cuentasForRestore;
    }

    public static void testMethodDML(){

        User UserDT = new User();

        List<User> UserList = new List<User>();
        UserList = [SELECT Id, Name, LastLoginDate, isActive FROM User WHERE LastLoginDate < LAST_90_DAYS AND isActive = true];
        System.debug('Usuarios que iniciaron sesion ' + UserList);

        Id IdCuenta = examplesDML.insertObjectExample('Cuenta creada por insertObjExample');
        System.debug('INSERT : Id de la cuenta insertada ' + IdCuenta);

        //Forma practica para instanciar un obj y la creacion de un registro nuevo dentro del Obj instanciado
        Opportunity objOpp = new Opportunity(
            Name = 'Eulises Opp',
            Description = 'Oportunidad Test',
            AccountId = idCuenta, // Campo de busqueda desde la Opp a la Cuenta,
            StageName = 'Prospecting',
            CloseDate = System.today() + 1
        );

        //Con esta funcion estamos insertando o creando un nuevo registro en el Obj Opp
        insert objOpp;

        Opportunity objOppIsertada = [SELECT Id, Name, Accountid FROM Opportunity WHERE Id =: objOpp.Id];
        System.debug('INSERT : Id de la Opp insertada con la Cuenta Relacionada :' + objOppIsertada + ' ' + IdCuenta);
        System.debug('INSERT : Id de la Cuenta insertada relacionada en la Opp :' + objOppIsertada.AccountId);

        //UPDATE
        String nombreAnterior = [SELECT Id, Name FROM Account WHERE Id =: IdCuenta].Name;
        System.debug('UPDATE : nOMBRE DE LA CUENTA : ' + nombreAnterior);

        Account cuentaActualizada = examplesDML.updateObjExample(IdCuenta, 'Nombre Actualizado');
        String nombreNuevo = [SELECT Id, Name FROM Account WHERE Id =: IdCuenta].Name;
        System.debug('UPDATE : nOMBRE DE LA CUENTA : ' + nombreNuevo);

        //UNDELETE
        List<Account> lstAccountForInsert = new List<Account>();
        Account ctaGenerica = new Account();

        ctaGenerica.Name = 'Cuenta booker 1';
        lstAccountForInsert.add(ctaGenerica);
        lstAccountForInsert.add(new Account(Name = 'Cuenta Booker 2'));

        insert lstAccountForInsert;

        //Metodo UNDELETE - ES PARA RECUPERAR REGISTROS ELIMINADOS 


    }
        //INSERT
       /* Id idAccount = examplesDML.insertObjectExample('Cuenta creada por insertObjectExample');
        System.debug('insert - Id de la cuenta insertada por el metodo insertObjectExample es : ' + idAccount);
        
        Opportunity objOpp = new Opportunity(
            Name = 'Benjamin Albornoz Camilo',
            Description = 'Opp test',
            AccountId = idAccount,
            StageName = 'Prospecting',
            CloseDate = System.today()+1
        );
        insert objOpp;

        Opportunity objOppInsertada= [SELECT Id, Name, AccountId FROM Opportunity WHERE Id =: objOpp.Id];
        System.debug('insert - Opp insertada con la cuenta relacionada : ' + objOppInsertada);
        System.debug('insert - Id de la cuenta relacionada a la Opp : ' + objOppInsertada.AccountId);
        */
/**
        // UPDATE
        String nombreAnterior = [SELECT Id, Name FROM Account WHERE Id =: idAccount].Name;
        System.debug('update - Nombre de la cuenta relacionada : ' + nombreAnterior);
        Account cuentaActualizada = examplesDML.updateObjExample(idAccount, 'Nombre actulizado');
        String nombreNuevo = [SELECT Id, Name FROM Account WHERE Id =:idAccount].Name;
        System.debug('update - Nombre de la cuenta relacionada : ' + nombreNuevo);

        //DELETE
        Id idCuentaParaBorrar = examplesDML.insertObjectExample('Cuenta creada para ser borrada');
        System.debug('UPDATE - ID de la cuenta a borrar es ' + nombreAnterior);
        System.debug('UPDATE - Ultima cuenta insertada en la BD ' + [SELECT Id, Name, createdDate FROM Account ORDER BY CreatedDate DESC LIMIT 1]);
        examplesDML.deleteObjExampli(idAccount);
        System.debug('UPDATE - Nombre de la cuenta ' + nombreAnterior);
 */
        //UPSERT - si el dato que se le pasa realiza una actualización / pero si el dato viene vacio o nulo lo que hace es una inserción

        /*Id idAccount = examplesDML.insertObjectExample('Cuenta creada por insertObjectExample');
        System.debug('UPsert - Ultima cuenta insertada en la BD ' + [SELECT Id, Name, createdDate FROM Account ORDER BY CreatedDate DESC LIMIT 1]);
        examplesDML.upsetObjExample('', 'Cuenta nueva');
        System.debug('UPSERT - Ultimas 2 cuentas insertadas en la BD ' + [SELECT Id, Name, createdDate FROM Account ORDER BY CreatedDate DESC LIMIT 2]);
        String nombreAnterior = [SELECT Id, Name FROM Account WHERE Id =: idAccount].Name;
        System.debug('UPDATE -  nombre de la cuenta ' + nombreAnterior);
        examplesDML.upsetObjExample(idAccount, 'Cuenta actualizada por upsert');
        String nombreNuevo = [SELECT Id, Name FROM Account WHERE Id =:idAccount].Name;
        System.debug('UPDATE - nombre de la cuenta despues del metodo updateObjExample ' + nombreNuevo);
        */

        // UNDELETE
        // List<Account> lstAccountInsert = new List<Account>();
        // Account cuentaGenerica = new Account();
        // cuentaGenerica.Name = 'Cuenta booker 1';
        // lstAccountInsert.add(cuentaGenerica);
        // lstAccountInsert.add(new Account(Name = 'Cuenta booker 2'));  /* Esta es otra forma de instanciar al obj cuenta y la creacion o insercion de una cuenta nueva.
        //                                                                 - lstAccountInsert.add(new Account(Name = 'Cuenta booker 2'));*/

        // insert lstAccountInsert;
        // List<Account> lstAccountInsertadas = [SELECT Id, Name FROM Account WHERE name Like '%Cuenta booker%'];
        // System.debug(lstAccountInsertadas);
        
    }