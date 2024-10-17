import { LightningElement, track } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class Day6_LDS_RE extends LightningElement {

    @track objectApiName = 'Contact';
    @track fields = [NAME_FIELD, EMAIL_FIELD];
}