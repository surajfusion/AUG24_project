public class DAY4_NonPrimitiveDT {
	
    public static void learnNonPrimitiveDT(){
        //GET RECORDS
        List<Account> accountList = [
            SELECT Name 
            FROM Account
            WHERE LastmodifiedDate = LAST_N_DAYS:7
        ];
        
        for(Account accObj :accountList){
            System.debug('Name: ' + accObj.Name);
        }
        
        //Properties of List.
        /* Account is a Class.
         * Fields == Variables.
         * */
        //INSERT RECORDS //DML Statements --> INSERT, UPDATE, DELETE.
        /*
        Account accountObj = new Account();
        accountObj.Name = 'Test from Apex 001';
        accountObj.Phone = '9012312322';
        INSERT accountObj;
        
        Account accountObj2 = new Account();
        accountObj2.Name = 'Test from Apex 002';
        accountObj2.Phone = '9012312322';
        INSERT accountObj2;
        
        Account accountObj3 = new Account();
        accountObj3.Name = 'Test from Apex 003';
        accountObj3.Phone = '9012312322';
        INSERT accountObj3;
        
        //LIMIT: we can't use more that 100 DML statements in a single transation.
        List<Account> accountListToInsert = new List<Account>();
        
        Account accountObj = new Account();
        accountObj.Name = 'Test from Apex 001';
        accountObj.Phone = '9012312322';
        accountListToInsert.add(accountObj); //Add property to add an element in list.
        
        Account accountObj2 = new Account();
        accountObj2.Name = 'Test from Apex 002';
        accountObj2.Phone = '9012312322';
        accountListToInsert.add(accountObj2);
        
        Account accountObj3 = new Account();
        accountObj3.Name = 'Test from Apex 003';
        accountObj3.Phone = '9012312322';
        accountListToInsert.add(accountObj3);
        
        INSERT accountListToInsert;
		*/
        
        List<Account> accountListToInsert = new List<Account>();
        
        for(integer i = 0; i < 3; i++){
            Account accountObj = new Account();
            accountObj.Name = 'Test from Apex 000' + i;
            accountObj.Phone = '9012312322';
            accountListToInsert.add(accountObj); //Add property to add an element in list.
        }
        INSERT accountListToInsert;
         
    }    
}