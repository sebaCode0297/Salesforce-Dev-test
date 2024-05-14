public with sharing class exampleSet {

    public static void testEjemplosSet(){
        
        Set<String> setOfCountries = new Set<String>{'Chile', 'Brasil', 'Argentina'};
        System.debug('Valor de setOfCountries ' + setOfCountries);

        setOfCountries.add('Canada');
        System.debug('Valor de setOfCountries ' + setOfCountries);
        System.debug('La cantidad de datos de mi lista Set es : ' + setOfCountries.size());
    }




    public exampleSet() {

    }
}