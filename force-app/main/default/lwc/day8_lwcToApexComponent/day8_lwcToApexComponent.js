import { LightningElement, track } from 'lwc';
//import apexMethodName from "@salesforce/apex/namespace.classname.apexMethodReference";

import insertContact from "@salesforce/apex/LWCApexController.insertContact";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Day8_lwcToApexComponent extends LightningElement {

    @track firstName;
    @track lastName;

    handleFirstNameInput(event){
        this.firstName = event.target.value;
    }

    handleLastNameInput(event){
        this.lastName = event.target.value;
    }


    //Imperative Way:
    handleCreateContact(){
        console.log('LOG: 1', this.firstName);
        console.log('LOG: 2', this.lastName);
        
        let params = {
            "firstName" : this.firstName,
            "lastName" : this.lastName
        }
        insertContact(params)
        .then((result) => {
            // handle result
            console.log('LOG: 4' , result);
            this.showToast('SUCCESS', 'Record Created Successfully', 'success');
        })
        .catch((error) => {
            // handle errors
            console.log('LOG: 3' , error);
            this.showToast('ERROR', error, 'error');
        });
    }


    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant	: variant
        });
        this.dispatchEvent(event);
    }
}