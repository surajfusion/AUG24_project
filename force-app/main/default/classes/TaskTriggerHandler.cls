public class TaskTriggerHandler {
    public static void afterUpdate(List<Task> newtaskList, Map<Id, Task> oldTaskById){
        /*
        Map<Id, Task> oldTaskById = new Map<Id, Task>();
        for(Task tkold :oldTaskList){
			oldTaskById.put(tkold.Id, tkold);            
        }
		*/
        
        Set<Id> caseIds = new Set<Id>();
        /*
        for(Task tknew :newtaskList){
            for(Task tkold :oldTaskList){
               if(tknew.Status == 'Completed' && tknew.status != tkold.status){
                   caseIds.add(tknew.WhatId );
               } 
            }
            
        }
		*/
        for(Task tknew :newtaskList){
            Task oldTaskObj = oldTaskById.get(tknew.Id);
            if(tknew.Status == 'Completed' && tknew.status != oldTaskObj.status){
                caseIds.add(tknew.WhatId );
            } 
        }
        
        if(caseIds.size() > 0){
            markCaseClosed(caseIds);
        }
    }
    
    /**
     * 
     * Write a trigger that automatically closes a Case 
     * when all associated Tasks marked as status = `Completed`
     * 
     * **/

    public static void markCaseClosed(Set<Id> caseIds){
        List<Case> casesToUpdate = new List<Case>();
        List<Case> caseList = [
            SELECT Id,
            (SELECT Id from Tasks
            WHERE status != 'Completed')
            FROM Case
            WHERE Id IN :caseIds
        ];
        
        for(Case caseObj :caseList){
            if(caseObj.Tasks.size() == 0){
                caseObj.Status = 'Closed'; //If Case status = Closed, the IsClosed automatically = true.
                casesToUpdate.add(caseObj);
            }
        }
        
        if(casesToUpdate.size() > 0){
            UPDATE casesToUpdate;
        }
    }
}