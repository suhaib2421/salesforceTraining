// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

EmailManager.sendMail('suhaibshaikh87@gmail.com', 'Trailhead Tutorial', '123 body');

Account acct = new Account(
    Name='Test Account 2',
    Phone='(415)555-8989',
    NumberOfEmployees=50,
    BillingCity='San Francisco');
insert acct;