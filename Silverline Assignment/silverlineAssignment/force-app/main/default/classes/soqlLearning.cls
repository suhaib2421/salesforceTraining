public with sharing class soqlLearning {
    
    // Problem 1
    public static List<Account> returnContacts() {
        Account[] acct = [SELECT Name, (SELECT FirstName, LastName FROM Contacts) FROM Account];
        
        return acct;
    }

    // Problem 2
    public static List<Contact> returnSmith() {
        List<Contact> smiths = [SELECT Name FROM Contact where LastName='smith'];

        return smiths;
    }

    // Problem 3
    public static Opportunity[] fiscalQuarter() {

        Opportunity[] opps = [SELECT CloseDate FROM Opportunity]; // Gets all close dates from opportunities
        Opportunity[] resultOps = new Opportunity();
        
        for(Integer i=0; i<opps.size(); i++) {
            resultOps.add(opps[i].Current_Fiscal_Quarter__c);
        }


        return resultOps;
    }


    // Problem 5
    // public static set<Opportunity> twoRelatedOpportunities() {

    //     List<Opportunity> opps = [SELECT name FROM Opportunity];
    //     opps.sort();

    //     List<Opportunity> sameOpps = new List<Opportunity>();

    //     // Checks if names in opps are same and adds to a set if they are
    //     Integer count = 0;
    //     for(Integer i=0; i<opps.size(); i++) {
    //         for(Integer j=1; j<opps.size(); j++) {
    //             if(opps[i] == opps[j]) {
    //                 count += 1;
    //             }
    //             if(count > 2) {
    //                 if(!sameOpps.contains(opps[i])) {
    //                     sameOpps.add(opps[i]);
    //                 }
    //             }
    //         }

    //         count = 0;
    //     }
        
    //    Opportunity acctName = new Opportunity();
    //    set<Opportunity> acct = new set<Opportunity>();
    //    for(Integer i=0; i<sameOpps.size(); i++) {
    //         String acctName = [SELECT accountId FROM Opportunity where name=:sameOpps[i]];
    //         if(!acct.contains(acctName)) {
    //             acct.add(acctName);
    //         }
    //    }

    //    System.debug(acct);

    //    return acct;

    // }


    // Problem 6
    // public static Map<Lead, Integer> leadCount() {

    //     Integer count = 1;

    //     Lead[] leads = [SELECT LeadSource FROM Lead];
    //     leads.sort();
    //     Map<Lead, Integer> m = new Map<Lead, Integer>();

    //     for(Integer i=0; i<leads.size(); i++) {
    //        for(Integer j=1; j<leads.size(); j++) {
    //            if(leads[i] == leads[j]) {
    //                count += 1;
    //            }
    //        }
    //        m.put(leads[i], count);
    //        count = 0;
    //     }
        
    //     return count;
    // }
}
