public class D4_SOQLInApex {
	public static void learnSOQLWithVariables(){
        String accountName = 'Edge Communications';
        List<Contact> contactList = [
            SELECT firstName, Lastname, Email, Phone, Account.Name 
            FROM Contact
            WHERE Account.Name = :accountName
        ];
        
        for(Contact contactObj :contactList){
            //system.debug('ContactObj : ' + contactObj);
            system.debug('Contact Name : ' + contactObj.FirstName);
        }
    }
    
    public static void learnSOQLWithVariables1(){
        Set<String> accountNames = new Set<String>();
        accountNames.add('Edge Communications');
        accountNames.add('Test from Apex 0001');
        
        List<Contact> contactList = [
            SELECT firstName, Lastname, Email, Phone, Account.Name 
            FROM Contact
            WHERE Account.Name IN :accountNames
            /*
            WHERE Account.Name = 'Edge Communications'
            OR Account.Name = 'Test from Apex 0001'
			*/
        ];
        
        for(Contact contactObj :contactList){
            //system.debug('ContactObj : ' + contactObj);
            system.debug('Contact Name : ' + contactObj.FirstName);
        }
    }
    
    public static void learnAggrSOQLWithVariables(){
        /*
        List<AggregateResult> agrList = [
            SELECT count(id) total, Email 
            FROM Contact 
            GROUP BY Email 
            HAVING count(id) > 2
        ];
		*/
        List<AggregateResult> agrList = [
            SELECT SUM(Amount) totalAmount, SUM(ExpectedRevenue), accountId 
            FROM opportunity
            GROUP BY accountId
        ];
        
        for(AggregateResult agrObj :agrList){
            system.debug('totalAmount: ' + agrObj.get('totalAmount'));//Its return Object.
            system.debug('ExpectedRevenue: ' + agrObj.get('expr0'));
        }
    }
}