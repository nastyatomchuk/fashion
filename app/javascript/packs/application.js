// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import Noty from 'noty'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function(){

    // new Noty({
    //     type: 'success',
    //     theme: 'bootstrap-v4',
    //     text: 'Some notification text2'
    // }).show();

    new Noty({
        type: $('#flash_message').attr('flash_type'),
        theme: 'mint',
        text: $('#flash_message').text()
    }).show();
})
