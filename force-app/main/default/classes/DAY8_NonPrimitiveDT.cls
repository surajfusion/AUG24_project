public class DAY8_NonPrimitiveDT {
    /**
     * Write an Apex class to identify and log Leads 
     * that have not been contacted (no Tasks related to them).
     * 
     * */
    
    public static void learnSOQL(){
        Set<Id> leadids = new Set<Id>();
        List<Task> taskList = [
            SELECT WhoId 
            FROM Task
            WHERE Who.Type = 'Lead'
        ];
        
        for(Task taskObj :taskList){
            leadids.add(taskObj.WhoId);
        }
        
        List<Lead> leadsHavingNoTask = [
            SELECT ID, Name
            FROM Lead
            WHERE ID NOT IN :leadids
        ];
    }
}