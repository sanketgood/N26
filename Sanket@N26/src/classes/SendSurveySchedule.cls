/*****************************************
Class name : SendSurveySchedule 
Description : This class is used to schedule survey class
              to send survey emails 'SendSurveyEmails' .
Created by : Sanket


*****************************************/


global class SendSurveySchedule implements Schedulable {
   
   global void execute(SchedulableContext sc) {
      
      SendSurveyEmails sse = new SendSurveyEmails();
      Database.executeBatch(sse);
   }
}