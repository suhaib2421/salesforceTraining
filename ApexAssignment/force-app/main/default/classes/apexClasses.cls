public with sharing class apexClasses {
    
    // Problem 1:
    // All contacts (no where clause filter) returning their firstname, lastname, and name of the related account
    public static Account[] allContacts() {
        Account[] acct = [SELECT Name, (SELECT FirstName, LastName FROM Contacts) FROM Account]; // Inside query executes first, then the outside one
        
        return acct;
    }

    // Problem 2:
    // All contacts whose lastname equals ‘smith’ 
    public static Contact[] allSmiths() {
        Contact[] smiths = [SELECT Name FROM Contact where LastName = 'smith'];

        return smiths;
    }

    // Problem 3:
    // All opportunities that have a closedate in this fiscal quarter
    public static List<Opportunity> closeDate() {

        // custom sObject that returns close date if it is in current fiscal quarter, null if not
        Opportunity[] ops = [SELECT Close_Fiscal_Quarter__c FROM Opportunity]; 
        List<Opportunity> currentFiscalQuarter = new List<Opportunity>();

        for(Integer i=0; i<ops.size(); i++) {
            if(ops[i] != NULL) {  
                currentFiscalQuarter.add(ops[i]);
            }
        }

        return currentFiscalQuarter;
    }

    // Problem 4:
    // All accounts that have a related contact whose lastname starts with 'smith'
    public static List<Account> relatedSmith() {

        Account[] acct = [SELECT Name, (SELECT LastName FROM Contacts where LastName like '%Rogers') FROM Account];

        return acct;
    }


    // Problem 6:
    // A count of leads by leadsource
    public static Map<String,Integer> leadCount() {

        List<Lead> l = [SELECT LeadSource FROM Lead];

        Map<String,Integer> countOfLeads = new Map<String,Integer>();
        for(Lead key : l) {
            if(!countOfLeads.containsKey(key.LeadSource)) {
                countOfLeads.put(key.LeadSource, 0);
            }

            Integer count = countOfLeads.get(key.LeadSource) + 1;
            countOfLeads.put(key.LeadSource, count);
        }
        
        return countOfLeads;
    }

}