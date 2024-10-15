import { LightningElement, track } from 'lwc';

export default class Fall23ThirdComponent extends LightningElement {
    // variable?

    //@track <variable name>

    @track firstName = 'Suraj';
    //HERE: firstname ==> Variable
    //and 'Suraj' is its value.

    //Method --> it contains a small piece of code that is designed to perform a specific task.
    handleClick() {
        this.firstName = 'Bekzat'; //we are addid 'this.' here, because we are using the variable again.
    }
}