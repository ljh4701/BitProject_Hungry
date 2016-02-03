$(document).ready(function() {
	$('.carousel').carousel({
		  interval: 10000,
		  pause: "false"
		});
	
	var $item = $('.carousel .item');
	var $wHeight = $(window).height() - $(index_navbar).height() - 2;

	$item.height($wHeight); 
	$item.addClass('full-screen');

	$('.carousel img').each(function() {
	  var $src = $(this).attr('src');
	  var $color = $(this).attr('data-color');
	  $(this).parent().css({
	    'background-image' : 'url(' + $src + ')',
	    'background-color' : $color
	  });
	  $(this).remove();
	});

	$(window).on('resize', function (){
	  $wHeight = $(window).height();
	  $item.height($wHeight);
	});
});