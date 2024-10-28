import { LightningElement, api } from 'lwc';
export default class Day10_apiDecoratorComponent extends LightningElement {

    @api recordId;

    @api source;
}