// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


EmailMissionSpecialist em = new EmailMissionSpecialist();
em.sendMail('suhaibshaikh87@gmail.com', 'Flight Path Change', 
   'Mission Control 123: Your flight path has been changed to avoid collision '
   + 'with asteroid 2014 QO441.');

// Add first contact and related details
Contact contact1 = new Contact(
   Firstname='Quentin',
   Lastname='Foam',
   Phone='(415)555-1212',
   Department= 'Specialty Crisis Management',
   Title='Control Engineer - Specialty - Solar Arrays',
   Email='qfoam@trailhead.com');
insert contact1;
// Add second contact and related details
Contact contact2 = new Contact(
   Firstname='Vega',
   Lastname='North',
   Phone='(416)556-1312',
   Department= 'Specialty Crisis Management',
   Title='Control Engineer - Specialty - Propulsion',
   Email='vnorth@trailhead.com');
insert contact2;
// Add third contact and related details
Contact contact3 = new Contact(
   Firstname='Palma',
   Lastname='Sunrise',
   Phone='(554)623-1212',
   Department= 'Specialty Crisis Management',
   Title='Control Engineer - Specialty - Radiators',
   Email='psunrise@trailhead.com');
insert contact3;

Contact[] theseContacts = [SELECT Name, Phone, Email, Description FROM Contact
                           WHERE (Department='Specialty Crisis Management')
                           ORDER BY Name];
// Log a count of how many contacts were found
System.debug(theseContacts.size() + ' contact(s) returned.');
// Log all values in the array of contacts
System.debug(theseContacts);

Contact thisContact = new Contact(
    Firstname = 'Brian',
    Lastname = 'Dent',
    Phone = '(619) 852-4569',
    Department = 'Mission Control',
    Title = 'Mission Specialist - Neptune',
    Email = 'briandent@trailhead.com');
insert thisContact;

List<List<sObject>> searchList = [FIND 'Mission Control' IN ALL FIELDS 
                                  RETURNING Contact(FirstName, LastName,
                                  Phone, Email, Description)];
Contact[] searchContacts = (Contact[])searchList[0];
System.debug('Found the following contacts:');
for (Contact c : searchContacts) {
   System.debug(c.LastName + ', ' + c.FirstName);
}