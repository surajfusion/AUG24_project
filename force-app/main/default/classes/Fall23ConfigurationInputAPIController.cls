public with sharing class Fall23ConfigurationInputAPIController {
    
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContactList(){
        try {
            return[
                SELECT FirstName, LastName, Email
                FROM Contact
                ORDER BY CreatedDate DESC
                LIMIT 100
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


    @AuraEnabled(cacheable = true)
    public static List<Lead> getLeadList(){
        try {
            return [
                SELECT FirstName, LastName, Email
                FROM Lead
                ORDER BY CreatedDate DESC
                LIMIT 100
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}