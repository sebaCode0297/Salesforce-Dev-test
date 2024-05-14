public with sharing class PropertyUtility {

    public static void newListedProperties(){
        List<Property__c> newPropList;
        newPropList = [SELECT Name, Broker__r.Email__c, Days_On_Market__c FROM Property__c WHERE Days_On_Market__c <= 30];
        for (Property__c listProperty : newPropList) {
            String propEmail = listProperty.Name + ':' + listProperty.Broker__r.Email__c;
            System.debug(propEmail);
        }

    }
}