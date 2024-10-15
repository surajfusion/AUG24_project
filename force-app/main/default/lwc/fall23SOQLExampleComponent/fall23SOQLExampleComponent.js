import { LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/SOQLExampleController.getContactList';

const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone' }
];

export default class Fall23SOQLExampleComponent extends LightningElement {

    @track contacts = [];
    @track columns = columns;

    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            //TODO Send this data to HTML file to display.
            this.contacts = data;
        } else if (error) {

        }
    }
}