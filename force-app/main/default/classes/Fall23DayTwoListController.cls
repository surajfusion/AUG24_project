public class Fall23DayTwoListController {
	/*
	 * LIST IN APEX
	 * It is used to hold multiple values of the same datatype.
	 * */
	
    /*
     * SYNTAX
     * List<Dtatype> listName;
     * List<Dtatype> listName = new List<Dtatype>();
	 * List<Dtatype> listName = new List<Dtatype>{'V1', 'V2', ...};
     * */
    
    public Fall23DayTwoListController(){
        List<String> firstNameList;
        List<String> lastNameList = new List<String>();
        List<String> middleNameList = new List<String>{'Value 1', 'value 2', 'value 3'};
            
        //How to add Values.
        firstNameList = new List<String>();
        firstNameList.add('Suraj');
        firstNameList.add('Abdul');
        firstNameList.add('Mirsawar');
        
        lastNameList.add('Singh');
        lastNameList.add('Khan');
        lastNameList.add('Mirsawar');
        
        System.debug('firstNameList: ' + firstNameList);
        System.debug('middleNameList: ' + middleNameList);
        System.debug('lastNameList: ' + lastNameList);
    }
    
}