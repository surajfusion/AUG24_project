import { LightningElement, track } from 'lwc';
export default class Day3TrackDecorator extends LightningElement {

    @track firstName = 'Sumit';
    @track lastName = 'Sharma';

    @track showLastName = false;

    //array.
    @track firstNames = new Array();
    @track lastNames = ['Singh','Sharma','Bhati'];

    @track names = [];

    @track firstLastNamesArr = [];




    connectedCallback() {
        this.firstName = 'Yashwant';

        this.firstNames.push('Sanjay');
        this.firstNames.push('Kapil');
        this.firstNames.push('kap');

        this.checkArrayBehaviour();
        this.mergeArrayToSingle();
    }

    checkArrayBehaviour(){
        
        for(let i = 0; i < this.firstNames.length; i++){
            console.log(this.firstNames[i]);
            console.log(this.lastNames[i]);

            this.names.push(this.firstNames[i] + ' ' + this.lastNames[i]);
        }

        this.names.forEach((name) => {
            console.log(name);
        });
    }

    mergeArrayToSingle(){
        for(var i = 0; i < this.firstNames.length; i++){
            console.log(this.firstNames[i]);
            console.log(this.lastNames[i]);

            let item = new Object();
            item.firstName = this.firstNames[i];
            item.lastName = this.lastNames[i];
            
            this.firstLastNamesArr.push(item);
        }
    }


    toggelLastName(){
        
        //Noob
        /*
        if(this.showLastName){
            this.showLastName = false;
        }else{
            this.showLastName = true;    
        }
        */
        this.showLastName = !this.showLastName;
    }


}