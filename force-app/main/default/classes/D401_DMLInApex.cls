public class D401_DMLInApex {
    //Best Practices #1: 
    //DO NOT USE DML-STATEMENT IN LOOP.
    //DO NOT USE SOQL-STATEMENT IN LOOP.

    public static void insertInApex(){
        List<Account> accountList = new List<Account>();
        for(Integer i = 15; i< 20; i++){
            Account accObj = new Account();
            accObj.Name = 'Acc from Apex 00'+i;
            accObj.AccountNumber = '134234ANF';
            accObj.Description = 'Description';
            
            accountList.add(accObj);
        }
        
        INSERT accountList;
	}
    
    
    public static void updateInApex(){
        List<Account> accountList = [
            SELECT Id, Name 
            FROM Account
            WHERE CreatedDate = TODAY
        ];
        List<Account> updateAccountList = new List<Account>();
        
        for(Account accObj: accountList){
            if(accObj.Name == 'Acc from Apex 0034'){
                accObj.Description = 'New Account twice';
                updateAccountList.add(accObj);
                //Create an Object for Contact.
                /*
                 * //Desing an Apex-Script such that if account name is 'Acc from Apex 0012', 
    				//then create an contact.
    			*/
                Contact contObj = new Contact();
                contObj.FirstName = accObj.Name;
            }
            
        }
        if(updateAccountList.size() > 0){
        	UPDATE updateAccountList;   
        }
	}
    
    
	public static void updateParentInApex(){
        /*
         * Desing an Apex-Script such that if contact's Lead Source is `Phone Inquiry`, 
         * And Populate Contact's Phone on Account Phone.
         *
         * */
        
        String leadSourceName = 'Phone Inquiry';
        
        List<Contact> contactList = [
            SELECT Id, AccountId, firstName, lastName, Phone
            FROM Contact
            WHERE Email != NULL
            AND LeadSource = :leadSourceName
            AND AccountId != NULL
            AND Phone != NULL
        ];
        
        List<Account> accountToUpdate = new List<Account>();
        
        for(Contact contObj: contactList){
            Account accObj = new Account();
            accObj.Id = contObj.AccountId;
            accObj.Phone = contObj.Phone;
            accountToUpdate.add(accObj);
        }
        
        if(accountToUpdate.size() > 0){
            UPDATE accountToUpdate;
        }
        
    }
    
}