import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["notice"];

    connect() {
    this.hideAfterTimeout();
    }

    hideAfterTimeout() {
        setTimeout(() => {
        this.flashTarget.classList.add("hidden");
        }, 1000); // Adjust the time (in milliseconds) as needed
    }
}
