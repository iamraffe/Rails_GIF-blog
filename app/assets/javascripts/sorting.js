$(document).on('change', "#sort", function(){

  var sort = $(this).val();

  $.ajax({
  	type: "get",
  	url: "/",
  	data: {sort: sort},
  	dataType: "json",
  	success: function(response){
  		console.log("body");
  		$("body").html("")
  	},
  	error: function(error){
  		console.log(error)
  	}
  })
})
