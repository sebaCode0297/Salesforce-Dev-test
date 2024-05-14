public with sharing class OpportunityTriggerHandler extends TriggerHandler {

    public override void beforeUpdate(){

        marcarRevisionEnOportunidad((Map<ID, Opportunity>)Trigger.oldMap);

        // Map<ID, Opportunity> oldOpMap = (Map<ID, Opportunity>) Trigger.oldMap;

        // for (Opportunity currentOpportunity : (List<Opportunity>) Trigger.new) {
        //     if (oldOpMap.get(currentOpportunity.Id).Type != currentOpportunity.Type 
        //     && oldOpMap.get(currentOpportunity.Id).StageName != currentOpportunity.StageName
        //     && oldOpMap.get(currentOpportunity.Id).Amount != currentOpportunity.Amount) {
        //         currentOpportunity.Necesita_revision__c = true;
                
        //     } else {
        //         System.debug('CurrentOpportunity : ' + currentOpportunity.getErrors());
        //     }
            
        // }
    }

    // Metodo para utilizar el Before Update
    private void marcarRevisionEnOportunidad(Map<ID, Opportunity> mapOldOppRecords){
        for (Opportunity currentOpportunity : (List<Opportunity>) Trigger.new) {
            
            Opportunity oldOppRecord = mapOldOppRecords.get(currentOpportunity.Id);

            if (oldOppRecord.Type != currentOpportunity.Type
                && oldOppRecord.StageName != currentOpportunity.StageName
                // && oldOppRecord.Amount != currentOpportunity.Amount
                ) {
                    currentOpportunity.Necesita_revision__c = true;
                }
        }
    }

    public override void afterUpdate(){
        actualizarMontosParaCuenta((List<Opportunity>) Trigger.new ,(Map<ID, Opportunity>)Trigger.oldMap);
    }
    private void actualizarMontosParaCuenta(List<Opportunity> lstNewOppRecord, Map<ID, Opportunity> mapOldOppRecords){
        Set<Id> setAccId = new Set<Id>();
        for (Opportunity currentOpportunity : lstNewOppRecord) {
            Opportunity oldOppRecord = mapOldOppRecords.get(currentOpportunity.Id);

            if (currentOpportunity.AccountId != NULL && oldOppRecord.Amount != currentOpportunity.Amount) {
                setAccId.add(currentOpportunity.AccountId);
            } else {
                
            }
        }
        Map<Id, Decimal> mapAccWithSumAmount = new Map<Id, Decimal>();
        for (Opportunity opportunityToSum : [SELECT Amount, AccountId FROM Opportunity 
                                                WHERE AccountId IN : setAccId AND Amount != NULL]) {
            if (mapAccWithSumAmount.containsKey(opportunityToSum.AccountId)) {
                Decimal finalAmount = mapAccWithSumAmount.get(opportunityToSum.AccountId) + opportunityToSum.Amount;
                mapAccWithSumAmount.put(opportunityToSum.AccountId, finalAmount);
            } else {
                mapAccWithSumAmount.put(opportunityToSum.AccountId, opportunityToSum.Amount);
            }
            List<Account> lstAccToUpdate = new List<Account>();
            for (Id objAccount : mapAccWithSumAmount.keySet()) {
                lstAccToUpdate.add(new Account(id = objAccount,
                Monto_de_oportunidades__c = mapAccWithSumAmount.get(objAccount)));
            }
            update lstAccToUpdate;
        }

    }

}