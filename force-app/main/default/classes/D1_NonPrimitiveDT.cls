//NPDT:
//LIST, SET and MAP.
//
//
public class D1_NonPrimitiveDT {
	//Declaration
	//List<Datatype> listName = new List<Datatype>().
	//
	//Set<Datatype> setName = new Set<Datatype>().
	//
    public static void learnList(){
        List<String> namesList = new List<String>();
        namesList.add('Surendra'); //0
        namesList.add('Kapil');
        namesList.add('Jagat');
        namesList.add('Surendra');//3
        System.debug('namesList: ' + namesList);
        //Indexing
        System.debug('namesList[1]: ' + namesList[1] + namesList.get(2));
    }
    
    public static void learnSet(){
        Set<String> names = new Set<String>();
        names.add('Surendra');
        names.add('Kapil');
        names.add('Jagat');
        names.add('Surendra');
        System.debug('namesList: ' + names);
    }
    
    
    public static void learnListAndSet(){
        List<String> studentRecordList = new List<String>();
        //studentRecordList.add('studentId,Name,ClassName');
        studentRecordList.add('1,Surendra,10');//CSV format data.
        studentRecordList.add('2,Rajesh,8');
        studentRecordList.add('3,Amit,9');
        studentRecordList.add('4,Kapil,8');
        studentRecordList.add('5,Rajesh,8');
        studentRecordList.add('6,Akshay,10');
        
        //Find unique names from the records.
        //Syntax
        /*
        for(Datatype loopVariableName :ListName){ //Datatype ==> Datatype of List.
            //TODO.
        }
        */
        Set<String> uniqueName = new Set<String>();
        for(String stdRecord :studentRecordList){
            System.debug('stdRecord: ' + stdRecord);
            //Use property of string.
            String[] data = stdRecord.split(',');
            System.debug('data: ' + data);
            String studentName = data[1];
            System.debug('studentName: ' + studentName);
            uniqueName.add(studentName);
        }
        System.debug('uniqueName: ' + uniqueName);
        
        
        //Find number of Student Stydying in class 10.
        Integer classCounter = 0;
        for(String stdRecord :studentRecordList){
            String[] data = stdRecord.split(',');
            String className = data[2];
            System.debug('className: ' + className);
            if(className == '10'){
                classCounter++;
            }
        }
        System.debug('Student Studying in class 10: ' + classCounter);
    }
    
    
    public static void learnListAndSet2(){
        List<String> parentsRecordList = new List<String>();
        parentsRecordList.add('1,Manoj,Ajmer');
        parentsRecordList.add('2,Sanjay,Jaipur');
        parentsRecordList.add('3,Arjun,Ajmer');
        
        List<String> studentRecordList = new List<String>();
        //studentRecordList.add('studentId,Name,ClassName,ParentId');
        studentRecordList.add('1,Surendra,10,1');//CSV format data.
        studentRecordList.add('2,Rajesh,8,1');
        studentRecordList.add('3,Amit,9,2');
        studentRecordList.add('4,Kapil,8,2');
        studentRecordList.add('5,Rajesh,8,2');
        studentRecordList.add('6,Akshay,10,3');
        
        //Extract names of the students whos parent name is Manoj.
        String manojId = '';
        for(String parentRec :parentsRecordList){
            String[] data = parentRec.split(',');
            if(data[1] == 'Manoj'){
                manojId = data[0];
                break;
            }
        }
        
        for(String stdRecord :studentRecordList){
            String[] data = stdRecord.split(',');
            if(data[3] == manojId){
                System.debug('Std with parent Name Manoj: ' + data[1]);
            }
        }
    }
}