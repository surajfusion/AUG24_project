import { LightningElement, track, api, wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";

const FIELDS = ["Account.Name", "Account.Phone", "Account.Rating", "Account.NumberOfEmployees"];

export default class Fall23UIRecordAPIComponent extends LightningElement {

    @api recordId; //It helps to capture the Record Id of the current record from Record.

    @track account;

    @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
    wiredContacts({ error, data }) {
        if (data) {
            console.log('data', data);
            this.account = data.fields;
        } else if (error) {
        }
    }

    get name(){
        return this.account.Name.value;
    }

    get phone(){
        return this.account.Phone.value;
    }
}