public class OpportunityTriggerHelper {
	
    /***
     * 
     * Create a trigger on the Opportunity such that if the Opportunity Amount is grater than 50K,
     * then Create a task will following detail
     * Subject: Important Opportunity.
     * Due Date: 5 Days from Now.
     * */
    public static void afterInsert(List<Opportunity> oppList){
        
        //Noob Prog.
        /*
        for(Opportunity oppObj: oppList){
            if(oppObj.Amount > 50000){
                //Create Task.
                Task tk = new Task();
                tk.Subject = 'Important Opportunity';
                tk.ActivityDate = System.today().addDays(5);
                tk.WhatId = oppObj.Id;
                INSERT tk; //DO NOT USE DML IN LOOP.
            }
        }*/
        List<task> taskListToInsert = new List<task>();
        for(Opportunity oppObj: oppList){
            if(oppObj.Amount > 50000){
                //Create Task.
                Task tk = new Task();
                tk.Subject = 'Important Opportunity';
                tk.ActivityDate = System.today().addDays(5);
                tk.WhatId = oppObj.Id;
                //INSERT tk; //DO NOT USE DML IN LOOP.
                taskListToInsert.add(tk);
            }
        }
        
        if(taskListToInsert.size() > 0){
            INSERT taskListToInsert;
        }
    }
}