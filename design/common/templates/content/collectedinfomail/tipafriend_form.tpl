{def $collection = cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}


{set-block scope=root variable=subject}{$object.data_map.collect_email_title.content|wash('xhtml')}{/set-block}
{set-block scope=root variable=email_sender}{$collection.data_map.form_email.data_text}{/set-block}{* champ obligatoire *}
{set-block scope=root variable=email_receiver}{$collection.data_map.form_friend_mail.data_text}{/set-block}{* champ obligatoire *}
{def $ezservervars = ezservervars()}
{def $url = concat('http://',$ezservervars['HTTP_HOST'],$object.main_node.url_alias|ezurl(no))}
{def $url_site = concat('http://',$ezservervars['HTTP_HOST'])}

<h3>Bonjour,</h3>

{$collection.data_map.form_first_name.data_text} {$collection.data_map.form_last_name.data_text} a le plaisir de vous conseiller ce site : {$url_site}<br />

{if $collection.data_map.form_message.has_content}
	{$collection.data_map.form_message.data_text}<br />
{/if}

Bonne visite. 
{undef}
