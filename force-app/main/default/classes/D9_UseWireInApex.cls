/**
* @File Name : D9_UseWireInApex.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : October 23, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | October 23, 2024 |   | Initial Version
**/

public class D9_UseWireInApex {
	
	@AuraEnabled(cacheable = true)
	Public static List<contact> getContactList(){
		List<Contact> contactList = [
			SELECT Id, FirstName, LastName, Email, Phone
			FROM Contact
			LIMIT 20
		];

		return contactList;
	}
}