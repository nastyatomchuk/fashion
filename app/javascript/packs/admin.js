import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "@fortawesome/fontawesome-free/js/all"
import "bootstrap"
import Noty from 'noty'


Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function(){
    new Noty({
        type: $('#flash_message').attr('flash-type'),
        theme: 'bootstrap-v4',
        text: $('#flash_message').text()
    }).show();
})

// $(document).on('turbolinks:load', function(){
//     $('input.datepicker').data({behaviour: "datepicker"}).datepicker();
// });
