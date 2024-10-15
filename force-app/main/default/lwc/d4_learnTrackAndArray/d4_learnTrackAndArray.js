import { LightningElement, track } from 'lwc';
export default class D4_learnTrackAndArray extends LightningElement {

    //array.
    @track firstNames = new Array();
    @track lastNames = ['Singh','Sharma','Bhati'];
    @track skillsList = ['Programming','Trouble Shooter', 'time Management'];

    @track contactObj = new Object();

    //Complex
    @track contactObjList = []; 

    connectedCallback() {
        //Declaration.
        let myObject = new Object();
        let item = {};

        this.contactObj.firstName = 'Sanjay';
        this.contactObj.lastName = 'Singh';
        this.contactObj.skills = this.skillsList;
        this.contactObj.skills.push('Testing');

        this.contactObjList.push(this.contactObj); //Array of Object.

        
        this.contactObj.firstName = 'Kapil';
        this.contactObj.lastName = 'Bhati';
        this.contactObj.skills = this.skillsList;

        this.contactObjList.push(this.contactObj);
    }
}