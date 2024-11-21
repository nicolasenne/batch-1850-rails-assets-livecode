import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["button", "form"];

  display(event) {
    console.log("display");
    this.buttonTarget.classList.add("d-none");
    this.formTarget.classList.remove("d-none");
  }
}
