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
  <h3><i class="icon icon-credit-card"></i> {$module->displayName}</h3>

  <div class="well">
    <h4>List of hooks</h4>
    {if count($hooks)}
      <p>You can attach the module again to the following hooks</p>
      <form action="" method="post">
        <ul>
          {foreach $hooks as $hook}
            <li>
              <label for="id_hook_{$hook.id_hook}">
                <input id="id_hook_{$hook.id_hook}" name="id_hook[]" type="checkbox"> {$hook.name}
              </label>
            </li>
          {/foreach}
        </ul>
        <button type="submit" class="btn btn-primary">Restore selected hooks</button>
      </form>
    {else}
      <p>The module is already hooked to all necessary hooks</p>
    {/if}
  </div>
</div>
