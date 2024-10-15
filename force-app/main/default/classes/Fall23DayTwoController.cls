public class Fall23DayTwoController {

    /*
     *  Methods/Functions in Apex: 
        These are small pieces of code that are designed to perform a specific task.
        And when we execute all different functions in a specific manner 
		then our program will complete.
	*/
    
    //SYNTAX
    /*
     * Public/Private/Global
     <Access-Modifier> <return-Type> method/FunctionName(){ //returnType === Datatype
     	//Logical Code will be here.		
	 }
	*/
    
    /*
     * Example: Design a programm that will caculate the total tax amount that a company will
     * deduct on each month for an employee for the given tax slab.
     * If Annual Salary if
     * 	#1: < 60K -> 5% Tax
     * 	#2: 60K - 80K -> 10% Tax
     * 	#3: <80K -> 15% Tax
     */
	
    // Get the Salary
    // Caculate the Total Annual Salary.
    // Caculate the Tax Amount based on the salary.
    // Caculate the deducting the amount for each month.
    // 
    
    
    
    Decimal monthlySalary = 7000;
    Decimal annualSalary;
    Decimal taxAmount;
    Decimal absoluteMonthlyAmount;
    
    public Fall23DayTwoController(){
        annualSalary = getAnnualSalary();
        taxAmount = caculateTaxBasedOnSalary();
        absoluteMonthlyAmount = caculateDeductionOnEachMonth();
        
        System.debug('SALARY: ' + absoluteMonthlyAmount);
    }
    
    Public Decimal getAnnualSalary(){
        Decimal totalAnnualSalary = monthlySalary * 12;
        return totalAnnualSalary;
    }
    
    public Decimal caculateTaxBasedOnSalary(){
        Decimal basictaxAmount = 0;
        Decimal phaseTwoTaxAmount = 0;
        Decimal phaseThreeTaxAmount = 0;
        Decimal totalTaxAmount = 0;
        
        if(annualSalary <= 60000){
            basictaxAmount = annualSalary * 0.05;
            System.debug('BASIC TAX AMOUNT:' + basictaxAmount);
        }
        
        if(annualSalary > 60000 && annualSalary <= 80000){
			basictaxAmount = 60000 * 0.05; //Tax on 60K amount.
            
            Decimal phaseTwoAmount = annualSalary - 60000;
            phaseTwoTaxAmount = phaseTwoAmount * 0.10;
            
            System.debug('BASIC TAX AMOUNT:' + basictaxAmount);
            System.debug('PHASE TWO TAX AMOUNT:' + phaseTwoTaxAmount);
        }
        
        if(annualSalary > 80000){
            basictaxAmount = 60000 * 0.05; //Tax on 60K amount.
            phaseTwoTaxAmount = (80000 - 60000) * 0.10; //Tax on 60-80K Amount.
            
            Decimal phasethreeAmount = annualSalary - 80000;
            phaseThreeTaxAmount = phasethreeAmount * 0.15;
            
            System.debug('BASIC TAX AMOUNT:' + basictaxAmount);
            System.debug('PHASE TWO TAX AMOUNT:' + phaseTwoTaxAmount);
            System.debug('PHASE THREE TAX AMOUNT:' + phaseThreeTaxAmount);
        }
        
        totalTaxAmount = basictaxAmount + phaseTwoTaxAmount + phaseThreeTaxAmount;
        
        return totalTaxAmount;
    }
    
    public Decimal caculateDeductionOnEachMonth(){
        Decimal deductionAmount = taxAmount/12;
        Decimal deductedAmount = monthlySalary - deductionAmount;
        System.debug('DEDUCTING AMOUNT:' + deductionAmount);
        return deductedAmount;
    }
}