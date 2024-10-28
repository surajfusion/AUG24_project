import { LightningElement, api } from 'lwc';
export default class Day101_childComponent extends LightningElement {

    @api firstName = 'default Value';
    @api lastName;

    handleChange(){
        this.firstName = 'Change on Click';
    }

}