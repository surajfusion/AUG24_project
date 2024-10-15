//NPDT:
//MAP
//Key and value pairs.
//Key has its own DT, always make it primitive DT.
//similarly `Value` has its own DT. can be primitive or non-primitive DT.
//
public class D2_NonPrimitiveDT {
	//Declaration.
	//Map<key, Value> mapName = new Map<key, Value>(); --> namming -> valueByKeyMap
	
    public static void learnMap(){
        Map<Integer, String> studentByIdMap = new Map<Integer, String>();
        
        studentByIdMap.put(1, 'Surendra');
        studentByIdMap.put(2, 'Prateek');  
        studentByIdMap.put(5, 'Kapil');  
        studentByIdMap.put(4, 'Loki');  
        
        system.debug('studentByIdMap: ' + studentByIdMap);
        
        system.debug('studentByIdMap at key 5: ' + studentByIdMap.get(5)); //Map.get(key) ==> value.
        
        
        //Looping.
        for(Integer rollId :studentByIdMap.keySet()){
            system.debug('key: ' + rollId);
            system.debug('value: ' + studentByIdMap.get(rollId));
        }
        /*
        for(String studentName :studentByIdMap.values()){
            system.debug('values: ' + studentName);
        }
		*/
    }
    
    //MAP Applications.
    /*
     * "Product List: Contains ProductId, ProductName, StockQuantity.
        Order List: Contains OrderId, CustomerId, ProductIds (list of ordered product IDs).
        Customer List: Contains CustomerId, CustomerName (list of placed order IDs)."

		Loop through the customerList and return a list of all orders placed by a specific customer.
        Loop through the orderList and check if there is enough stock available for each product in the productList.
        Identify customers who haven’t placed any orders and return their details.
        Create a summary that shows each customer, their orders, 
		and the products in each order.
	*/
    
    
    public static void learnMapApplications(){
        // Create the Product List with comma-separated values
        List<String> productList = new List<String>{
            'P001,Product 1,100',
            'P002,Product 2,150',
            'P003,Product 3,200',
            'P004,Product 4,80',
            'P005,Product 5,300',
            'P006,Product 6,120',
            'P007,Product 7,250',
            'P008,Product 8,90',
            'P009,Product 9,160',
            'P010,Product 10,400'
        };

        // Create the Order List with comma-separated values and list of productIds
        List<String> orderList = new List<String>{
            'O001,C001,P001',
            'O002,C001,P002',
            'O003,C003,P006',
            'O004,C004,P009',
            'O005,C005,P001',
            'O006,C006,P002',
            'O007,C006,P003',
            'O008,C006,P008',
            'O009,C001,P001',
            'O010,C010,P002'
        };

        // Create the Customer List with comma-separated values and list of orderIds
        List<String> customerList = new List<String>{
            'C001,Customer 1',
            'C002,Customer 2',
            'C003,Customer 3',
            'C004,Customer 4',
            'C005,Customer 5',
            'C006,Customer 6',
            'C007,Customer 7',
            'C008,Customer 8',
            'C009,Customer 9',
            'C010,Customer 10'
        };
            
        //Loop through the customerList and return a 
        //list of all orders placed by a specific customer.
            //NOOB
            /*
            for(String customerData :customerList){
                String[] customerRec = customerData.split(',');
                for(String orderData :orderList){
                    String[] orderRec = orderData.split(',');
                    if(customerRec[0] == orderRec[1]){
                        //orderids.add(orderRec[0]);
                        system.debug('customerId:' + customerRec[0]);
                        system.debug('orderId:' + orderRec[0]);
                    }
                }
            }*/
            
            Map<String, List<List<String>>> orderListByCustomIdMap = new Map<String, List<List<String>>>();
        	
        	for(String orderData :orderList){
                String[] orderRec = orderData.split(',');
                List<List<String>> tempOrderList = new List<List<String>>();
                if(orderListByCustomIdMap.containsKey(orderRec[1])){
                    tempOrderList = orderListByCustomIdMap.get(orderRec[1]);
                }
                tempOrderList.add(orderRec);
                
				orderListByCustomIdMap.put(orderRec[1], tempOrderList);                
            }
        	system.debug('orderListByCustomIdMap:' + orderListByCustomIdMap);
            /*
            for(String customerData :customerList){
                String[] customerRec = customerData.split(',');
                for(String orderData :orderList){
                    String[] orderRec = orderData.split(',');
                    if(customerRec[0] == orderRec[1]){
                        //orderids.add(orderRec[0]);
                        system.debug('customerId:' + customerRec[0]);
                        system.debug('orderId:' + orderRec[0]);
                    }
                }
            }
			*/
        
        for(String customerData :customerList){
            String[] customerRec = customerData.split(',');
            //system.debug('Custom Name:' + customerRec[1]);
            //system.debug('Order List:' + orderListByCustomIdMap.get(customerRec[0]));
        }
        
        //Create a summary that shows each customer, their orders, and the products in each order.
        Map<String, List<String>> productByIdMap = new Map<String, List<String>>();
        for(String productData :productList){
            String[] productRec = productData.split(',');
            productByIdMap.put(productRec[0], productRec);
        }
        
        for(String customerData :customerList){
            String[] customerRec = customerData.split(',');
            List<List<String>> customerOrderList = new List<List<String>>();
            
            if(orderListByCustomIdMap.containsKey(customerRec[0])){
                customerOrderList = orderListByCustomIdMap.get(customerRec[0]);
                system.debug('Customer Name:' + customerRec[1]);
                for(List<String> customerOrderDate : customerOrderList){
                    //String[] customerOrderRec = customerOrderDate.split(',');
                    
                    List<String> productData = productByIdMap.get(customerOrderDate[2]);
                    //String[] productDataRec = productData.split(',');
                    
                    system.debug('Product Name:' + productData[1]);
                }
            }
            
            //system.debug('Custom Name:' + customerRec[1]);
            //system.debug('Order List:' + orderListByCustomIdMap.get(customerRec[0]));
        }
    }
}