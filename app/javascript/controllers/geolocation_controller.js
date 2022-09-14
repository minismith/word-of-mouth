import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  connect() {
    window.navigator.geolocation.getCurrentPosition((position) => {
      console.log(position);
      var lat = position.coords.latitude;
      var lon = position.coords.longitude;
      this.element.dataset.latitude = position.coords.latitude;
      this.element.dataset.longitude = position.coords.longitude;
    })
  }
}
