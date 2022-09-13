import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wishlist-button"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    // console.log(this.buttonTarget)
  }
  change(event) {
    const button = this.buttonTarget
    setTimeout(function() {
    event["path"][0].classList.add("wishlist-btn-pink")
    event["path"][0].classList.remove("wishlist-btn")
    button.setAttribute("disabled", "")
  }, 200)

    console.log(event["path"][0]["classList"])
  }
}
