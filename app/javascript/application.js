// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"


import $ from 'jquery';
import 'select2';                       // globally assign select2 fn to $ element
// import 'select2/dist/css/select2.css';  // optional if you have css loader

$(() => {
  $('.select2').select2();
});
