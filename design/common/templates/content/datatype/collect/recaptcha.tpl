{def $lang=ezini('Display','OverrideLang','recaptcha.ini')} 
{if is_set($ajax)|not}{def $ajax=false()}{/if}
{if $lang|eq('')}{set $lang=$attribute.language_code|extract_left(2)}{/if}
{if $ajax|not()}
	<script type="text/javascript">
		var RecaptchaTheme='{ezini('Display','Theme','recaptcha.ini')}';
		var RecaptchaLang='{$lang}';
		{literal}
		<!--
		var RecaptchaOptions = {
			theme: RecaptchaTheme,
			lang: RecaptchaLang
		};
		-->
		{/literal}
	</script>
{/if}
<div class="recatpchaCon" rel="{ezini('Display','Theme','recaptcha.ini')},{$lang}">
{if $ajax|not()}
	{recaptcha_get_html()}
{/if}
</div>