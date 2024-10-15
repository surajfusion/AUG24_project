import { LightningElement, track } from 'lwc';

export default class Fall23InputComponent extends LightningElement {

    @track firstName = 'Suraj';
    @track lastName = 'Singh';
    @track phone;

    handleFirstNameChange(event){
        this.firstName = event.target.value; //When we have to capture a value from the input box.
    }

    handleLastNameChange(event){
        this.lastName = event.target.value;
    }

    handlePhoneChange(event){
        this.phone = event.target.value;
    }
}