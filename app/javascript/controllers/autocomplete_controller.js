import { Controller } from "@hotwired/stimulus"
// import $ from 'jquery'
// import select2 from "select2"
import $ from 'jquery';
import 'select2';

// Connects to data-controller="autocomplete"
export default class extends Controller {
  static targets = ["select2"]
  // connect() {
  //   console.log(this.select2Target)
  //   this.update
  //   select2($)
  // }
  connect() {
    $(() => {
      $('.select2').select2();
    });
    }
}
