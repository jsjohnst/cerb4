<label><input type="checkbox" name="contact_require_login" value="1" {if $contact_require_login}checked="checked"{/if}> {$translate->_('portal.sc.cfg.open_ticket.require_login')}</label><br>
<label><input type="checkbox" name="allow_subjects" value="1" {if $allow_subjects}checked="checked"{/if}> {$translate->_('portal.sc.cfg.open_ticket.allow_custom_subjects')}</label><br>
<br>

<b>{$translate->_('portal.cfg.captcha')}</b> {$translate->_('portal.cfg.captcha_hint')}<br>
<label><input type="radio" name="captcha_enabled" value="1" {if $captcha_enabled}checked="checked"{/if}> {$translate->_('portal.cfg.enabled')}</label>
<label><input type="radio" name="captcha_enabled" value="0" {if !$captcha_enabled}checked="checked"{/if}> {$translate->_('portal.cfg.disabled')}</label>
<br>
<br>

{foreach from=$dispatch item=params key=reason}
<div class="subtle" style="margin-bottom:10px;">
	<h2 style="display:inline;">{$reason}</h2>&nbsp;
	<a href="#add_situation" onclick="genericAjaxGet('add_situation','c=config&a=handleTabAction&tab=usermeet.config.tab.communities&action=getContactSituation&reason={$reason|md5}&portal={$instance->code}');">{$translate->_('common.edit')|lower} </a>
	<br>
	<b>{$translate->_('portal.cfg.send_to')}</b> {$params.to}<br>
	{if is_array($params.followups)}
	{foreach from=$params.followups key=question item=field_id}
	<b>{$translate->_('portal.cfg.ask')}</b> {$question|escape} 
	{if $field_id}
		{assign var=field value=$ticket_fields.$field_id}
		{assign var=field_group_id value=$field->group_id}
		({if isset($groups.$field_group_id)}{$groups.$field_group_id->name}: {/if}{$field->name|escape})
	{/if}
	<br>
	{/foreach}
	<label><input type="checkbox" name="delete_situations[]" value="{$reason|md5}"> {$translate->_('portal.cfg.delete_situation')}</label>
	{/if}
</div>
{/foreach}

<div style="margin-left:10px;margin-bottom:10px;">
	<a href="#add_situation" onclick="genericAjaxGet('add_situation','c=config&a=handleTabAction&tab=usermeet.config.tab.communities&action=getContactSituation&reason=&portal={$instance->code}');">{$translate->_('portal.cfg.add_new_situation')} </a>
</div>

<div class="subtle2" id="add_situation">
{include file="$config_path/portal/sc/config/module/contact/add_situation.tpl"}
</div>
