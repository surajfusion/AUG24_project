public class DAY6_NonPrimitiveDT {
	/*
	 * Write an Apex class that checks if any Account 
	 * has more Opportunities than Cases and lists these Accounts.
	 * 
	 * */
    
    public static void accountCheck(){
        List<Account> accountList = [
            SELECT Id, Name,
            (SELECT Id from Cases),
            (SELECT ID from Opportunities)
            FROM Account
        ];
        //Noob Developer
        for(Account accObj :accountList){
            Integer countCases = 0;
            for(Case caseObj :accObj.Cases){
                countCases ++;
            }
			
            Integer countOpportunity = 0;
            for(Opportunity caseObj :accObj.Opportunities){
				countOpportunity ++;                
            }   
            
            if(countCases > countOpportunity){
                System.debug('Account Name ' + accObj.Name);
            }
        }
        
        //Pro Developer (To be Continue...)
        for(Account accObj :accountList){
            /*
            Integer countCases = 0;
            for(Case caseObj :accObj.Cases){
                countCases ++;
            }
			
            Integer countOpportunity = 0;
            for(Opportunity caseObj :accObj.Opportunities){
				countOpportunity ++;                
            }   
            
            if(countCases > countOpportunity){
                System.debug('Account Name ' + accObj.Name);
            }
			*/
        }
        
        
        //Pro Plus Developer
       	//Use property of list to get Size.
        for(Account accObj :accountList){
            Integer numberOfCases = accObj.Cases.Size(); // List.size().
            Integer numberOfOpportunities = accObj.Opportunities.size();
            
            if(numberOfCases > numberOfOpportunities){
                System.debug('Account Name ' + accObj.Name);
            }
        }
    }
    
    /***
     * Write an Apex class that checks if any 
     * Hot Rating Account has 
     * overdue Tasks and no follow-up Opportunities.
     * */
    public static void highRiskCheck(){
        List<Account> accountList = [
            SELECT Id, Name,
            (SELECT Id, ActivityDate from Tasks WHERE ActivityDate < Today),
            (SELECT ID from Opportunities)
            FROM Account
        ];
        //Noob Developer
        for(Account accObj :accountList){
            Integer countTask = 0;
            for(Task taskObj :accObj.Tasks){
                countTask ++;
            }
			
            Integer countOpportunity = 0;
            for(Opportunity caseObj :accObj.Opportunities){
				countOpportunity ++;                
            }   
            
            if(countTask > 0 && countOpportunity == 0){
                System.debug('Account Name ' + accObj.Name);
            }
        }
        
        //Pro Plus Developer
       	//Use property of list to get Size.
        for(Account accObj :accountList){
            //Integer countTask = accObj.Tasks.Size(); // List.size().
            //Integer countOpportunity = accObj.Opportunities.size();
            
            if(accObj.Tasks.Size() > 0 && accObj.Opportunities.size() == 0){
                System.debug('Account Name ' + accObj.Name);
            }
        }
    }
    
    /***
     * Write an Apex class that calculates and logs the 
     * total Amount of open Opportunities for each Account.
     * 
     * */
    public static void opportunitAmount(){
        List<AggregateResult> agrList = [
            SELECT SUM(Amount), Account.Name
            FROM Opportunity
            GROUP BY Account.Name
        ];
        for(AggregateResult agrObj :agrList){
            System.debug('Account Name: ' + agrObj.get('Account.Name') );
        }
    }
    
    public static void opportunitAmountOther(){
        List<Account> accountList = [
            SELECT Id, Name,
            (SELECT Amount from Opportunities)
            FROM Account
        ];
        
        //Noob Developer
        for(Account accObj :accountList){
            Decimal oppAmount = 0;
            for(Opportunity oppObj :accObj.Opportunities){
                oppAmount += oppObj.Amount;
            }   
            
            System.debug('Account Name: ' + accObj.Name );
            System.debug('Amount: ' + oppAmount);
        }
    }
}