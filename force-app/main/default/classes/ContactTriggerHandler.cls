public class ContactTriggerHandler {
	
    public static void beforeInsert(List<Contact> contactList){
        ageCheck(contactList);
        checkExistingEmail(contactList);
        updateLeveField(contactList);
    }
    
    
    private static void ageCheck(List<Contact> contactList){
        for(Contact contactObj : contactList){
            system.debug('Name: ' + contactObj.FirstName);
            system.debug('Name: ' + contactObj.LastName);
            system.debug('Name: ' + contactObj.Birthdate);
            
            Decimal age = contactObj.Birthdate != NULL 
                ? (contactObj.Birthdate.monthsBetween(System.Today()))/12 
                : 0;
            /*
             * 
* Decimal age;
if(contactObj.Birthdate != NULL){
age = (contactObj.Birthdate.monthsBetween(System.Today()))/12 ;
}else{
age = 0;
}
*/
            system.debug('age: ' + age);
            
            //comparision.
            if(age > 18){
                //All Good.
            }else{
                //throw error.
                //Page Error.
                //contactObj.addError('Age Must be greater than 18');
                //
                //Field Error
                contactObj.Birthdate.addError('Age Must be greater than 18');
            }
        }
    }
    
    private static void checkExistingEmail(List<Contact> contactList){
        Set<String> existingEmail = new Set<String>();
        for(Contact contactObj : contactList){
            if(contactObj.Email != NULL){
            	existingEmail.add(contactObj.Email);   
            }
        }
        
        if(existingEmail.size() > 0){
            List<Contact> existingContactsList = [
                SELECT Id, Email
                FROM Contact
                WHERE Email IN :existingEmail
            ];
            
            //noobs
            /*
            for(Contact contactObj : contactList){
                if(contactObj.Email != NULL){
                    for(Contact existingContact: existingContactsList){
                        if(existingContact.Email == contactObj.Email){
                            contactObj.Email.addError('DUPLICATE EMAIL FOUND.');
                        }
                    }
                }
            }*/
            Map<String, Contact> contactByEmailMap = new Map<String, Contact>();
            for(Contact existingContact: existingContactsList){
                contactByEmailMap.put(existingContact.Email, existingContact);
            }
            
            for(Contact contactObj : contactList){
                if(contactByEmailMap.containsKey(contactObj.Email)){
                    contactObj.Email.addError('DUPLICATE EMAIL FOUND.');
                }
            }
        }
    }
    
    /*
     * Design a logic such that when the lead source is web, then Level = `Primary`.
     * */
    
    private static void updateLeveField(List<Contact> contactList){
        for(Contact contactObj : contactList){
            if(contactObj.LeadSource == 'Web'){
                contactObj.Level__c = 'Primary';
            }
        }
    }
    
    /***
     * Write a trigger on Contact object that, when a new Contact is inserted, 
     * updates the Number_of_Contacts__c field on the related Account 
     * with the count of associated contacts
     * 
     * */
    
    public static void afterInsert(List<Contact> contactList){
        processAndUpdateAccount(contactList);
    }
    
    private static void processAndUpdateAccount(List<Contact> contactList){
        Set<Id> accountIds = new Set<Id>();
        for(Contact contactObj : contactList){
            if(contactObj.accountId != NULL){
            	accountIds.add(contactObj.accountId);    
            }
        }
        System.debug('2: ' + accountIds);
        if(accountIds.size() > 0){
            /*
             APPROACH 1
            List<Account> accountList = [
                SELECT Id,
                (SELECT Id FROM Contacts)
                FROM Account
                WHERE Id IN :accountIds
            ];
            
            List<Account> accountToUpdate = new List<Account>();
            for(Account accObj: accountList){
                accObj.Number_Of_Contacts__c  = accObj.Contacts.size();
                accountToUpdate.add(accObj);
            }
            System.debug('3: ' + accountToUpdate);
            
            if(accountToUpdate.size() > 0){
                UPDATE accountToUpdate;
            }

APPROACH 2
            List<AggregateResult> aggregateResultList = [
                SELECT Count(Id) sum, AccountId
                FROM Contact
                WHERE AccountId IN :accountIds
                GROUP BY AccountId
                
            ];
            
            List<Account> accountToUpdate = new List<Account>();
            for(AggregateResult agr: aggregateResultList){
                Account accObj = new Account();
                accObj.Id = (Id) agr.get('AccountId');
                
                accObj.Number_Of_Contacts__c  = (decimal) agr.get('sum');
                accountToUpdate.add(accObj);
            }
            
            System.debug('3: ' + accountToUpdate);
            
            if(accountToUpdate.size() > 0){
                UPDATE accountToUpdate;
            }
        }
*/
//            APPROACH 3        
    
            List<Contact> existingContactList = new List<Contact>();
            existingContactList = [
                SELECT Id, AccountId
                FROM Contact
                WHERE AccountId IN :accountIds
            ];
            
            Map<Id, List<Contact>> contactsByAccountIdMap = new Map<Id, List<Contact>>();
            
            for(Contact contObj :existingContactList){
                
                List<Contact> contList = new List<Contact>();
                //IMPORTANT CHECK.
                if(contactsByAccountIdMap.containsKey(contObj.AccountId)){
                    contList = contactsByAccountIdMap.get(contObj.AccountId);
                }
                contList.add(contObj);
                contactsByAccountIdMap.put(contObj.AccountId, contList);
            }
            
            List<Account> accountToUpdate = new List<Account>();
            for(Id accId: contactsByAccountIdMap.keySet()){
                Account accObj = new Account();
                accObj.Id = accId;
                
                accObj.Number_Of_Contacts__c  = contactsByAccountIdMap.get(accId).size();
                accountToUpdate.add(accObj);
            }
            System.debug('3: ' + accountToUpdate);
            
            if(accountToUpdate.size() > 0){
                UPDATE accountToUpdate;
            }
        }
    }
}