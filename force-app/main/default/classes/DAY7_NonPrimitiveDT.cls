public class DAY7_NonPrimitiveDT {
	/***
	 * 
	 * Write an Apex class that compares the number of 
	 * Leads converted by each user to their respective 
	 * Opportunities won.
	 * 
	 * */
    
    public void nonPrimitive(){
        /*
        List<Lead> convertedLeadList = [
            SELECT Id, OwnerId 
            FROM Lead 
            WHERE IsConverted = true
        ];
        
        Set<Id> ownerIds = new Set<Id>();
        for(Lead leadObj :convertedLeadList){
            ownerIds.add(leadObj.OwnerId);
        }
        
        List<Opportunity> opportunityList = [
            SELECT Id, OwnerId
            FROM Opportunity
            WHERE OwnerId IN :ownerIds
            AND StageName = 'Closed Won'
        ];
        */
        
        List<AggregateResult> leadAggregateList = [
            SELECT Count(Id) leadCount, OwnerId
            FROM Lead 
            WHERE IsConverted = true 
            Group by OwnerId
        ];
        
        List<String> ownerIds = new List<String>();
        for(AggregateResult agrLead :leadAggregateList){
            ownerIds.add(''+ agrLead.get('OwnerId')); //` ''+ `, is used to convert any thing into string.
        }
        
        List<AggregateResult> opportunityAgrList = [
            SELECT count(Id) oppCount, OwnerId
            FROM Opportunity 
            WHERE OwnerId IN :ownerIds
            AND StageName = 'Closed Won'
            Group by OwnerId
        ];
        
        //NOOB PROGRAMMING
        for(AggregateResult agrOpp :opportunityAgrList){
            System.debug('OWNERID' + agrOpp.get('OwnerId'));
            System.debug('OPP COUNT' + agrOpp.get('oppCount'));
            
            for(AggregateResult agrLead :leadAggregateList){
                if(agrLead.get('OwnerId') == agrOpp.get('OwnerId')){
                    System.debug('LEAD COUNT' + agrOpp.get('leadCount'));
                }
            }
        }
    }
}