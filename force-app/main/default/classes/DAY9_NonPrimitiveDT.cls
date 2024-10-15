public class DAY9_NonPrimitiveDT {
	
    public static void learnwithSOQL(){
        //LIST, SET
        //MAP --> duplicate checking is based on the `key` of the map.
       	/***
       	 * Create a contact list that does not 
       	 * contains duplicate values on the basis of email.
		*/
        
        //List contains all contacts.
       	List<Contact> contactList = new List<Contact>();
        contactList = [
            SELECT Id, Name 
            FROM Contact
            WHERE Email != NULL
        ];
        
        List<Contact> uniqueContactList = new List<Contact>();
        List<String> uniqueEmail = new List<String>();
        
        for(Contact contactObj :contactList){
            
            if(!uniqueEmail.contains(contactObj.Email)){ //Contains is a property of list that check value in it.
                uniqueEmail.add(contactObj.Email);

                uniqueContactList.add(contactObj);
            }
            
        }
        
        for(Contact contactObj :uniqueContactList){
            if(contactObj.Email == 'xyz@gamil.com'){
                System.debug('Contact:' + contactObj);
            }
        }
    }
    
    public static void learnwithSOQLQUE2(){
        //LIST, SET
        //MAP --> duplicate checking is based on the `key` of the map.
       	/***
       	 * Create a contact list that does not 
       	 * contains duplicate values on the basis of email and Phone.
		*/
        //List contains all contacts.
       	List<Contact> contactList = new List<Contact>();
        contactList = [
            SELECT Id, Name, email, Phone 
            FROM Contact
            WHERE Email != NULL
        ];
        
        List<Contact> uniqueContactList = new List<Contact>();
        /*
        List<String> uniqueEmail = new List<String>();
        List<String> uniquePhone = new List<String>();
        
        for(Contact contactObj :contactList){
            
            if(!uniqueEmail.contains(contactObj.Email) 
               && !uniquePhone.contains(contactObj.Phone)){ //Contains is a property of list that check value in it.
                
                uniqueEmail.add(contactObj.Email);
                uniquePhone.add(contactObj.Phone);
                uniqueContactList.add(contactObj);
            }
            
        }
		*/
        List<String> uniquePhoneEmail = new List<String>();
        for(Contact contactObj :contactList){
            string phoneEmailStr = contactObj.Email + contactObj.Phone;
            
            if(!uniquePhoneEmail.contains(phoneEmailStr)){ //Contains is a property of list that check value in it.
                
                uniquePhoneEmail.add(phoneEmailStr);
                uniqueContactList.add(contactObj);
            }
            
        }
    }
}