public class DAY12_NonPrimitiveDT {
    public static void learnCustomMAP(){
        /******
         * Design a Apex Class to retrieve 
         * all Contact records with unique Phone numbers across multiple Accounts.
         * 
         * */
        
        Map<Id, Account> accountByIdMap = new Map<Id, Account>();
        Map<Id, Contact> contactByIdMap = new Map<Id, Contact>();
        
        Map<Id, List<Contact>> contactListByAccountIdMap = new Map<Id, List<Contact>>();
        
        List<Account> accountList = new List<Account>();
        accountList = [
            SELECT Id, Name,
            (SELECT Id, Name, Phone FROM Contacts)
            FROM Account WHERE Id IN (SELECT accountId FROM Contact)
		];
        /*
        //Noob Programming
        for(Account accObj :accountList){
            accountByIdMap.put(accObj.Id, accObj);
            
            for(Contact contactObj :accObj.Contacts){
                contactByIdMap.put(contactObj.Id, contactObj);
            }
            
            contactListByAccountIdMap.put(accObj.Id, accObj.Contacts);
        }
        
        for(Id accId :contactListByAccountIdMap.keySet()){//Here we are looping on the MAP on the basis of KeySet.
            //get Value on the basis of key.
            Set<String> phoneNumbers = new Set<String>();
            
            List<Contact> uniqueContactList = new List<Contact>();
            for(Contact contactObj :contactListByAccountIdMap.get(accId)){
                
                if(!phoneNumbers.contains(contactObj.Phone)){
                    uniqueContactList.add(contactObj);
                }                
            }
            
            contactListByAccountIdMap.put(accId, uniqueContactList);
        }
        */
        
        for(Account accObj :accountList){
            accountByIdMap.put(accObj.Id, accObj);
            
            //get Value on the basis of key.
            Set<String> phoneNumbers = new Set<String>();
            List<Contact> uniqueContactList = new List<Contact>();
            for(Contact contactObj :accObj.Contacts){
                if(!phoneNumbers.contains(contactObj.Phone)){
                    uniqueContactList.add(contactObj);
                } 
            }
            
            contactListByAccountIdMap.put(accObj.Id, uniqueContactList);
        }
        
        //Debug account by All Contacts with unique Phone numbers
        for(Id accId :contactListByAccountIdMap.keySet()){
            System.debug('Account Name: ' + accountByIdMap.get(accId).Name);
            for(Contact contactObj :contactListByAccountIdMap.get(accId)){
                System.debug('Contact Name: ' + contactObj.Name);
            }
        }
        
    }
}