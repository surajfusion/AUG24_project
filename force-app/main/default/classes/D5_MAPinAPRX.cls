public class D5_MAPinAPRX {
	
    /**
     * Create a field on the lead Object called 'Possible Dublicate', now design a script such that it will 
     * look for contact that have the same email as the lead have, 
     * and if any record found, then update the 'Possible duplicate' = true.
     * */
    
    
    public static void learnMAPSOQLWithVariables(){
        List<Lead> leadList = new List<Lead>();
        Set<String> emails = new Set<String>();
        
        leadList = [
            SELECT Email 
            FROM Lead
            WHERE Email != NULL
        ];
		
        /*
        for(Lead leadObj : leadList){
            
        }
		*/
        for(Lead leadObj : leadList){
            emails.add(leadObj.Email);
        }
        
        if(emails.size() > 0){
            List<Contact> contactList = [
                SELECT Id, Email 
                FROM Contact
                WHERE Email IN :emails
            ];
            
            Map<String, Contact> contactByEmailMap = new Map<String, Contact>();
            
            for(Contact contactObj :contactList){
                contactByEmailMap.put(contactObj.Email, contactObj);
            }
            
            List<Lead> leadToUpdate = new List<Lead>();
            for(Lead leadObj : leadList){
                if(contactByEmailMap.containsKey(leadObj.Email)){
                    leadObj.Description = 'Possible Duplicate Lead by Contact: ' + contactByEmailMap.get(leadObj.Email).Name;
                    leadToUpdate.add(leadObj);
                }
            }
            
            if(leadToUpdate.size() > 0){
                UPDATE leadToUpdate;
            }
            
        }
    }
    
    public static void learnMAPOfList(){
        List<Contact> contactList = [
            SELECT Id, Email 
            FROM Contact
            WHERE Email != NULL
        ];
        Map<String, List<Contact>> contactByEmailDomainMap = new Map<String, List<Contact>>();
        
        for(Contact contactObj :contactList){
            String emailDomain = contactObj.email.split('@')[1];
            List<Contact> tempContactList = new List<Contact>();
            if(contactByEmailDomainMap.containsKey(emailDomain)){
                tempContactList = contactByEmailDomainMap.get(emailDomain);
            }
            tempContactList.add(contactObj);
            contactByEmailDomainMap.put(contactObj.Email, tempContactList);
        }
        
    }
}