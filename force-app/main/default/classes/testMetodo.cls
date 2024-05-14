public with sharing class testMetodo {
    public void String(String nombre){
        
        Integer num = 0;

        for (Integer i = 0; i < 10; i++){
            num = (Integer)( Math.random() * 10);
            System.debug(num);
        }

    }
    //Constructor
    public testMetodo() {}
}