public class DAY2_SOQLIN_APEX {

    public static void learnSOQLinApex(){
        /*
        List<Opportunity> opportunityList = [SELECT Name, Amount, StageName, CloseDate 
                                             FROM Opportunity 
                                             WHERE StageName = 'Prospecting' 
                                             AND CloseDate = NEXT_90_DAYS];
		

        for(Opportunity oppObj :opportunityList){
            System.debug(oppObj.Name);
        }
		*/
        
        List<AggregateResult> opportunityAgrList = [
            //alias
            SELECT COUNT(Id) totalCount,SUM(Amount) sumAmount, StageName, Account.Name
            FROM Opportunity
            GROUP BY StageName, Account.Name
        ];
        for(AggregateResult oppAgrObj :opportunityAgrList){
            
            //System.debug(oppAgrObj.get('expr0')); //Count(Id)
            System.debug('COUNT: ' +oppAgrObj.get('totalCount')); //Count(Id)
            //System.debug(oppAgrObj.get('expr1'));//SUM(Amount)
            System.debug('SUM: ' + oppAgrObj.get('sumAmount'));//SUM(Amount)
            System.debug('STAGENAME: ' + oppAgrObj.get('StageName'));
        }
    }
}