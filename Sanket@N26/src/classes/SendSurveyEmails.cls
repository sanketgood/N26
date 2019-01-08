/*****************************************
Class name : SendSurveyEmails
Description : This class is used to send survey links to the contacts
              based on the date specified on contact ,if the date is less than today  .
Created by : Sanket


*****************************************/
global class SendSurveyEmails implements Database.Batchable<sObject>{
   
   global final String query;
   
   global SendSurveyEmails(){
             query= 'SELECT Id,language__c,survey_date__c,firstname,email from CONTACT WHere survey_date__c <= TODAY'; 
   }

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<contact> scope){
       
       Messaging.SingleEmailMessage[] messagesLst =   new List<Messaging.SingleEmailMessage> ();
       List<Contact> conListToUpdate = new List<Contact>();
       try {
        /* this is to check if organisation has the capacity left to send emails
           If it does not have the capacity, it will throw exception and sending emails will not be performed.
        */
        Messaging.reserveSingleEmailCapacity(scope.size());
        for(Contact s : scope) {
              
             if(s.get('email') != NULL) {
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = new String[] { String.valueOf(s.get('email'))};
                
                message.subject = 'Survey';
                // check if the language is english or anything apart from ge
                if(s.get('language__c') == 'de')
                    message.plainTextBody = 'Hey '+s.get('firstname')+', bitte fülle unsere Umfrage aus: '+'http://n26.com/survey/'+s.get('Id');
                else
                    message.plainTextBody = 'Hey '+s.get('firstname')+', Please fill out our Survey '+'http://n26.com/survey/'+s.get('Id');
                
                messagesLst.add(message);
                // set the survey date to empty
                s.survey_date__c = null;
                conListToUpdate.add(s);
              }  
         }
          // send the mail and update the contacts
          Messaging.SendEmailResult[] results = Messaging.sendEmail(messagesLst);
          update conListToUpdate;
            
       } catch (Exception e) {
            // Here you can do additional things to specify if the LIMIT is exceeded
            System.debug('You have used up your daily allowance of mails');
        }
      
              
          
          
      
   }

   global void finish(Database.BatchableContext BC){
        // we can specify any particular task has to be performed if this is executed
        
   }
   
   
}