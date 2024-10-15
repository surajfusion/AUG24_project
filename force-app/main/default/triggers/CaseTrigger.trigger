/* 	
 * trigger.new () List<sObject> which gets changed according to trigger Object, 
Always returns the records that are going to save permanently(on-going).
trigger.old. List<sObject>, 
Always returns the temporary relica of trigger.new having its previous value.

trigger.new --> List<Case>

 * */

trigger CaseTrigger on Case (before update) {
	
    if(trigger.isBefore){
        if(trigger.isUpdate){
            CaseTriggerHelper.beforeUpdate(trigger.new, trigger.old);
        }
    }
    
}