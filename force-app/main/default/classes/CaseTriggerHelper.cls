public class CaseTriggerHelper {

    
    public static void beforeUpdate(List<Case> newCaseList, List<Case> oldCaseList){
        markContactRequired(newCaseList, oldCaseList);
        populateWebEmail(newCaseList, oldCaseList);
    }
    
    /*
     * When Priority = High and Origin is Phone, 
     * then mark ContactId is required. 
     * */
    
    public static void markContactRequired(List<Case> newCaseList, List<Case> oldCaseList){
        
        for(Case caseObj: newCaseList){
            if(caseObj.Priority == 'High' && caseObj.Origin == 'Phone'){
                if(STRING.ISBLANK(caseObj.ContactId)){
                    caseObj.ContactId.addError('PHONE IS REQUIRED');
                }
            }
        }
    }
    
    /***
     * Desing trigger on the case to populate the webemail = 'contact'+ '@' + account.websiteDomain
     * */
    
    public static void populateWebEmail(List<Case> newCaseList, List<Case> oldCaseList){
        //NOOB
        /*
        for(Case caseObj: newCaseList){
            List<Account> accList = [
                SELECT Id, Website
                FROM Account
                WHERE Id = :caseObj.AccountId
            ];
            
            caseObj.SuppliedEmail = 'contact'+ '@' + accList[0].Website.split('www.')[1];
        }
        */
        Set<Id> accountIds = new Set<Id>();
        for(Case caseObj: newCaseList){
            if(caseObj.AccountId != NULL){
            	accountIds.add(caseObj.AccountId);   
            }
        }
        
        if(accountIds.size() > 0){
            List<Account> accList = [
                SELECT Id, Website
                FROM Account
                WHERE Id IN :accountIds
            ];
            /*
            for(Case caseObj: newCaseList){
                for(Account accObj :accList){
                    if(accObj.Id == caseObj.AccountId){
                        caseObj.SuppliedEmail = 'contact'+ '@' + accObj.Website.split('www.')[1];
                    }
                }
                
            }
			*/
            Map<Id, Account> accountByIdMap = new Map<Id, Account>();
            for(Account accObj :accList){
                accountByIdMap.put(accObj.Id, accObj);
            }
            
            for(Case caseObj: newCaseList){
                if(accountByIdMap.containsKey(caseObj.AccountId)){
                    Account accObj = accountByIdMap.get(caseObj.AccountId);
                    caseObj.SuppliedEmail = 'contact'+ '@' + accObj.Website.split('www.')[1];
                }
            }
        }
    }
    
    
}