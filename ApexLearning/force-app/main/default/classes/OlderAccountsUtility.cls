public with sharing class OlderAccountsUtility {
    public staic OlderAccountsUtility() {
        // Get the 5 oldest accounts
        Account[] oldAccounts = [select Id, Description from account order by CreatedDate asc limit 5];
        // loop through them and update the description field
        for (Account acct : oldAccounts) {
            acct.Description = 'Heritage Account';
        }
        // save the change you made
       update oldAccounts;
    }
}


// In developer console:
// select debug and Open Execute Anonymous Window
// type OlderAccountsUtility.updateOlderAccounts();
// above code will update the accounts