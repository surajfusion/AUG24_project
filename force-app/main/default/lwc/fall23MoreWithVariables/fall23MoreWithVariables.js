import { LightningElement, track } from 'lwc';

export default class Fall23MoreWithVariables extends LightningElement {
    @track firstName = 'Suraj';
    @track lastName = 'Singh';
    @track phone;

    @track firstName2 = 'Joe';
    @track lastName2 = 'Bell';
    @track phone2 = '23232323';

    //Array --> List of values.
    //@track firstNames = []; //this square bracktes are know as array, 
    //it makes variable to store 
    //multiple information.

    //@track firstNames = [];
    @track firstNames = ["Suraj", "Bekzat", "Gulina", "Joe", "Geogi"];


    //OBJECT --> works on Concept of Key and Value Pairs.

    //@track record1 = {}; //'{}' --> means it is an object.
    @track record1 = {
        firstName : 'Suraj',
        lastName : 'Singh',
        phone: '8867904534',
        email: 'test001@gmail.com'
    };

    @track record2 = {
        firstName : 'Joe',
        lastName : 'Bell',
        phone: '8860004534',
        email: 'test001@gmail.com'
    };

    @track records = [
        {
            firstName : 'Suraj',
            lastName : 'Singh',
            phone: '8867904534',
            email: 'test001@gmail.com'
        },{
            firstName : 'Joe',
            lastName : 'Bell',
            phone: '8860004534',
            email: 'test001@gmail.com'
        },{
            firstName : 'Bekzat',
            lastName : 'Bell',
            phone: '9990004534',
            email: 'test001@gmail.com'
        }
    ];
 }