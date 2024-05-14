public with sharing class constructorExample {

    public static Double myNumber;

    public constructorExample() {
        myNumber = 10;
    }

    public static Double sumarDiez(){
        myNumber = myNumber + 10;

        return myNumber;
    }
}