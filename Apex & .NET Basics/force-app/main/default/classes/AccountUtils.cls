public with sharing class AccountUtils {

    public static List<Account> accountsByState(String state) {
        List<Account> myAccount = [SELECT Id, Name FROM Account where BillingState = :state];
        return myAccount;
    }
}
