public with sharing class TestClass {
    public static void main(String[] args) {
        System.debug(loggingLevel.NONE, 'Test none');
        System.debug(loggingLevel.ERROR, 'Test error');
        System.debug(loggingLevel.WARN, 'Test warning');
        System.debug(loggingLevel.INFO, 'Test info');
        System.debug(loggingLevel.DEBUG, 'Test debug');
        System.debug(loggingLevel.FINE, 'Test FINE');
        System.debug(loggingLevel.FINER, 'Test FINER');
        System.debug(loggingLevel.FINEST, 'Test FINEST');
        System.debug('Hola Mundo');
    }
}