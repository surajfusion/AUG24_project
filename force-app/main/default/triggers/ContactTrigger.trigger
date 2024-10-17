/***
 * VALIDATION TRIGGER EXAMPLE:
 * Create a trigger on the contact Object to check age of the contact is greater than 18 or not.
 * 
 *  trigger.new () List<sObject> which gets changed according to trigger Object, 
    Always returns the records that are going to save permanently(on-going).
    
    trigger.new --> List<Contact>
 * */

trigger ContactTrigger on Contact (before insert, after insert) {
    
    if(trigger.isBefore){
        if(trigger.isInsert){
            ContactTriggerHandler.beforeInsert(trigger.new);
        }
    }
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            System.debug('1: ' + 'AFTER INSERT');
            ContactTriggerHandler.afterInsert(trigger.new);
        }
    }
}