$(document).ready(
		function() {

			$(".jqzoom").imagezoom();

			$("#thumblist li a").click(
					function() {
						$(this).parents("li").addClass("tb-selected")
								.siblings().removeClass("tb-selected");
						$(".jqzoom").attr('src',
								$(this).find("img").attr("mid"));
						$(".jqzoom").attr('rel',
								$(this).find("img").attr("big"));
					});

		});

$('.spinnerExample').spinner({});