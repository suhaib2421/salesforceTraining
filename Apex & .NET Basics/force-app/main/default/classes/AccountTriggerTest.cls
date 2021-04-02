@isTest
public class AccountTriggerTest {
    @isTest static void AccountStateTest() {

        // Insert 200 records with BillingState: CA
        // Check that ShippingState is also CA
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<200; i++) {
            Account acct = new Account(Name = 'Test Account ' + i, BillingState = 'CA');
            accts.add(acct);
        }

        // Perform test
        Test.startTest();
        insert accts;
        Test.stopTest();

        // Verify that Shipping State is CA
        List<Account> verifyState = [SELECT ShippingState FROM Account];
        for(Account a : verifyState) {
            System.assertEquals('CA', a.ShippingState, 'E');
        }

    }
}
