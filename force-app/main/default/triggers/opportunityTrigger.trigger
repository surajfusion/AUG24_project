trigger opportunityTrigger on Opportunity (after insert) {

    if(trigger.isAfter){
        if(trigger.isInsert){
            OpportunityTriggerHelper.AfterInsert(trigger.new);
        }
    }
}