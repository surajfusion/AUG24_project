import { LightningElement, track } from 'lwc';
import getResponseFromAPI from "@salesforce/apex/IntegrationExampleController.getResponseFromAPI";

const columns = [
    { label: 'Name', fieldName: 'name' },
    { label: 'Region', fieldName: 'region' },
    { label: 'City', fieldName: 'city' },
    { label: 'Country', fieldName: 'country' },
    { label: 'Timezone', fieldName: 'timezone'}
];
    
export default class IntegrationExampleComponent extends LightningElement {

    @track data = [];
    @track columns = columns;
    @track airportName;

    handleInputAirportName(event){
        this.airportName = event.target.value;
    }

    handleClick(){
        getResponseFromAPI({airportName: this.airportName})
      .then((result) => {
        console.log('result', result);
        this.data = JSON.parse(result);
      })
      .catch((error) => {
        console.error('error', error);
      });
    }
}