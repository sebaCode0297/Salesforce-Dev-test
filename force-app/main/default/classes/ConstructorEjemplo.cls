/**
 * Created by andre on 26-03-2022.
 */

public with sharing class ConstructorEjemplo {
    public static Double myNumber; // declaracion de la variable.
    
    public ConstructorEjemplo(){
        myNumber = 10; //Inicializa la varibale cuando la clase es llamada.
    }
    
    public static Double sumarDiez(){
        myNumber = myNumber + 10;        
        return myNumber;
    }
    
    //Forma de instanciar una clase
    //ConstructorEjemplo objClass = new ConstructorEjemplo();
	//System.debug(objClass);
}