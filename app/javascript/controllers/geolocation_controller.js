import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  connect() {
    window.navigator.geolocation.getCurrentPosition((position) => {
      console.log(position);
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      const csrfToken = document.querySelector("[name='csrf-token']").content;
      console.log(csrfToken);

      const params = {
        coords: {
          lat: lat,
          lng: lng
        }
      }

    fetch(`/geolocate`,
      {
        method: 'POST',
        headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken, "Content-Type": "application/json"},
        body: JSON.stringify(params)
      })
    })
  }
}
