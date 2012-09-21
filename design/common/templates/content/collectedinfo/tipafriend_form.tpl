{def $collection = cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}
<div class="content clearfix">	
	<div class="titrepage">
		<h1>{$node.name|wash('xhtml')}</h1>
	</div>
						
	<div class="box wsg clearfix">
		<h4>{'Les données suivantes nous ont été transmises'|i18n('client')} :</h4>
					
		{foreach $collection.attributes as $key=>$Attribute}
		<p><strong>{$Attribute.contentclass_attribute_name|wash} :</strong>
		{attribute_result_gui view=info attribute=$Attribute mail=true() html='no_url'}
		{*show_fullpath is to allow the full path of the collected info to be shown in the admin mail sent WITHOUT it necessarily being shown to the user on the front end.*}
		</p>
		{/foreach}
	</div>
	
	{if ne($collection.data_map.form_email.data_text,"")}
		{send_email_user(
			$collection.data_map.form_email.data_text|wash('xhtml'),
			$object.data_map.collect_email_title.content|wash('xhtml'),
			$object.data_map.collect_email_text.data_text
		)}
	{/if}
</div>
{undef}
