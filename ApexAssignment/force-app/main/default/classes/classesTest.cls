@isTest
public with sharing class classesTest {
    @isTest public static void createAllContactsTest() {
        // Test set up data
        // Insert 200 recrods of Contacts
        List<Account> acct = new List<Account>();

        for(Integer i=0; i<200; i++) {
           Account a = new Account(Name='Test Account' + i);
           acct.add(a);
        }
        insert acct;

        List<Contact> contacts = new List<Contact>();
        for(Integer i=0; i<acct.size(); i++) {
            Account a = acct[i];

            for(Integer j=0; j<200; j++) {
                contacts.add(new Contact(Name=a.Name + 'Contact' + i, FirstName='fName' + i, LastName='lName' + i));
            }
        }

        Test.startTest();
        insert contacts;
        Test.stopTest();

        List<Account> accts = [SELECT Name, (SELECT FirstName, LastName FROM Contacts) FROM Account];
        
        
    }

}
