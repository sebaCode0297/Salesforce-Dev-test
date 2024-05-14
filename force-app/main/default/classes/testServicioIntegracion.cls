@RestResource(urlMapping='/testServicioIntegracion/*')
global with sharing class testServicioIntegracion {

    @HttpPost
    global static String servicioIntegracion() { 
        return 'Conexion Exitosa';
    }

    public testServicioIntegracion() {

    }
}