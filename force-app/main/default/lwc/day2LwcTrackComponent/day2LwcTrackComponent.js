import { LightningElement, track } from 'lwc';

export default class Day2LwcTrackComponent extends LightningElement {

    @track titleStr = 'Name Card';
    @track footerLabel = 'My Footer Button';

    @track firstName = 'Sumit';

    connectedCallback() {
        this.firstName = 'Yashwant'; //use this keyword, to reinitialize value in a variable.
    }


    handleClick(){
        //alert('Clicked on the button');
        this.firstName = 'Gajani';
    }
}