{def $ajax = false()}
{if is_set($view_parameters.ajax)}
	{set $ajax = $view_parameters.ajax}
{/if}
<div class="content clearfix">
	<div class="titrepage">
		<h1>{attribute_view_gui attribute=$node.data_map.title}</h1>
	</div>
						
	<div class="box wsg clearfix">
		{attribute_view_gui attribute=$node.data_map.text}
		
		<div class="clearfix">
			<form method="post" id="tipafriend_form" class="ajax_information_collector formulaire grid_8" action={"content/action"|ezurl('no')} enctype="multipart/form-data">
		        {* validation *}
		        {include name=Validation uri='design:content/collectedinfo_validation.tpl' class='error' validation=$validation collection_attributes=$collection_attributes}
				
				<div class="ligne">
					{include my_attribute=$node.data_map.form_last_name uri="design:content/collector_form_field.tpl"}
				</div><!-- .ligne -->
				
				<div class="ligne">
					{include my_attribute=$node.data_map.form_first_name uri="design:content/collector_form_field.tpl"}
				</div><!-- .ligne -->
				
				<div class="ligne">		
					{include my_attribute=$node.data_map.form_email uri="design:content/collector_form_field.tpl"}
				</div><!-- .ligne -->
				
				<div class="ligne clearfix">		
					{include my_attribute=$node.data_map.form_message uri="design:content/collector_form_field.tpl"}
				</div><!-- .ligne -->
				
				<div class="ligne">		
					{include my_attribute=$node.data_map.form_friend_mail uri="design:content/collector_form_field.tpl"}
				</div><!-- .ligne -->
		
				<div class="ligne ligne_recaptcha">
					{attribute_view_gui attribute=$node.data_map.form_captcha ajax=$ajax}
				</div><!-- .ligne -->
				
		        <div class="fieldValid" id="SubmitButton">
		            <input name="ActionCollectInformation" id="formSubmit" value="Valider" type="submit"">
		            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
		            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
		            <input type="hidden" name="ViewMode" value="full" />
		        </div>
		    </form>
	    </div>
	    <p class="mentions obligatoire">(*) Les champs suivis d'un astérisque doivent être obligatoirement renseignés.</p>
	</div><!--box -->
</div>