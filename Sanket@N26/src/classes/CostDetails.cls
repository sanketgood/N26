/*
Class name : CostDetails 
Description : This class is used to fetch the respective fess form CostDetail object.The record type of Cost_Detail defines the different
              fees types.
Developed By: Sanket


*/

public class CostDetails {
    
    @auraEnabled
    public Static List<Cost_Details__c> fetchCostDetails(String caseID) {
       
       List<Cost_Details__c> costDetailLst = new List<Cost_Details__c>();
       // fetch product and home country name from case's contact
       Case c= [SELECT id,contact.Product__r.Name,contact.Home_Country__c FROM Case where Id = :caseId ];
       
       // fetch the cost (fee) details from Cost_Detail Object
        if(c.contact.Product__r.Name != null && c.contact.Home_Country__c != null) {
             costDetailLst = [SELECT Id,RecordtypeId,Recordtype.Name,Product__r.Name,Cost__c,Home_Country__c,CurrencyIsoCode from Cost_Details__c WHERE Product__r.Name = :c.contact.Product__r.Name AND Home_Country__c = :c.contact.Home_Country__c ];    
        }
        return costDetailLst;  
    }
}