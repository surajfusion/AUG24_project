trigger TaskTrigger on Task (after Update) {

    if(trigger.isAfter && trigger.isUpdate){
        TaskTriggerHandler.afterUpdate(trigger.new, trigger.oldMap);
    }
}