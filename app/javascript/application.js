// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "trix"
import "@rails/actiontext"


// import "@hotwired/turbo-rails";
// import * as ActiveStorage from "@rails/activestorage";
// import "trix";
// import "@rails/actiontext";
// import "./controllers";

// Rails.start();
// ActiveStorage.start();



// import "./custom/menu"
// import "./custom/nav_links"


//  import { Application } from "stimulus";
// import { definitionsFromContext } from "stimulus/webpack-helpers";

// const application = Application.start();
// const context = require.context("controllers", true, /_controller\.js$/);
// application.load(definitionsFromContext(context));


//  import { Turbo } from "@hotwired/turbo-rails";

// Turbo.StreamActions.redirect = function () {
//     Turbo.visit(this.target);
// };

// // or using event listener

// document.addEventListener("turbo:before-stream-render", (event) => {
//     const fallbackToDefaultActions = event.detail.render;
//     event.detail.render = function (streamElement) {
//         if (streamElement.action == "redirect") {
//             Turbo.visit(streamElement.target);
//         } else {
//             fallbackToDefaultActions(streamElement);
//         }
//     };
// });