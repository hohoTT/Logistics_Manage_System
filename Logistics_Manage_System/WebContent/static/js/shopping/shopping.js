$(function () {
    // Slideshow 1
    $("#slider").responsiveSlides({
    	speed: 100, 
    	maxwidth: 2500
    });
});

$(function() {
	$('.gallery a').lightBox();
});
function over(img, imgsrc) {
	img.src = imgsrc;
}
function out(img, imgsrc) {
	img.src = imgsrc;
}

