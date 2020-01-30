<?php
/**
 * 2010-2020 Tuni-Soft
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * It is available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade this module to newer
 * versions in the future. If you wish to customize the module for your
 * needs please refer to
 * http://doc.prestashop.com/display/PS15/Overriding+default+behaviors
 * for more information.
 *
 * @author    Tunis-Soft
 * @copyright 2010-2020 Tuni-Soft
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */

namespace libs\ModuleFixer;

use Context;
use Hook;
use Module;
use Tools;

class ModuleFixer
{
    /** @var Module */
    private $module;
    /** @var Context */
    private $context;

    private $errors = array();

    public function __construct($module)
    {
        $this->context = Context::getContext();
        $this->module = $module;
    }

    public function display()
    {
        $this->postProcess();
        $module_hooks = $this->getModuleHooks();
        $unregistered_hooks = $this->getHooksList($module_hooks);
        $this->context->smarty->assign(array(
            'module'             => $this->module,
            'module_hooks'       => $module_hooks,
            'unregistered_hooks' => $unregistered_hooks,
        ));
        return $this->context->smarty->fetch(dirname(__FILE__) . '/ModuleFixer.tpl');
    }

    private function getModuleHooks()
    {
        if (!property_exists($this->module, 'hooks')) {
            $this->errors[] = 'Module class has no property hooks, it should be an array containing mandatory hooks';
            return false;
        }

        /** @noinspection PhpPossiblePolymorphicInvocationInspection */
        $module_hooks = $this->module->hooks;

        if (!is_array($module_hooks)) {
            $this->errors[] = 'property hooks should be an array containing mandatory hooks';
            return false;
        }

        return $module_hooks;
    }

    private function getHooksList($module_hooks)
    {
        $hooks_list = array();

        foreach ($module_hooks as $hook) {
            if (!Hook::isModuleRegisteredOnHook($this->module, $hook, $this->context->shop->id)) {
                $id_hook = (int)Hook::getIdByName($hook);
                $hooks_list[] = array(
                    'id_hook' => $id_hook,
                    'name'    => $hook,
                );
            }
        }

        return $hooks_list;
    }

    private function postProcess()
    {
        if (Tools::isSubmit('restore_hooks')) {
            $this->restoreHooks();
        }
    }

    private function restoreHooks()
    {
        $hooks = (array)Tools::getValue('hooks');
        if (is_array($hooks)) {
            $hook_names = array_keys($hooks);
            foreach ($hook_names as $hook_name) {
                if ($hook_name) {
                    $this->module->registerHook($hook_name);
                }
            }
        }
    }
}
