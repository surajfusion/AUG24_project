public class Fall23DayOneController {

    //Constructor. --> to execute automatically when class is called.
    public Fall23DayOneController(){
        
        /*
         * Variables:
            It is used to hold a value that can be used in multiple places, and can be changed whenever needed.
            
            DataType:
            It is used to define the Type of Data which is held by a variable.
		*/
        
       	
       	//SYNTAX --> for any programming laguage, SYNTAX Means, how to write a program in that language.
       	
       	//Declaration of a Variable 
       	//SYNTAX
       	//#1: Datatype variableName;
       	//#2: Datatype variableName = value;
       	
        //Datatype:
        //String: to hold text values.
        //Integer: to holds numerical values.
        //Decimal: to holds numerical values along with decimal parts.
        //Date
        //DateTime
        //Boolean: to hold true and false value.
        //
        
        //Declaration of a Variable 
        //Example:
        String firstName; 
        String lastName = 'Singh';// Here 'Singh' is value for the Variable lastName.
        
        Integer myLuckyNumber1 = 30;
        //Integer myLuckyNumber2 = '30'; 
        //Here inverted commas, makes the value as String, and we can't hold a string value inside any Integer.
        //
        Decimal mySalaryInOctober = 12231.84;
        
        //Debugging value of a variable.
        System.debug('1: '+ firstName);
        
        Date myBirthDate = Date.newInstance(1960, 2, 17);//YYYY,MM,DD
        Datetime myMorningWakeUpTime = DateTime.newInstance(1997, 1, 31, 10, 8, 16);//YYYY,MM,DD,hh,mm,ss
        
        Boolean isTodayIsHoliday = false;
        
        //Re-Use of Variable
        firstName = 'Suraj';
        
        //Debugging value of a variable.
        System.debug('2: '+ firstName);
        
        firstName = 'Abdul';
        
        //Debugging value of a variable.
        System.debug('3: '+ firstName);
        System.debug('1: '+ myBirthDate);
    }
}