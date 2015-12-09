/**
 * 
 */
var effect = {
		base : function() {
			$('<div id="foo">').appendTo($('.box').empty());
			$('#foo').html(
			'<div id="block">Hello!</div>'		
			);
		},
		animate : function() {
			  $( "#block" ).animate({
				    width: "70%",
				    opacity: 0.4,
				    marginLeft: "0.6in",
				    fontSize: "3em",
				    borderWidth: "10px"
				  }, 1500 );
		}
};