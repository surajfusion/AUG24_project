public class D3_SOQLInApex {

    public static void learnSOQL(){
        //List<String> listNmae = new List<String>();
        List<Contact> contactList = new List<Contact>();
        contactList = [
            SELECT firstName, Lastname, Email, Phone, Account.Name 
            FROM Contact
            WHERE AccountId != NULL
            LIMIT 10
        ];
		/*        
        for(Contact contactObj :contactList){
            system.debug('contactObj: ' + contactObj);
            system.debug('contactObj FirtName: ' + contactObj.get('FirstName'));
            system.debug('Direct: contactObj FirtName: ' + contactObj.FirstName);
            system.debug('Direct: Account FirtName: ' + contactObj.Account.Name);
        }*/
        
        List<Account> accountList = [
            SELECT Id, Name,
            (SELECT Id, FirstName FROM Contacts)
            FROM Account
        ]; 
        
        for(Account accountObj :accountList){
            //system.debug('Account : ' + accountObj);
            system.debug('Name : ' + accountObj.Name);
            system.debug('Name : ' + accountObj.Contacts.size());
            //system.debug('Contacts : ' + accountObj.Contacts);
            for(Contact contactObj :accountObj.Contacts){
                //system.debug('ContactObj : ' + contactObj);
                system.debug('Contact Name : ' + contactObj.FirstName);
            }
        }
    }
}