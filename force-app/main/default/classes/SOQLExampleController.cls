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

    @auraenabled(Cacheable = true) 
    Public Static List<Contact> searchContactList(String searchStr){
        String firstNameStr = '%' + searchStr + '%';
        return [
            SELECT FirstName, LastName, Phone 
            FROM Contact 
            WHERE firstName LIKE :firstNameStr
            LIMIT 10
        ];
    }	
}