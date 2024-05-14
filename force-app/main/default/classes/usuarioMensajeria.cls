@RestResource(urlMapping='/creacionUsuarioMensajeria/*')
global with sharing class usuarioMensajeria {

    @HttpPost
    global static void userMensajeria(){
        crearUsuarioMensajeria();
    }

    // Metodo para dar formato al rut -> ((rut) - digito verificador)
    global static void formatearRut(){

        Account datos = new Account();

        datos.AccountNumber = datos.AccountNumber;
    }

    global static void crearUsuarioMensajeria(){

        RestRequest req = RestContext.request; // Peticion
        RestResponse res = RestContext.response; // Respuesta

        Blob body = req.requestBody; // Investigar que uso tienen.
        String bodyString = body.toString();
       
        constructor_usuario_mensajeria  userMenj = (constructor_usuario_mensajeria) JSON.deserialize(bodyString, constructor_usuario_mensajeria.class);
        Account datos = new Account();

        Case caso = new Case(); // nombre campo -> AccountId
        
        //Case num_caso = [SELECT CaseNumber FROM Case WHERE  rut_cliente__c =: datos.rut_cliente__c];
        datos.Name = userMenj.nombre_cuenta;
        datos.Nombre_Cliente__c = userMenj.Nombre_Cliente;
        datos.rut_cliente__c = userMenj.rut_cliente;
        datos.Contacto_Cliente__c = userMenj.Contacto_Cliente;
        datos.id_tipo_de_atencion__c = userMenj.id_tipo_de_atencion;

        if (datos.id_tipo_de_atencion__c == 5 ) { // Datos completos
            if (existeUsuario( datos.rut_cliente__c) == false) {
                try {
                    insert datos;
                    Case num_caso = [SELECT CaseNumber FROM Case WHERE  AccountId =: datos.rut_cliente__c];
                    caso.AccountId = datos.Id;
                    //caso.CaseNumber = datos.id;
                    insert caso;
                    System.debug('Insert Succesfull');
                    response(caso.CaseNumber, caso.Id, 1, 'Caso creado');
    
                } catch (DmlException e) {
                    String msj = 'Error';
                    System.debug(msj);
                    response('S/N', 'S/C', 0, 'El caso no se creo');
                }
            } else if(existeUsuario( datos.rut_cliente__c) == true){ // Asignar caso al usuario existente
                Account cliente = [SELECT id FROM Account WHERE rut_cliente__c =: datos.rut_cliente__c];
                caso.AccountId = datos.Id;


                //caso.CaseNumber = cliente.CaseNumber;


                insert caso;
                response(caso.CaseNumber, caso.id, 1, 'Caso asociado al cliente existente');
            }
        } else if(datos.id_tipo_de_atencion__c != 5){ // Registro null - si registro en Salesforce.
            System.debug('Los campos estan vacios');
            response('S/N', 'S/C', 0, 'Tipo de Atencion no valida');
        } 
    //    return 'Creacion de usuario con exito';
    }

    // Validacion si existe el usuario o se debera crear un usuario nuevo 5005e000006shFyAAI
    public static Boolean existeUsuario(String rut){
        Boolean existe = false;
        Integer cantidad = [SELECT COUNT() FROM Account WHERE rut_cliente__c =: rut];

        if (cantidad > 0) {
            existe = true;
        } else {
            existe = false;
        }
        return existe;
    }

     //Constructor
    public class mensaje{
        public String numero_caso{get;set;}
        public String id_caso{get;set;}
        public Integer cod_respuesta{get;set;}
        //public String cod_error{get;set;}
        public String glosa{get;set;}
    }

    public static void response(String num_caso, String ID_caso, Integer c_respuesta, String descripcion_mensaje){
        mensaje respuestaJSON = new mensaje();

       respuestaJSON.numero_caso = num_caso;
       respuestaJSON.id_caso = ID_caso;
       respuestaJSON.cod_respuesta = c_respuesta;
       //respuestaJSON.cod_error = c_error;
       respuestaJSON.glosa = descripcion_mensaje;

       RestResponse res = RestContext.response;
       if (res == null) {
           res = new RestResponse();
           RestContext.response = res;
       }
       res.responseBody = Blob.valueOf(JSON.serialize(respuestaJSON));
       res.addHeader('Content-Type', 'application/json;charset=UTF-8');
    }
}