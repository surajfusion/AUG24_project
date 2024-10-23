import { LightningElement, wire, track } from 'lwc';

import getContactList from "@salesforce/apex/D9_UseWireInApex.getContactList";


const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' }
    
];

export default class Day9_wireInLwcComponent extends LightningElement {
    @track columns = columns;
    @track contactList = [];

    @wire(getContactList)
    wiredContactList({ error, data }) {
        if (data) {
            console.log('data', data, JSON.stringify(data));
            // handle result
            this.contactList = data;
        } else if (error) {
            // handle errors
            console.log('error', error);
        }
    }

}