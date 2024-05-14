public with sharing class varAndDataType {
  public static void testTipoVariable() {
     
    String text = 'variable de texto';
    System.debug(text);

    Boolean juego = false;
    System.debug(juego);

    DateTime dt = DateTime.now();
    System.debug(dt);
    // Time myTime = Time.newInstance(dt.hour(), dt.minute(), dt.second());
    // System.debug('myTime ' + myTime);
    Time myTimeManual = Time.newInstance(1,2,3,4); // se le pasan parametros de forma manual
    System.debug('myTimeManual ' + myTimeManual);

    Date toDate = date.today();
    System.debug('ToDate es: ' + toDate);
    Date myDate = date.newInstance(1993, 09, 02);
    System.debug('MyDate es:' + myDate);

    DateTime fixDateTime = datetime.now();
    System.debug('FizdateTime es: ' + fixDateTime);
    DateTime myDateTime = DateTime.newInstance(1997,1,31,1,8,16);
    System.debug('MyDate es: ' + myDateTime);

    string tStr = 'textBlob';
    Blob myBlob = blob.valueOf(tStr);
    System.debug('El valor en string de la varibale blob es: ' + tStr);
    String dStr = myBlob.toString();
    System.debug('El valor en string de la varibale blob es: ' + myBlob);

    Decimal amountDecimal = 154.12;
    System.debug('Valor de amountDecimal : ' + amountDecimal);
    Double doubleNum = 155.70;
    System.debug('Valor de doubleNum: ' + doubleNum);
    //Integer

    Long longNumber = 1234567892;
    System.debug('Valor de longNumber: ' + longNumber);

    // Creación de varibales vacias y asignacion de valores

    Account Ac = new Account();
    String name = '';


  }
}