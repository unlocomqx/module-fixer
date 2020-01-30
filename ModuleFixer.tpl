{*
* 2007-2020 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2020 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="panel">
  <h3><i class="icon icon-credit-card"></i> {$module->displayName|escape:'htmlall':'UTF-8'}</h3>

  <div class="well">
    <h4>{l s='List of hooks' mod='productdesigner'}</h4>
    {if count($unregistered_hooks)}
      <p>{l s='You can attach the module again to the following hooks' mod='productdesigner'}</p>
      <form action="" method="post">
        <ul>
          {foreach $unregistered_hooks as $hook}
            <li>
              <label for="id_hook_{$hook.id_hook|intval}">
                <input id="id_hook_{$hook.id_hook|intval}" name="hooks[{$hook.name|escape:'htmlall':'UTF-8'}]" type="checkbox"> {$hook.name|escape:'htmlall':'UTF-8'}
              </label>
            </li>
          {/foreach}
        </ul>
        <button type="submit" name="restore_hooks" class="btn btn-primary">{l s='Restore selected hooks' mod='productdesigner'}</button>
      </form>
    {else}
      <div class="alert alert-success">{l s='The module is hooked to all necessary hooks' mod='productdesigner'}</div>
      <ul style="color: #72c279; list-style: none;">
      {foreach $module_hooks as $module_hook}
        <li><strong><i class="icon-check-circle"></i> {$module_hook|escape:'htmlall':'UTF-8'}</strong></li>
      {/foreach}
      </ul>
    {/if}
  </div>

  <div class="panel-footer">
    <a href="{$module_link|escape:'htmlall':'UTF-8'}" class="btn btn-default pull-left"><i class="process-icon-back"></i> {l s='Back' mod='productdesigner'}</a>
  </div>
</div>
