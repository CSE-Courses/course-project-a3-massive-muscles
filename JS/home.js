// Typing Animation for website
var options = {
  strings: ['Hi, my name is'],
  typeSpeed: 50,
  backSpeed: 30,
  cursorChar: '_',
  startDelay: 3000,
};
var typed = new Typed('.introTyping', options);


// Mobile hamburger button to display nav
var $hamburger = $(".hamburger");
$hamburger.on("click", function(e) {
    let $sidenav = $('.sidenav');
    if ($hamburger.hasClass("is-active")) {
        $sidenav.css("visibility","hidden");
    }
    else $sidenav.css("visibility","visible");
    // Toggle active class
    $hamburger.toggleClass("is-active");
});
// To make the hamburger work with no resizing bugs I 
// have to control the visibility of the nav with 
// javascript and no media queries.
$(window).resize(function() {
    if ($('body').width() > 700) {
        console.log($('body').width())
        $('.sidenav').css("visibility","visible");
    }  
    if ($('body').width() < 700) {
        $('.sidenav').css("visibility","hidden");
        if($hamburger.hasClass("is-active")) {
            $hamburger.toggleClass("is-active");
        }
    }
});