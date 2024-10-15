public class DAY5_NonPrimitiveDT {
	public static void learnNonPrimitiveDT(){
        //LIST --> more than one records. --> can have duplicate values.
        //SET --> Unique values.
        /* Requirement
         * Find contacts that have the same email as the Lead have
         * */
        /*
        List<Lead> leadList = [
            Select Email 
            FROM Lead
            WHERE email != NULL
        ];        
        Set<String> emails = new Set<String>();
        
        //Unique Emails.
        for(Lead leadObj :leadList){
            emails.add(leadObj.Email);
        }
        
        List<Contact> contactList = [
            SELECT Id, Name, Phone
            FROM Contact
            WHERE Email IN :emails //When we have to use set or List in SOQL, then use `IN`.
        ];
        */
        //...
        // Requirement: Design an Logic such that you need to find all contacts
        // having same phone and email.
        // */
        // 
        List<Lead> leadList = [
            Select Email, Phone 
            FROM Lead
            WHERE email != NULL
        ];        
        Set<String> emails = new Set<String>();
        Set<String> phones = new Set<String>();
        
        //Unique Emails and Phone
        for(Lead leadObj :leadList){
            emails.add(leadObj.Email);
            phones.add(leadObj.Phone);
        }
        
        List<Contact> contactList = [
            SELECT Id, Name, Phone
            FROM Contact
            WHERE Email IN :emails //When we have to use set or List in SOQL, then use `IN`.
            AND Phone IN :phones
        ];
    }
}