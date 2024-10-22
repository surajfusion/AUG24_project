/**
* @File Name : LWCApexController.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : October 22, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | October 22, 2024 |   | Initial Version
**/

public class LWCApexController {
	
	@AuraEnabled
	public static void insertContact(String firstName, String lastName){
		Contact contObj = new Contact();
		contObj.FirstName = firstName;
		contObj.LastName = lastName;
		INSERT contObj;
	}
}