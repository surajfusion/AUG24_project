public class DAY11_NonPrimitiveDT {
	public static void learMAP(){
        /******
         * Retrieve all Opportunities and 
         * create a new list containing unique Product2 records associated with those opportunities.
         * 
         * */
        
        List<OpportunityLineItem> opportunityLineItemList = new List<OpportunityLineItem>();
        opportunityLineItemList = [
            SELECT Id, Product2Id, Product2.Name, OpportunityId, Opportunity.Name
            FROM OpportunityLineItem
        ];
        
        Map<Id, List<Product2>> uniqueProListByOppMap = new Map<Id, List<Product2>>();
        List<Id> uniqueProdId = new List<Id>();
        
        //NOOB PROGRAMMING.
        for(OpportunityLineItem oppLI : opportunityLineItemList){
            //*********
            List<Product2> productList = new List<Product2>();
            if(uniqueProListByOppMap.containsKey(oppLI.OpportunityId)){
                productList = uniqueProListByOppMap.get(oppLI.OpportunityId);
            }
            productList.add(oppLI.Product2);
            
            uniqueProListByOppMap.put(oppLI.OpportunityId, productList);
            //***********
            
            List<Product2> uniqueProductList = new List<Product2>();
            List<Id> prodIds = new List<Id>();
            
            for(Product2 prodObj :productList){
                
                if(!prodIds.contains(prodObj.Id)){ 
                    prodIds.add(prodObj.Id);
                    
                    uniqueProductList.add(prodObj);
                }
                
            }
            
            uniqueProListByOppMap.put(oppLI.OpportunityId, uniqueProductList);
        }
        
        
    }
    
    public static void learMAP2(){
        /****
         * Get Account and its related Contacts.
         * */
        List<Account> accountList = new List<Account>();
        accountList = [
            SELECT Id, Name,
            (SELECT Id, Name FROM Contacts)
            FROM Account
		];
        Map<String, List<Contact>> contactListByAccName = new Map<String, List<Contact>>();
        
        /*
        for(Account accountObj : accountList){
            if(accountObj.Name == 'Grand Point'){
                for(Contact contObj :accountObj.Contacts){
                    System.debug('Name: ' + contObj.Name);
                }
            }
        }
*/
        for(Account accountObj : accountList){
            contactListByAccName.put(accountObj.Name, accountObj.Contacts);
        }
        
        List<Contact> contactList = contactListByAccName.get('Grand Point');
        for(Contact contObj :contactList){
            System.debug('Name: ' + contObj.Name);
        }
        
        for(Contact contObj :contactListByAccName.get('Grand Point')){
            System.debug('Name: ' + contObj.Name);
        }
        
    }
}