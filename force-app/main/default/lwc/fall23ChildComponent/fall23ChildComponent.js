import { LightningElement, track, api } from 'lwc';

export default class Fall23ChildComponent extends LightningElement {

    @api valueFromApi = 'Dsiplaying Value from API';
    @track valueFromTrack = 'Display Value from Track';

    @track isLike = false;

    @api methodHandleByParentToChild(){
        this.valueFromTrack = 'I changed from Parent Component';
    }

    handleClick(){
        this.valueFromTrack = 'Button Hits, and I changed.';
    }


    handleLikeDislikeClick(event){
        // Prevents the anchor element from navigating to a URL.
        event.preventDefault();

        this.isLike = !this.isLike;

        console.log('this.isLike', this.isLike);

        // Creates the event with the contact ID data.
        const selectedEvent = new CustomEvent("selected", { detail: this.isLike});

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }
}