@RestResource(urlMapping='/IntegracionCRM/CrearNegocio/*')
global with sharing class Izipay4i_Ventas_Negocio {
    
    @HttpPost
    global static void CrearNegocio(){
        response();
    }
    
    public class mensaje{
        public boolean estSol{get;set;}
        public String msj{get;set;}
    }
    
    global static void response(){
        mensaje msj = new mensaje();      
        msj.estSol = true;
        msj.msj = 'Se completó/canceló correctamente';
        
        RestResponse res = RestContext.response;
        if (res == null) {
        	res = new RestResponse();
        	RestContext.response = res;
    	}
        res.responseBody = Blob.valueOf(JSON.serialize(msj));        
        res.addHeader('Content-Type', 'application/json;charset=UTF-8');
    }

}