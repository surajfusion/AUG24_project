import { LightningElement, track, wire } from 'lwc';
import searchContactList from "@salesforce/apex/SOQLExampleController.searchContactList";

const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
];
//IMPLEMENT SEARCHING
export default class Day9_wireApplication extends LightningElement {

    @track searchStr = '';
    @track columns = columns;
    @track contactList = [];


    @wire(searchContactList, {searchStr: "$searchStr"})
    wiredSearchContactList({ error, data }) {
        if (data) {
            // handle result
            console.log('data', data, JSON.stringify(data));
            this.contactList = data;
        } else if (error) {
            // handle errors
            console.log('error', error);
        }
    }


    handleInputChange(event){
        this.searchStr = event.target.value;
    }
}