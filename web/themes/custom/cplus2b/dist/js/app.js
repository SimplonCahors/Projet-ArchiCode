(function ($) { // closure
  'use strict';

  Drupal.behaviors.archiCode = {
    attach: function (context, settings) {


        // RESPONSIVE MENU
        var btnMenu = document.getElementById('burger-menu');
        var leMenu = document.getElementById('leMenu');
        var btnClose = document.getElementById('close-menu');

        if(btnMenu) {
          btnMenu.addEventListener("click", openMenu);
        }
        if(btnClose) {
          btnClose.addEventListener("click", closeMenu);
        }

        function openMenu() {
          // leMenu.style.display = "flex";
          leMenu.classList.add('moved');
        }

        function closeMenu() {
          // leMenu.style.display = "none";
          leMenu.classList.remove('moved');
        }

        //PAGE D'ACCEUIL
        var imgArchi = document.getElementById('logohome');
        var welcome = document.getElementById('welcome');


        if(imgArchi) {
          imgArchi.addEventListener("click", closeLogo);
        }

        function initLogo() {
          welcome.parentNode.style.overflow = 'hidden';
          if (sessionStorage.getItem("logo")){
            welcome.parentNode.style.overflow = 'visible';
            welcome.classList.add('hidden');
          }
        }

        function closeLogo() {
          welcome.classList.add('fadeOut');
          welcome.parentNode.style.overflow = 'visible';
          sessionStorage.setItem('logo', 'load');
          setTimeout(function(){ welcome.classList.add('hidden'); }, 2000);
        }

        function autoClose() {
          setTimeout(function(){welcome.classList.add('fadeOut');
            welcome.parentNode.style.overflow = 'visible';}, 2000);
          setTimeout(function(){ welcome.classList.add('hidden');
          sessionStorage.setItem('logo', 'load'); }, 4000);
        }

        if(welcome) {
          initLogo();
          autoClose();
        }

    }
  };


} (jQuery));
