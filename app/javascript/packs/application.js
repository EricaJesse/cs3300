// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../stylesheets/application" // This is your stylesheet file where you will write all the styling code.

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', () => {
    const darkModeToggle = document.getElementById('dark-mode-toggle');
    const body = document.body;
  
    darkModeToggle.addEventListener('click', () => {
      body.classList.toggle('dark-mode');
    });
  });
  
  document.addEventListener("turbolinks:load", function() {
    let addCharacter = document.getElementById("add_character");
    let characterFields = document.querySelector(".nested-fields");
  
    addCharacter.addEventListener("click", function(e) {
      e.preventDefault();
      let newFields = characterFields.cloneNode(true);
      let form = document.querySelector("form");
      form.insertBefore(newFields, addCharacter);
    });
  
    document.addEventListener("click", function(e) {
      if (e.target && e.target.classList.contains("remove_record")) {
        e.preventDefault();
        e.target.parentElement.remove();
      }
    });
  });
  