// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { animePlayer } from '../components/_anime'
import { animeDashboard } from '../components/_anime_dashboard'
import { dropDownBet } from '../components/_dropdown_bet'
import { showSliderValues } from '../components/_show_slider_values'
import { timeNowBetweenNextMatch } from '../components/_timeNowBetweenNextMatch'
import { scrollBar } from '../components/_scroll_bar'
import { animeCalendar } from '../components/_anime_calendar'
import { scrollIntoView } from '../components/_scrollIntoView'
import { hamburger } from '../components/_hamburger'
import { initChatroomCable } from '../channels/chatroom_channel'
import { ScrollBottomChatroom } from '../components/_scrollBottomChatrrom'


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initChatroomCable();
  ScrollBottomChatroom();
  scrollBar();
  timeNowBetweenNextMatch();
  animeCalendar();
  scrollIntoView();
  hamburger();
  animePlayer();
  animeDashboard();
  dropDownBet();
  showSliderValues();
});
