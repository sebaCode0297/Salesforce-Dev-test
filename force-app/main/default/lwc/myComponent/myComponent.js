import { LightningElement } from 'lwc';

export default class MyComponent extends LightningElement {
    nombre = 'Campamento salesforce';
    ubicación = 'Santiago';
    aventurero = [
        {
            id : '1',
            Name : 'Seba Albornoz',
        },
        {
            id : '2',
            Name : 'Maria Jose',
        }
    ];
}