@RestResource(urlMapping='/envioDatos/*')
global with sharing class testIntegracion {

  @HttpPost
  global static void envioDatos() {
    respuestaPostman();
  }

  global class datosCliente {
    public boolean estCreacion;
    public String nombre;
    public String apellido;
    public String direccion;
    public String pais;
  }
  global static void respuestaPostman() {
    datosCliente newCliente = new datosCliente();
    newCliente.estCreacion = true;
    newCliente.nombre = 'Claudio';
    newCliente.apellido = 'Cortes';
    newCliente.direccion = 'Santiago';
    newCliente.pais = 'Chile';


  RestResponse res = RestContext.response;
    if (res == null) {
      res = new RestResponse();
      RestContext.response = res;
    }
    res.responseBody = Blob.valueOf(JSON.serialize(newCliente));
    res.addHeader('Content-Type', 'application/json;charset=UTF-8');
  }

  // Constructor inicializado
  global testIntegracion() {
  }
}