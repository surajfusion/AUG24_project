public class DAY3_SOQLINAPEX {
	
    public static void learnSOQLINAPEX(){
        /*
        List<AggregateResult> contactAgrList = [SELECT COUNT(Id), Email 
                                                FROM Contact
                                                WHERE Email != NULL
                                                GROUP BY Email
                                                HAVING COUNT(Id) > 1];
        
        for(AggregateResult contactAgrObj :contactAgrList){
            system.debug('DUPLICATE EMAIL: ' + contactAgrObj.get('Email'));
        }
		*/
        
        /*
         * Write an Apex class that identifies Accounts that 
         * have been modified in the last 7 days and lists their names.
         * */
        
		List<Account> accountList = [SELECT Name 
            FROM Account
            WHERE LastmodifiedDate = LAST_N_DAYS:7];
		
        List<Lead> leadList = [
            SELECT Id, Name, Company
            FROM Lead 
            WHERE Company != NULL
        ];
        //NOOB PROGRAMMING - 1000
        /*for(Account accObj :accountList){
            for(Lead leadObj :leadList){
                if(leadObj.Company == accObj.Name){
                    System.debug('Name: ' + accObj.Name);
                }
            }
        }*/
        
        //PRO PROGRAMMING
        List<String> companyNameList = new List<String>();
        
        for(Lead leadObj :leadList){
            //System.debug('Name: ' + leadObj.Name);
            companyNameList.add(leadObj.Company);
        }
        
        for(Account accObj :accountList){
            if(companyNameList.contains(accObj.Name)){
                System.debug('Name: ' + accObj.Name);
            }
        }
        
        //PRO PLUS PROGRAMMING
        //TO BE CONTINUE...
    }
}