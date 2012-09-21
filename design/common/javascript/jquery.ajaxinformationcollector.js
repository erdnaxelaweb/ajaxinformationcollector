(function($){
    $.fn.ajaxInformationCollector = function(options) {
 		if(this.length == 0)
 			return this;
 		
 		
 		var rel = $(this).attr("rel").split(":");
 		var id = rel[0];
 		var id_type = (rel.length > 1) ? rel[1] : "node_id";
 		
 		var settings = {
 			recaptchaKey : "",
 			uniform : false
 		};
 		
 		$.extend(settings, options);
 		
 		$(this).click(function(e){
 			$.ez( 'ezjscinformationcollector::getForm', {id:id, id_type:id_type}, function( data ){ 
 				addForm(data);
 			});
 			e.preventDefault();
 		});

 		function addForm(data){
 			$.colorbox({html:data.content.content});
			
 			$("#cboxContent .ajax_information_collector").unbind('submit').submit(function(e){
 				var post = $(this).serialize();
 				$.ez( 'ezjscinformationcollector::checkForm', post, function( data ){ 
 					addForm(data);
 				});
 				e.preventDefault();
 			});
 			
 			if(settings.recaptchaKey != ""){
 				$('#cboxContent .recatpchaCon').each(function(){
					var options = $(this).attr('rel').split(',');
					var elemId = 'recaptcha_'+randomString(8);
					$(this).attr('id',elemId);
					var RecaptchaOptions = { theme : options[0], lang : options[1] };
				 	Recaptcha.create(settings.recaptchaKey, elemId, RecaptchaOptions);
				});
	 		}
 			
 			if(settings.uniform){
 				$("#cboxContent select, #cboxContent input:text, #cboxContent input:password, #cboxContent input:button, #cboxContent input:submit, #cboxContent textarea, #cboxContent input:checkbox, #cboxContent input:radio, #cboxContent input:file").uniform();
 			}
 		}
 		
 		function randomString(length) {
 		    var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'.split('');

 		    if (! length) {
 		        length = Math.floor(Math.random() * chars.length);
 		    }

 		    var str = '';
 		    for (var i = 0; i < length; i++) {
 		        str += chars[Math.floor(Math.random() * chars.length)];
 		    }
 		    return str;
 		}
    }	
})(jQuery);