public with sharing class IntegrationExampleController {
    
    @AuraEnabled
    public static string getResponseFromAPI(String airportName){
        //String endpoint = 'https://api.api-ninjas.com/v1/airports?name=' + airportName;
        // Instantiate a new Http object
        Http h = new Http();

        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:NinzaAirlineApi' +'?name='+ airportName);
        req.setHeader('X-Api-Key', '8vHqnkQk7xdnDDa3FyNmIA==FxyxBRL1mI66sacE');
        req.setMethod('GET');

        // Send the request, and return a response
        HttpResponse res = h.send(req);
        System.debug(res.getBody());
        return res.getBody();   
    }
}