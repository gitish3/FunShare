$(document).ready(function(){
	$(".menu li a").click(function(e){
	
		let target=$(this).attr("href");
		
		$("html,body").animate(
		{
			
			scrollTop: $(target).offset().top - $(window).height() /3
		},1000	
		);
	});
});


// $(target).offset().top