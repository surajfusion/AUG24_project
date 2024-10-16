import { LightningElement, track } from 'lwc';

export default class Day5_trackAndObject extends LightningElement {

    @track contactObj = {};
    @track contactList = [];
    @track totalSalary = 0;

    @track lastNames = ['Singh','Sharma','Bhati'];

    connectedCallback() {
        //Key-Value Pair.
        //JSON format.
        this.contactObj = {
            "firstName" : "Kapil",
            "lastName" : "Singh",
            "phone" : "9812312312",
            "salary" : 25000,
            "isEmployed" : true,
            "loanEMI": 531.56,
            "skills" : ["Programming", "Apex Triggers"],
            "account" :{
                "name" : "ABC Contructions",
                "phone" : "901840133"
            }
        };

        this.contactList.push({
            "firstName" : "Kapil",
            "lastName" : "Singh",
            "phone" : "9812312312",
            "salary" : 25000,
            "isEmployed" : true,
            "loanEMI": 531.56
        });

        //Array of Object.
        this.contactList = [{
            "firstName" : "Kapil",
            "lastName" : "Singh",
            "phone" : "9812312312",
            "salary" : 25000,
            "isEmployed" : true,
            "loanEMI": 531.56,
            "skills" : ["Programming", "Apex Triggers"]
        },
        {
            "firstName" : "Sanjay",
            "lastName" : "K",
            "phone" : "900012304",
            "salary" : 45000,
            "isEmployed" : true,
            "loanEMI": 1031.56,
            "skills" : ["LWC", "Apex Triggers"]
        }];
    }


    handleLoopOnArray(){
        for(let i = 0; i < this.contactList.length; i++){
            //console.log('Stringify: ', JSON.stringify(this.contactList[i])); //JSON.stringify ==> Convert JSON to String.

            //console.log('Pased Strigify: ', JSON.parse(JSON.stringify(this.contactList[i]))); // JSON.parse ==> String to JSON.

            console.log('Name:', this.contactList[i].firstName);
            console.log('Salary:', this.contactList[i].salary);

            this.totalSalary += this.contactList[i].salary;
        }
    }
}