Pour l'installation

TPL :

	{set $form1 = fetch('content','node',hash('node_id', ezini('NodeSettings','Form1', 'content.ini')))}
	<a id="ajax_form_1" href={$form1.url_alias|ezurl()} rel="id:id_type" >Form 1</a>
	
	ex : <a id="ajax_form_1" href={$form1.url_alias|ezurl()} rel="form1_remote_object_id:remote_object_id" >Form 1</a>
	ex : <a id="ajax_form_1" href={$form1.url_alias|ezurl()} rel="form1_node_id:node_id" >Form 1</a>
	ex : <a id="ajax_form_1" href={$form1.url_alias|ezurl()} rel="form1_node_id" >Form 1</a>
	
	## supported id type
	## - remote_object_id
	## - node_id (default)


JAVASCIPT :
	Ajouter si recaptcha : <script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
	
	$('#ajax_form_1').ajaxInformationCollector({
		recaptchaKey : "clé si utilisation du recaptcha",
		uniform: true|false
	});