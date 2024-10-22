import { LightningElement, track } from 'lwc';


export default class Day7_getValueFromUser extends LightningElement {

    @track inputFromUser;

    @track outputToHTML = 'Output: ';


    handleOnChange(event){
        console.log('ON CHANGE LOG: ' , 'You are typing in Input Box.');
        
        //Capturing Event.
        console.log('On Change Event Capture' , event.target.value, JSON.stringify(event.target));
        this.inputFromUser = event.target.value;//x

    }


    handleOnBlur(event){
        console.log('ON BLUR LOG: ' , 'You Clicked outside of the Input Box.');
        //this.outputToHTML = this.outputToHTML + this.inputFromUser;

        this.outputToHTML += this.inputFromUser; //Output + x, //Output x, //Output //Output: x
    }
}