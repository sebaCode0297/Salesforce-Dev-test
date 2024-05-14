public with sharing class operators {

    public static void testOperadoresComparacion() {
        Decimal numMayor = 10;
        Decimal numZero = 0;
        String errorAsig = '';
        String unaPalabra = 'Hello';
        String palabraComplementaria = 'World';
        Decimal numExample = 5;
        
        // Operador Suma
        System.debug('Suma : la suma de ' + numMayor + ' + ' + numExample + ' = ');
        System.debug(numMayor + numExample);
        System.debug('Suma : la suma de ' + ' la concatenación de texto usando el operador '+' la suma del texto de : ' + unaPalabra + ' + ' + palabraComplementaria);


    }
}