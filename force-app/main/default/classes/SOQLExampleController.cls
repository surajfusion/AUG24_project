public class SOQLExampleController {

    @auraenabled(Cacheable = true) 
    Public Static List<Contact> getContactList(){
        return [
            SELECT FirstName, LastName, Phone 
            FROM Contact 
            WHERE Phone != NULL 
            LIMIT 10
        ];
    }	
}