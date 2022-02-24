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
import "@fortawesome/fontawesome-free/css/all"
import "pixeden-stroke-7-icon"
import Swiper from "swiper";
import "jquery-zoom";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function(){
    new Noty({
        type: $('#flash_message').attr('flash-type'),
        theme: 'bootstrap-v4',
        text: $('#flash_message').text()
    }).show();


// $(document).on('turbolinks:load', function(){
//     $('input.datepicker').data({behaviour: "datepicker"}).datepicker();
// });

    var zoomThumb = new Swiper('.zoom-thumbs', {
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
    });
    var zoomTop = new Swiper('.zoom-top', {
        spaceBetween: 0,
        slidesPerView: 1,
        thumbs: {
            swiper: zoomThumb
        }
    });

    $('.zoom-image-hover').zoom();
})
