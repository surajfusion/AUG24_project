public class DAY10_NonPrimitiveDT {
    
	public static void learnwithSOQL(){
        //LIST, SET
        //LIST on storing values --> 0,1,2,...9
        //MAP --> duplicate checking is based on the `key` of the map.
        //MAP --> `Value` ==> Every key has a value.
        
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
        //Map<Key, Value>
        Map<String, Contact> contactByEmailMap = new Map<String, Contact>();
        
        for(Contact contactObj :contactList){
            contactByEmailMap.put(contactObj.Email, contactObj); //In case of Map we need to use PUT.
        }
        
        //Properties of MAP.
        //`GET` property. It help to get data(value) from map in the basis of Key.
        
        System.debug('Contact:' + contactByEmailMap.get('xyz@gamil.com'));
    }
}