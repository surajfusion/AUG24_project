import { LightningElement, track, wire, api } from 'lwc';

import getContactList from '@salesforce/apex/Fall23ConfigurationInputAPIController.getContactList';
import getLeadList from '@salesforce/apex/Fall23ConfigurationInputAPIController.getLeadList';


const columns = [
    { label: 'First Name', fieldName: 'FirstName' },
    { label: 'Last Name', fieldName: 'LastName'},
    { label: 'Email', fieldName: 'Email', type: 'email' }
];

export default class Fall23ConfigurationInputAPI extends LightningElement {
    @api label;
    @api showContactList;

    @track columns = columns;
    @track contactList;
    @track leadList;

    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            this.contactList = data;
        } else if (error) {
        }
    }


    @wire(getLeadList)
    wiredLeads({ error, data }) {
        if (data) {
            this.leadList = data;
        } else if (error) {
        }
    }
}