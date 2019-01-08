*****************************************************README*************************************************************

1. Task - To sned Surveys through Batch 
			Survey_date and Language__c fields created on contact
			CLASS : SendSurveyEmails - Batch class To send the surveys to contacts
			SendSurveyEmails_test - test class
			SendSurveySchedule - Scheduler class to schedule SendSurveyEmails batch class
			
2. Task - To show the cost details based on contacts country and Product		
			Object - Product - Store product Information disdinguished by record type for 3 diffirent Fees types
			 Cost_Detail__c - Contains relationship between product and Home Country and CurrencyISOCode
			 Contacts - FIELDS - Home_Country__c and Product__c(lookup to product)
			 
			Lightning Component - to fetch the fees based on Country and Product
						Component - CostDetails
						Controller - CostDetailsController
						Helper - CostDetailsHelper
								