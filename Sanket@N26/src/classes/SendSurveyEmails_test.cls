/*****************************************
Class name : SendSurveyEmails_test
Description : This is a test class used to send survey links to the contacts
              based on the date specified on contact ,if the date is less than today  .
Created by : Sanket


*****************************************/

@isTest 
public class SendSurveyEmails_test
{
    static testMethod void testbatch() 
    {
        List<Contact> lstCon = new List<Contact>();
            
            // create contacts
            Contact con = new Contact();
            con.firstname ='kumar ';
            con.lastname = 'sanket';
            con.language__c = 'en';
            con.survey_date__c = date.today()-1;
            con.email = 'abc@xyz.com';
            lstCon.add(con);
            
            Contact conObj = new Contact();
            conObj.firstname ='david';
            conObj.lastname = 'boon';
            conObj.language__c = 'de';
            conObj.survey_date__c = date.today()-2;
            con.email = 'abcd@wxyz.com';
            lstCon.add(conObj);
            
            insert lstCon;
        
        Test.startTest();
            // call batch class
            SendSurveyEmails surveyobj = new SendSurveyEmails ();
            DataBase.executeBatch(surveyobj); 
            
        Test.stopTest();
    }
}