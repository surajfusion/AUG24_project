public class DAY4_SOQLINAPEX {

    public static void learn_dynamicSOQL(String stageFilter){
        /*
         * STATIC SOQL
        List<Opportunity> opportunityList = [SELECT Name, Amount, StageName, CloseDate 
                                             FROM Opportunity 
                                             WHERE StageName = 'Prospecting' 
                                             AND CloseDate = NEXT_90_DAYS];
		

        for(Opportunity oppObj :opportunityList){
            System.debug(oppObj.Name);
        }
		*/
        
        /**
         * DYNAMIC SOQL
         * 
        
        String queryStr = 'SELECT Name, Amount, StageName, CloseDate  FROM Opportunity ' +
            'WHERE StageName = \'Prospecting\' ' + 
            'AND CloseDate = NEXT_90_DAYS';
        */
        String queryStr = 'SELECT Name, Amount, StageName, CloseDate  FROM Opportunity ';
        if(STRING.ISNOTBLANK(stageFilter)){
            queryStr += 'WHERE StageName = :stageFilter '; //When we have to use variable in Query then user colon(:).
        }
        List<Opportunity> opportunityList =  Database.query(queryStr);
		
        for(Opportunity oppObj :opportunityList){
            System.debug(oppObj.Name);
        }
    }
}