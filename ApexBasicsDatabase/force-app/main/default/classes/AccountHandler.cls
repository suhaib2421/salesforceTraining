public with sharing class AccountHandler {
    public static insertNewAccount(String s) {

        Account acct = new Account(Name=s);
        insert acct;
        return acct;
    }
}
