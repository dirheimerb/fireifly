-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 25, 2022 at 02:29 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fireifly_ftoo903`
--

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_accounts`
--

CREATE TABLE `frm1dnc_accounts` (
  `account_id` mediumint(8) UNSIGNED NOT NULL,
  `account_type` enum('admin','client') NOT NULL DEFAULT 'client',
  `account_status` enum('active','disabled','pending') NOT NULL DEFAULT 'disabled',
  `last_logged_in` datetime DEFAULT NULL,
  `ui_language` varchar(50) NOT NULL DEFAULT 'en_us',
  `timezone_offset` varchar(4) DEFAULT NULL,
  `sessions_timeout` varchar(10) NOT NULL DEFAULT '30',
  `date_format` varchar(50) NOT NULL DEFAULT 'M jS, g:i A',
  `login_page` varchar(50) NOT NULL DEFAULT 'client_forms',
  `logout_url` varchar(255) DEFAULT NULL,
  `theme` varchar(50) NOT NULL DEFAULT 'default',
  `swatch` varchar(255) NOT NULL,
  `menu_id` mediumint(8) UNSIGNED NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `temp_reset_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_accounts`
--

INSERT INTO `frm1dnc_accounts` (`account_id`, `account_type`, `account_status`, `last_logged_in`, `ui_language`, `timezone_offset`, `sessions_timeout`, `date_format`, `login_page`, `logout_url`, `theme`, `swatch`, `menu_id`, `first_name`, `last_name`, `email`, `username`, `password`, `temp_reset_password`) VALUES
(1, 'admin', 'active', NULL, 'en_us', '0', '30', 'M jS, g:i A', 'admin_forms', 'https://fireifly.com/api', 'default', 'green', 1, 'System', 'Administrator', 'admin@fireifly.com', 'admin', '1a043695d5896c40c091a268aab1e42f', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_account_settings`
--

CREATE TABLE `frm1dnc_account_settings` (
  `account_id` mediumint(8) UNSIGNED NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_client_forms`
--

CREATE TABLE `frm1dnc_client_forms` (
  `account_id` mediumint(8) UNSIGNED NOT NULL,
  `form_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_client_views`
--

CREATE TABLE `frm1dnc_client_views` (
  `account_id` mediumint(8) UNSIGNED NOT NULL,
  `view_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_email_templates`
--

CREATE TABLE `frm1dnc_email_templates` (
  `email_id` mediumint(8) UNSIGNED NOT NULL,
  `form_id` mediumint(8) UNSIGNED NOT NULL,
  `email_template_name` varchar(100) DEFAULT NULL,
  `email_status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `view_mapping_type` enum('all','specific') NOT NULL DEFAULT 'all',
  `view_mapping_view_id` mediumint(9) DEFAULT NULL,
  `limit_email_content_to_fields_in_view` mediumint(9) DEFAULT NULL,
  `email_event_trigger` set('on_submission','on_edit','on_delete') DEFAULT NULL,
  `include_on_edit_submission_page` enum('no','all_views','specific_views') NOT NULL DEFAULT 'no',
  `subject` varchar(255) DEFAULT NULL,
  `email_from` enum('admin','client','form_email_field','custom','none') DEFAULT NULL,
  `email_from_account_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `email_from_form_email_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `custom_from_name` varchar(100) DEFAULT NULL,
  `custom_from_email` varchar(100) DEFAULT NULL,
  `email_reply_to` enum('admin','client','form_email_field','custom','none') DEFAULT NULL,
  `email_reply_to_account_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `email_reply_to_form_email_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `custom_reply_to_name` varchar(100) DEFAULT NULL,
  `custom_reply_to_email` varchar(100) DEFAULT NULL,
  `html_template` mediumtext,
  `text_template` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_email_template_edit_submission_views`
--

CREATE TABLE `frm1dnc_email_template_edit_submission_views` (
  `email_id` mediumint(8) UNSIGNED NOT NULL,
  `view_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_email_template_recipients`
--

CREATE TABLE `frm1dnc_email_template_recipients` (
  `recipient_id` mediumint(8) UNSIGNED NOT NULL,
  `email_template_id` mediumint(8) UNSIGNED NOT NULL,
  `recipient_user_type` enum('admin','client','form_email_field','custom') NOT NULL,
  `recipient_type` enum('main','cc','bcc') NOT NULL DEFAULT 'main',
  `account_id` mediumint(9) DEFAULT NULL,
  `form_email_id` mediumint(8) UNSIGNED DEFAULT NULL,
  `custom_recipient_name` varchar(200) DEFAULT NULL,
  `custom_recipient_email` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_email_template_when_sent_views`
--

CREATE TABLE `frm1dnc_email_template_when_sent_views` (
  `email_id` mediumint(9) NOT NULL,
  `view_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_options`
--

CREATE TABLE `frm1dnc_field_options` (
  `list_id` mediumint(8) UNSIGNED NOT NULL,
  `list_group_id` mediumint(9) NOT NULL,
  `option_order` smallint(4) NOT NULL,
  `option_value` varchar(255) NOT NULL,
  `option_name` varchar(255) NOT NULL,
  `is_new_sort_group` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_settings`
--

CREATE TABLE `frm1dnc_field_settings` (
  `field_id` mediumint(8) UNSIGNED NOT NULL,
  `setting_id` mediumint(9) NOT NULL,
  `setting_value` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_types`
--

CREATE TABLE `frm1dnc_field_types` (
  `field_type_id` mediumint(8) UNSIGNED NOT NULL,
  `is_editable` enum('yes','no') NOT NULL,
  `is_enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `non_editable_info` mediumtext,
  `managed_by_module_id` mediumint(9) DEFAULT NULL,
  `field_type_name` varchar(255) NOT NULL,
  `field_type_identifier` varchar(50) NOT NULL,
  `group_id` smallint(6) NOT NULL,
  `is_file_field` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_date_field` enum('yes','no') NOT NULL DEFAULT 'no',
  `raw_field_type_map` varchar(50) DEFAULT NULL,
  `raw_field_type_map_multi_select_id` mediumint(9) DEFAULT NULL,
  `list_order` smallint(6) NOT NULL,
  `compatible_field_sizes` varchar(255) NOT NULL,
  `view_field_rendering_type` enum('none','php','smarty') NOT NULL DEFAULT 'none',
  `view_field_php_function_source` varchar(255) DEFAULT NULL,
  `view_field_php_function` varchar(255) DEFAULT NULL,
  `view_field_smarty_markup` mediumtext NOT NULL,
  `edit_field_smarty_markup` mediumtext NOT NULL,
  `php_processing` mediumtext NOT NULL,
  `resources_css` mediumtext,
  `resources_js` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_field_types`
--

INSERT INTO `frm1dnc_field_types` (`field_type_id`, `is_editable`, `is_enabled`, `non_editable_info`, `managed_by_module_id`, `field_type_name`, `field_type_identifier`, `group_id`, `is_file_field`, `is_date_field`, `raw_field_type_map`, `raw_field_type_map_multi_select_id`, `list_order`, `compatible_field_sizes`, `view_field_rendering_type`, `view_field_php_function_source`, `view_field_php_function`, `view_field_smarty_markup`, `edit_field_smarty_markup`, `php_processing`, `resources_css`, `resources_js`) VALUES
(1, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_textbox}', 'textbox', 1, 'no', 'no', 'textbox', NULL, 1, '1char,2chars,tiny,small,medium,large,very_large', 'smarty', 'core', '', '{$VALUE|htmlspecialchars}', '<input type=\"text\" name=\"{$NAME}\" value=\"{$VALUE|escape}\" class=\"{$size}{if $highlight} {$highlight}{/if}\"\n  {if $maxlength}maxlength=\"{$maxlength}\"{/if} />\n  {if $comments}\n    <div class=\"cf_field_comments\">{$comments}</div>\n  {/if}', '', 'input.cf_size_tiny {\n    width: 30px;\n}\ninput.cf_size_small {\n    width: 80px;\n}\ninput.cf_size_medium {\n    width: 150px;\n}\ninput.cf_size_large {\n    width: 250px;\n}\ninput.cf_size_full_width {\n    width: 99%;\n}', ''),
(2, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_textarea}', 'textarea', 1, 'no', 'no', 'textarea', NULL, 2, 'medium,large,very_large', 'smarty', 'core', '', '{if $CONTEXTPAGE == \"edit_submission\"}  \n  {$VALUE|nl2br}\n{else}\n  {$VALUE}\n{/if}', '{* figure out all the classes *}\n{assign var=classes value=$height}\n{if $highlight_colour}\n  {assign var=classes value=\"`$classes` `$highlight_colour`\"}\n{/if}\n{if $input_length == \"words\" && $maxlength != \"\"}\n  {assign var=classes value=\"`$classes` cf_wordcounter max`$maxlength`\"}\n{elseif $input_length == \"chars\" && $maxlength != \"\"}\n  {assign var=classes value=\"`$classes` cf_textcounter max`$maxlength`\"}\n{/if}\n\n<textarea name=\"{$NAME}\" id=\"{$NAME}_id\" class=\"{$classes}\">{$VALUE}</textarea>\n\n{if $input_length == \"words\" && $maxlength != \"\"}\n  <div class=\"cf_counter\" id=\"{$NAME}_counter\">\n    {$maxlength} {$LANG.phrase_word_limit_p} <span></span> {$LANG.phrase_remaining_words}\n  </div>\n{elseif $input_length == \"chars\" && $maxlength != \"\"}\n  <div class=\"cf_counter\" id=\"{$NAME}_counter\">\n    {$maxlength} {$LANG.phrase_characters_limit_p} <span></span> {$LANG.phrase_remaining_characters}\n  </div>\n{/if}\n\n{if $comments}\n  <div class=\"cf_field_comments\">{$comments|nl2br}</div>\n{/if}', '', '.cf_counter span {\n  font-weight: bold;\n}\ntextarea {\n  width: 99%;\n}\ntextarea.cf_size_tiny {\n  height: 30px;\n}\ntextarea.cf_size_small {\n  height: 80px;\n}\ntextarea.cf_size_medium {\n  height: 150px;\n}\ntextarea.cf_size_large {\n  height: 300px;\n}', '/**\n * The following code provides a simple text/word counter option for any \n * textarea. It either just keeps counting up, or limits the results to a\n * certain number - all depending on what the user has selected via the\n * field type settings.\n */\nvar cf_counter = {};\ncf_counter.get_max_count = function(el) {\n  var classes = $(el).attr(\'class\').split(\" \").slice(-1);\n  var max = null;\n  for (var i=0; i<classes.length; i++) {\n    var result = classes[i].match(/max(\\d+)/);\n    if (result != null) {\n      max = result[1];\n      break;\n    }\n  }\n  return max;\n}\n\n$(function() {\n  $(\"textarea[class~=\'cf_wordcounter\']\").each(function() {\n    var max = cf_counter.get_max_count(this);\n    if (max == null) {\n      return;\n    }\n    $(this).bind(\"keydown\", function() {\n      var val = $(this).val();\n      var len = val.split(/[\\s]+/);\n      var field_name = $(this).attr(\"name\");\n      var num_words  = len.length - 1;\n      if (num_words > max) {\n        var allowed_words = val.split(/[\\s]+/, max);\n        truncated_str = allowed_words.join(\" \");\n        $(this).val(truncated_str);\n      } else {\n        $(\"#\" + field_name + \"_counter\").find(\"span\").html(parseInt(max) - parseInt(num_words));\n      }\n    });\n    $(this).trigger(\"keydown\");\n  });\n  $(\"textarea[class~=\'cf_textcounter\']\").each(function() {\n    var max = cf_counter.get_max_count(this);\n    if (max == null) {\n      return;\n    }\n    $(this).bind(\"keydown\", function() {\n      var field_name = $(this).attr(\"name\");\n      if (this.value.length > max) {\n        this.value = this.value.substring(0, max);\n      } else {\n        $(\"#\" + field_name + \"_counter\").find(\"span\").html(max - this.value.length);\n      }\n    });\n    $(this).trigger(\"keydown\");\n  });\n});'),
(3, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_password}', 'password', 1, 'no', 'no', 'password', NULL, 3, '1char,2chars,tiny,small,medium', 'none', 'core', '', '', '<input type=\"password\" name=\"{$NAME}\" value=\"{$VALUE|escape}\" class=\"cf_password\" />\n{if $comments}\n  <div class=\"cf_field_comments\">{$comments}</div>\n{/if}', '', 'input.cf_password {\r\n  width: 120px;\r\n}', ''),
(4, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_dropdown}', 'dropdown', 1, 'no', 'no', 'select', 11, 4, '1char,2chars,tiny,small,medium,large', 'smarty', 'core', 'FormTools\\FieldTypes::displayFieldTypeDropdown', '{strip}{if $contents != \"\"}\n  {foreach from=$contents.options item=curr_group_info name=group}\n    {assign var=options value=$curr_group_info.options}\n    {foreach from=$options item=option name=row}\n      {if $VALUE == $option.option_value}{$option.option_name}{/if}\n    {/foreach}\n  {/foreach}\n{/if}{/strip}', '{if $contents == \"\"}\n  <div class=\"cf_field_comments\">\n    {$LANG.phrase_not_assigned_to_option_list}\n  </div>\n{else}\n  <select name=\"{$NAME}\">\n    {foreach from=$contents.options item=curr_group_info name=group}\n      {assign var=group_info value=$curr_group_info.group_info}\n      {assign var=options value=$curr_group_info.options}\n      {if array_key_exists(\"group_name\", $group_info) && !empty($group_info[\"name\"])}\n      <optgroup label=\"{$group_info.group_name|escape}\">\n      {/if}\n      {foreach from=$options item=option name=row}\n        <option value=\"{$option.option_value}\"\n          {if $VALUE == $option.option_value}selected{/if}>{$option.option_name}</option>\n      {/foreach}\n      {if array_key_exists(\"group_name\", $group_info) && !empty($group_info[\"name\"])}\n      </optgroup>\n      {/if}\n    {/foreach}\n  </select>\n{/if}\n{if $comments}\n  <div class=\"cf_field_comments\">{$comments}</div>\n{/if}', '', '', ''),
(5, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.phrase_multi_select_dropdown}', 'multi_select_dropdown', 1, 'no', 'no', 'multi-select', 13, 5, '1char,2chars,tiny,small,medium,large', 'php', 'core', 'FormTools\\FieldTypes::displayFieldTypeMultiSelectDropdown', '{if $contents != \"\"}\n  {assign var=vals value=\"`$g_multi_val_delimiter`\"|explode:$VALUE}\n  {assign var=is_first value=true}\n  {strip}\n    {foreach from=$contents.options item=curr_group_info name=group}\n      {assign var=options value=$curr_group_info.options}\n      {foreach from=$options item=option name=row}\n        {if $option.option_value|in_array:$vals}\n          {if $is_first == false}, {/if}\n          {$option.option_name}\n          {assign var=is_first value=false}\n        {/if}\n      {/foreach}\n    {/foreach}\n  {/strip}\n{/if}', '{if $contents == \"\"}\n  <div class=\"cf_field_comments\">{$LANG.phrase_not_assigned_to_option_list}</div>\n{else}\n  {assign var=vals value=\"`$g_multi_val_delimiter`\"|explode:$VALUE}\n  <select name=\"{$NAME}[]\" multiple size=\"{if $num_rows}{$num_rows}{else}5{/if}\">\n  {foreach from=$contents.options item=curr_group_info name=group}\n    {assign var=group_info value=$curr_group_info.group_info}\n    {assign var=options value=$curr_group_info.options}\n    {if array_key_exists(\"group_name\", $group_info) && !empty($group_info[\"name\"])}\n    <optgroup label=\"{$group_info.group_name|escape}\">\n    {/if}\n    {foreach from=$options item=option name=row}\n      <option value=\"{$option.option_value}\" {if $option.option_value|in_array:$vals}selected{/if}>{$option.option_name}</option>\n    {/foreach}\n    {if array_key_exists(\"group_name\", $group_info) && !empty($group_info[\"name\"])}\n    </optgroup>\n    {/if}\n  {/foreach}\n  </select>\n{/if}\n\n{if $comments}\n  <div class=\"cf_field_comments\">{$comments}</div>\n{/if}', '', '', ''),
(6, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.phrase_radio_buttons}', 'radio_buttons', 1, 'no', 'no', 'radio-buttons', 16, 6, '1char,2chars,tiny,small,medium,large', 'php', 'core', 'FormTools\\FieldTypes::displayFieldTypeRadios', '{strip}{if $contents != \"\"}\n  {foreach from=$contents.options item=curr_group_info name=group}\n    {assign var=options value=$curr_group_info.options}\n    {foreach from=$options item=option name=row}\n      {if $VALUE == $option.option_value}{$option.option_name}{/if}\n    {/foreach}\n  {/foreach}\n{/if}{/strip}', '{if $contents == \"\"}\n  <div class=\"cf_field_comments\">{$LANG.phrase_not_assigned_to_option_list}</div>\n{else}\n  {assign var=is_in_columns value=false}\n  {if $formatting == \"cf_option_list_2cols\" || \n      $formatting == \"cf_option_list_3cols\" || \n      $formatting == \"cf_option_list_4cols\"}\n    {assign var=is_in_columns value=true}\n  {/if}\n\n  {assign var=counter value=\"1\"}\n  {foreach from=$contents.options item=curr_group_info name=group}\n    {assign var=group_info value=$curr_group_info.group_info}\n    {assign var=options value=$curr_group_info.options}\n    {if array_key_exists(\"group_name\", $group_info) && !empty($group_info[\"group_name\"])}\n      <div class=\"cf_option_list_group_label\">{$group_info.group_name}</div>\n    {/if}\n    {if $is_in_columns}<div class=\"{$formatting}\">{/if}\n    \n    {foreach from=$options item=option name=row}\n      {if $is_in_columns}<div class=\"column\">{/if}\n      <input type=\"radio\" name=\"{$NAME}\" id=\"{$NAME}_{$counter}\" value=\"{$option.option_value}\"\n        {if $VALUE == $option.option_value}checked{/if} />\n      <label for=\"{$NAME}_{$counter}\">{$option.option_name}</label>\n      {if $is_in_columns}</div>{/if}\n      {if $formatting == \"vertical\"}<br />{/if}\n      \n      {assign var=counter value=$counter+1}\n    {/foreach}\n    \n    {if $is_in_columns}</div>{/if}\n  {/foreach}\n  {if $comments}<div class=\"cf_field_comments\">{$comments}</div>{/if}\n{/if}', '', '/* All CSS styles for this field type are found in Shared Resources */', ''),
(7, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_checkboxes}', 'checkboxes', 1, 'no', 'no', 'checkboxes', 19, 7, '1char,2chars,tiny,small,medium,large', 'php', 'core', 'FormTools\\FieldTypes::displayFieldTypeCheckboxes', '{strip}{if $contents != \"\"}\n  {assign var=vals value=\"`$g_multi_val_delimiter`\"|explode:$VALUE}\n  {assign var=is_first value=true}\n  {strip}\n    {foreach from=$contents.options item=curr_group_info name=group}\n      {assign var=options value=$curr_group_info.options}\n      {foreach from=$options item=option name=row}\n        {if $option.option_value|in_array:$vals}\n          {if $is_first == false}, {/if}\n          {$option.option_name}\n          {assign var=is_first value=false}\n        {/if}\n      {/foreach}\n    {/foreach}\n  {/strip}\n{/if}{/strip}', '{if $contents == \"\"}\n  <div class=\"cf_field_comments\">{$LANG.phrase_not_assigned_to_option_list}</div>\n{else}\n  {assign var=vals value=\"`$g_multi_val_delimiter`\"|explode:$VALUE}\n  {assign var=is_in_columns value=false}\n  {if $formatting == \"cf_option_list_2cols\" || \n      $formatting == \"cf_option_list_3cols\" ||\n      $formatting == \"cf_option_list_4cols\"}\n    {assign var=is_in_columns value=true}\n  {/if}\n  \n  {assign var=counter value=\"1\"}\n  {foreach from=$contents.options item=curr_group_info name=group}\n    {assign var=group_info value=$curr_group_info.group_info}\n    {assign var=options value=$curr_group_info.options}\n    \n    {if array_key_exists(\"group_name\", $group_info) && !empty($group_info[\"group_name\"])}\n      <div class=\"cf_option_list_group_label\">{$group_info.group_name}</div>\n    {/if}\n    {if $is_in_columns}<div class=\"{$formatting}\">{/if}\n    \n    {foreach from=$options item=option name=row}\n      {if $is_in_columns}<div class=\"column\">{/if}\n      <input type=\"checkbox\" name=\"{$NAME}[]\" id=\"{$NAME}_{$counter}\"\n        value=\"{$option.option_value|escape}\" {if $option.option_value|in_array:$vals}checked{/if} />\n      <label for=\"{$NAME}_{$counter}\">{$option.option_name}</label>\n      {if $is_in_columns}</div>{/if}\n      {if $formatting == \"vertical\"}<br />{/if}\n      \n      {assign var=counter value=$counter+1}\n    {/foreach}\n    \n    {if $is_in_columns}</div>{/if}\n  {/foreach}\n\n  {if $comments}\n    <div class=\"cf_field_comments\">{$comments}</div>\n  {/if}\n{/if}', '', '/* all CSS is found in Shared Resources */', ''),
(8, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_date}', 'date', 2, 'no', 'yes', '', NULL, 1, 'small', 'php', 'core', 'FormTools\\FieldTypes::displayFieldTypeDate', '{strip}\n{if $VALUE}\n  {assign var=tzo value=0}\n  {if $apply_timezone_offset == \"yes\"}\n    {assign var=tzo value=$ACCOUNT_INFO.timezone_offset}\n  {/if}\n  {if $display_format == \"yy-mm-dd\" || !$display_format}\n    {$VALUE|custom_format_date:$tzo:\"Y-m-d\"}\n  {elseif $display_format == \"dd/mm/yy\"}\n    {$VALUE|custom_format_date:$tzo:\"d/m/Y\"}\n  {elseif $display_format == \"mm/dd/yy\"}\n    {$VALUE|custom_format_date:$tzo:\"m/d/Y\"}\n  {elseif $display_format == \"M d, yy\"}\n    {$VALUE|custom_format_date:$tzo:\"M j, Y\"}\n  {elseif $display_format == \"MM d, yy\"}\n    {$VALUE|custom_format_date:$tzo:\"F j, Y\"}\n  {elseif $display_format == \"D M d, yy\"}\n    {$VALUE|custom_format_date:$tzo:\"D M j, Y\"}\n  {elseif $display_format == \"DD, MM d, yy\"}\n    {$VALUE|custom_format_date:$tzo:\"l M j, Y\"}\n  {elseif $display_format == \"dd. mm. yy\"}\n    {$VALUE|custom_format_date:$tzo:\"d. m. Y\"}\n  {elseif $display_format == \"datetime:dd/mm/yy|h:mm TT|ampm`true\"}\n    {$VALUE|custom_format_date:$tzo:\"d/m/Y g:i A\"}\n  {elseif $display_format == \"datetime:mm/dd/yy|h:mm TT|ampm`true\"}\n    {$VALUE|custom_format_date:$tzo:\"m/d/Y g:i A\"}\n  {elseif $display_format == \"datetime:yy-mm-dd|h:mm TT|ampm`true\"}\n    {$VALUE|custom_format_date:$tzo:\"Y-m-d g:i A\"}\n  {elseif $display_format == \"datetime:yy-mm-dd|hh:mm\"}\n    {$VALUE|custom_format_date:$tzo:\"Y-m-d H:i\"}\n  {elseif $display_format == \"datetime:yy-mm-dd|hh:mm:ss|showSecond`true\"}\n    {$VALUE|custom_format_date:$tzo:\"Y-m-d H:i:s\"}\n  {elseif $display_format == \"datetime:dd. mm. yy|hh:mm\"}\n    {$VALUE|custom_format_date:$tzo:\"d. m. Y H:i\"}\n  {/if}\n{/if}\n{/strip}', '{assign var=class value=\"cf_datepicker\"}\n{if $display_format|strpos:\"datetime\" === 0}\n  {assign var=class value=\"cf_datetimepicker\"}\n{/if}\n\n{assign var=\"val\" value=\"\"}\n{if $VALUE}\n  {assign var=tzo value=\"\"}\n  {if $apply_timezone_offset == \"yes\"}\n    {assign var=tzo value=$ACCOUNT_INFO.timezone_offset}\n  {/if}\n  {if $display_format == \"yy-mm-dd\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"Y-m-d\"}\n  {elseif $display_format == \"dd/mm/yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"d/m/Y\"}\n  {elseif $display_format == \"mm/dd/yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"m/d/Y\"}\n  {elseif $display_format == \"M d, yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"M j, Y\"}\n  {elseif $display_format == \"MM d, yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"F j, Y\"}\n  {elseif $display_format == \"D M d, yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"D M j, Y\"}\n  {elseif $display_format == \"DD, MM d, yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"l M j, Y\"}\n  {elseif $display_format == \"dd. mm. yy\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"d. m. Y\"}\n  {elseif $display_format == \"datetime:dd/mm/yy|h:mm TT|ampm`true\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"d/m/Y g:i A\"}\n  {elseif $display_format == \"datetime:mm/dd/yy|h:mm TT|ampm`true\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"m/d/Y g:i A\"}\n  {elseif $display_format == \"datetime:yy-mm-dd|h:mm TT|ampm`true\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"Y-m-d g:i A\"}\n  {elseif $display_format == \"datetime:yy-mm-dd|hh:mm\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"Y-m-d H:i\"}\n  {elseif $display_format == \"datetime:yy-mm-dd|hh:mm:ss|showSecond`true\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"Y-m-d H:i:s\"}\n  {elseif $display_format == \"datetime:dd. mm. yy|hh:mm\"}\n    {assign var=val value=$VALUE|custom_format_date:$tzo:\"d. m. Y H:i\"}\n  {/if}\n{/if}\n\n<div class=\"cf_date_group\">\n  <input type=\"input\" name=\"{$NAME}\" id=\"{$NAME}_id\" class=\"cf_datefield {$class}\"\n    value=\"{$val}\" /><img class=\"ui-datepicker-trigger\" src=\"{$g_root_url}/global/images/calendar.png\" \n    id=\"{$NAME}_icon_id\" />\n  <input type=\"hidden\" id=\"{$NAME}_format\" value=\"{$display_format}\" />\n  {if $comments}\n    <div class=\"cf_field_comments\">{$comments}</div>\n  {/if}\n</div>', '$field_name     = $vars[\"field_info\"][\"field_name\"];\n$date           = $vars[\"data\"][$field_name];\n$display_format = $vars[\"settings\"][\"display_format\"];\n$atzo           = $vars[\"settings\"][\"apply_timezone_offset\"];\n$account_info   = isset($vars[\"account_info\"]) ? $vars[\"account_info\"] : array();\n\nif (empty($date)) {\n  $value = \"\";\n} else { \n  if (strpos($display_format, \"datetime:\") === 0) {\n    $parts = explode(\" \", $date);\n    switch ($display_format) {\n      case \"datetime:dd/mm/yy|h:mm TT|ampm`true\":\n        $date = substr($date, 3, 2) . \"/\" . substr($date, 0, 2) . \"/\" . substr($date, 6);\n        break;\n      case \"datetime:dd. mm. yy|hh:mm\":\n        $date = substr($date, 4, 2) . \"/\" . substr($date, 0, 2) . \"/\" . substr($date, 8, 4) . \" \" . substr($date, 14);\n        break;\n    }\n  } else {\n    if ($display_format == \"dd/mm/yy\") {\n      $date = substr($date, 3, 2) . \"/\" . substr($date, 0, 2) . \"/\" . substr($date, 6);\n    } else if ($display_format == \"dd. mm. yy\") {\n      $parts = explode(\" \", $date);\n      $date = trim($parts[1], \".\") . \"/\" . trim($parts[0], \".\") . \"/\" . trim($parts[2], \".\");\n    }\n  }\n  $time = strtotime($date);\n  \n  // lastly, if this field has a timezone offset being applied to it, do the\n  // appropriate math on the date\n  if ($atzo == \"yes\" && !isset($account_info[\"timezone_offset\"])) {\n    $seconds_offset = $account_info[\"timezone_offset\"] * 60 * 60;\n    $time += $seconds_offset;\n  }\n  $value = date(\"Y-m-d H:i:s\", $time);\n}', '.cf_datepicker {\n  width: 160px;\n}\n.cf_datetimepicker {\n  width: 160px;\n}\n.ui-datepicker-trigger {\n  cursor: pointer;\n}', '$(function() {\n  // the datetimepicker has a bug that prevents the icon from appearing. So\n  // instead, we add the image manually into the page and assign the open event\n  // handler to the image\n  var default_settings = {\n    changeYear: true,\n    changeMonth: true\n  }\n  $(\".cf_datepicker\").each(function() {\n    var field_name = $(this).attr(\"name\");\n    var settings = default_settings;\n    if ($(\"#\" + field_name + \"_id\").length) {\n      settings.dateFormat = $(\"#\" + field_name + \"_format\").val();\n    }\n    $(this).datepicker(settings);\n    $(\"#\" + field_name + \"_icon_id\").bind(\"click\", { field_id: \"#\" + field_name + \"_id\" }, function(e) {\n      $.datepicker._showDatepicker($(e.data.field_id)[0]);\n    });\n  });\n  \n  $(\".cf_datetimepicker\").each(function() {\n    var field_name = $(this).attr(\"name\");\n    var settings = default_settings;\n\n    if ($(\"#\" + field_name + \"_id\").length) {\n      var settings_str = $(\"#\" + field_name + \"_format\").val();\n      settings_str = settings_str.replace(/datetime:/, \"\");\n      var settings_list = settings_str.split(\"|\");\n      var settings = {};\n      settings.dateFormat = settings_list[0];\n      settings.timeFormat = settings_list[1];\n      for (var i=2; i<settings_list.length; i++) {\n        var parts = settings_list[i].split(\"`\");\n        if (parts[1] === \"true\") {\n          parts[1] = true;\n        }\n        settings[parts[0]] = parts[1];\n      }\n    }\n    \n    $(this).datetimepicker(settings);\n    $(\"#\" + field_name + \"_icon_id\").bind(\"click\", { \n      field_id: \"#\" + field_name + \"_id\"\n    }, function(e) {\n      $.datepicker._showDatepicker($(e.data.field_id)[0]);\n    });\n  });\n});'),
(9, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.word_time}', 'time', 2, 'no', 'no', '', NULL, 2, 'small', 'none', 'core', '', '', '<div class=\"cf_date_group\">\n  <input type=\"input\" name=\"{$NAME}\" value=\"{$VALUE}\" class=\"cf_datefield cf_timepicker\" />\n  <input type=\"hidden\" id=\"{$NAME}_id\" value=\"{$display_format}\" />\n  {if $comments}\n    <div class=\"cf_field_comments\">{$comments}</div>\n  {/if}\n</div>', '', '.cf_timepicker {\n  width: 60px;\n}\n.ui-timepicker-div .ui-widget-header {\n  margin-bottom: 8px;\n}\n.ui-timepicker-div dl {\n  text-align: left;\n}\n.ui-timepicker-div dl dt {\n  height: 25px;\n}\n.ui-timepicker-div dl dd {\n  margin: -25px 0 10px 65px;\n}\n.ui-timepicker-div td {\n  font-size: 90%;\n}', '$(function() {\n  var default_settings = {\n    buttonImage:     g.root_url + \"/global/images/clock.png\",\n    showOn:          \"both\",\n    buttonImageOnly: true\n  }\n  $(\".cf_timepicker\").each(function() {\n    var field_name = $(this).attr(\"name\");\n    var settings = default_settings;\n    if ($(\"#\" + field_name + \"_id\").length) {\n      var settings_list = $(\"#\" + field_name + \"_id\").val().split(\"|\");\n      if (settings_list.length > 0) {\n        settings.timeFormat = settings_list[0];\n        for (var i=1; i<settings_list.length; i++) {\n          var parts = settings_list[i].split(\"`\");\n          if (parts[1] === \"true\") {\n            parts[1] = true;\n          } else if (parts[1] === \"false\") {\n            parts[1] = false;\n          }\n          settings[parts[0]] = parts[1];\n        }\n      }\n    }\n    $(this).timepicker(settings);\n  });\n});'),
(10, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.phrase_phone_number}', 'phone', 2, 'no', 'no', '', NULL, 3, 'small,medium', 'smarty', 'core', 'FormTools\\FieldTypes::displayFieldTypePhoneNumber', '{view_phone_field}', '{edit_phone_field}', '$field_name = $vars[\"field_info\"][\"field_name\"];\n$joiner = \"|\";\n\n$count = 1;\n$parts = array();\nwhile (isset($vars[\"data\"][\"{$field_name}_$count\"])) {\n  $parts[] = $vars[\"data\"][\"{$field_name}_$count\"];\n  $count++;\n}\n$value = implode(\"|\", $parts);', '', 'var cf_phone = {};\ncf_phone.check_required = function() {\n  var errors = [];\n  for (var i=0; i<rsv_custom_func_errors.length; i++) {\n    if (rsv_custom_func_errors[i].func != \"cf_phone.check_required\") {\n      continue;\n    }\n    var field_name = rsv_custom_func_errors[i].field;\n    var fields = $(\"input[name^=\\\"\" + field_name + \"_\\\"]\");\n    fields.each(function() {\n      if (!this.name.match(/_(\\d+)$/)) {\n        return;\n      }\n      var req_len = $(this).attr(\"maxlength\");\n      var actual_len = this.value.length;\n      if (req_len != actual_len || this.value.match(/\\D/)) {\n        var el = document.edit_submission_form[field_name];\n        errors.push([el, rsv_custom_func_errors[i].err]);\n        return false;\n      }\n    });\n  }\n  if (errors.length) {\n    return errors;\n  }\n  \n  return true;\n}'),
(11, 'no', 'yes', '{$LANG.text_non_deletable_fields}', NULL, '{$LANG.phrase_code_markup_field}', 'code_markup', 2, 'no', 'no', 'textarea', NULL, 4, 'large,very_large', 'php', 'core', 'FormTools\\FieldTypes::displayFieldTypeCodeMarkup', '{if $CONTEXTPAGE == \"edit_submission\"}\n<div class=\"cf_code_view\">\n    <textarea id=\"{$NAME}_id\" name=\"{$NAME}\">kay{$VALUE}</textarea>\n    <script>\n    var code_mirror_{$NAME} = new CodeMirror.fromTextArea(document.getElementById(\"{$NAME}_id\"), \n    {literal}{{/literal} height: \"{$height}px\",\n        readOnly: true,\n    {if $code_markup == \"HTML\" || $code_markup == \"XML\"}\n        mode: \"xml\"\n    {elseif $code_markup == \"CSS\"}\n        mode: \"css\"\n    {elseif $code_markup == \"JavaScript\"}\n        mode: \"javascript\"\n    {/if}\n    {literal}});{/literal}\n    </script>\n</div>\n\n{else}\n  {$VALUE|strip_tags}\n{/if}', '<div class=\"editor\">\n  <textarea id=\"{$NAME}_id\" name=\"{$NAME}\">{$VALUE}</textarea>\n</div>\n\n<script>\nvar code_mirror_{$NAME} = new CodeMirror.fromTextArea(document.getElementById(\"{$NAME}_id\"), {literal}{{/literal}\n  height: \"{$height}px\",\n  {if $code_markup == \"HTML\" || $code_markup == \"XML\"} \n    mode: \"xml\"\n  {elseif $code_markup == \"CSS\"}\n    mode: \"css\"\n  {elseif $code_markup == \"JavaScript\"}\n    mode: \"javascript\"\n  {/if}\n  {literal}});{/literal}\n</script>\n\n{if $comments}\n  <div class=\"cf_field_comments\">{$comments}</div>\n{/if}', '', '.cf_view_markup_field {\n    margin: 0px;\n}\n.cf_code_view .CodeMirror {\n    background-color: transparent;\n    height: auto;\n}\n.cf_code_view .CodeMirror-scroll {\n    max-height: 300px;\n}\n.cf_code_view .CodeMirror-cursor { \n    display: none !important;\n}', 'var cf_code = {};\ncf_code.check_required = function() {\n  var errors = [];\n  for (var i=0; i<rsv_custom_func_errors.length; i++) {\n    if (rsv_custom_func_errors[i].func != \"cf_code.check_required\") {\n      continue;\n    }\n    var field_name = rsv_custom_func_errors[i].field;\n    var val = $.trim(window[\"code_mirror_\" + field_name].getCode());\n    if (!val) {\n      var el = document.edit_submission_form[field_name];\n      errors.push([el, rsv_custom_func_errors[i].err]);\n    }\n  }\n  if (errors.length) {\n    return errors;\n  }\n  return true;\n}'),
(12, 'no', 'yes', 'This module can only be edited via the File Upload module.', 8, '{$LANG.word_file}', 'file', 1, 'yes', 'no', 'file', NULL, 8, 'large,very_large', 'smarty', 'core', '', '{if empty($VALUE)}\n	{assign var=filenames value=[]}\n{else}\n	{assign var=filenames value=\":\"|explode:$VALUE}\n{/if}\n\n{if $CONTEXTPAGE == \'submission_listing\'}\n{if $filenames|@count < 2}\n	{foreach from=$filenames item=filename name=filelist}\n		<a href=\"{$folder_url}/{$filename}\" \n			{if $use_fancybox == \"yes\"}class=\"fancybox\"{/if}>{$filename}</a>{if not $smarty.foreach.filelist.last}, {/if}\n	{/foreach}\n{else}\n	<div class=\"cf_file_num_files\"><b>{$filenames|@count}</b> {$LANG.word_files|lower}</div> \n{/if}\n{elseif $CONTEXTPAGE == \'edit_submission\'}\n	<ul class=\"cf_file_list_view\"> \n		{foreach from=$filenames item=filename}\n		<li>\n			<a href=\"{$folder_url}/{$filename}\" \n				{if $use_fancybox == \"yes\"}class=\"fancybox\"{/if}>{$filename}</a>\n		</li>\n		{/foreach}\n	</ul>\n{elseif $CONTEXTPAGE == \'export:text\'}\n{foreach from=$filenames item=filename name=loop}{$folder_url}/{$filename}{if !$smarty.foreach.loop.last},{/if} {/foreach}\n{elseif $CONTEXTPAGE == \'export:html\'}\n{foreach from=$filenames item=filename name=loop}<a href=\"{$folder_url}/{$filename}\" target=\"_blank\">{$filename}</a>{if not $smarty.foreach.loop.last}, {/if}{/foreach}\n{else}\n{foreach from=$filenames item=filename name=loop}{$filename}{if !$smarty.foreach.loop.last},{/if} {/foreach}\n{/if}', '{if empty($VALUE)}\n	{assign var=filenames value=[]}\n{else}\n	{assign var=filenames value=\":\"|explode:$VALUE}\n{/if} \n{assign var=num_files value=$filenames|@count}\n\n<div class=\"cf_file {if $num_files > 0}cf_file_has_items{/if} {if $num_files > 1}cf_file_has_multiple_items{/if} {if $multiple_files == \'yes\'}cf_file_multiple{/if}\"\n	id=\"cf_file_{$FIELD_ID}\">\n    <input type=\"hidden\" class=\"cf_file_field_id\" value=\"{$FIELD_ID}\" />\n\n	<ul class=\"cf_file_list\">\n		<li class=\"cf_file_top_row\">\n			<input type=\"checkbox\" class=\"cf_file_toggle_all\" />\n			<span class=\"cf_file_col\">{$LANG.word_file}</span>\n		</li>\n		{foreach from=$filenames item=filename}\n		<li>\n			<input type=\"checkbox\" name=\"cf_files[]\" class=\"cf_file_row_cb\" value=\"{$filename}\" />\n			<a href=\"{$folder_url}/{$filename}\" \n				{if $use_fancybox == \"yes\"}class=\"fancybox\"{/if}>{$filename}</a>\n			{if $num_files == 1 && $multiple_files == \"no\"}\n				<input type=\"button\" class=\"cf_delete_file\" value=\"{$LANG.word_delete}\" />\n			{/if}\n		</li>\n		{/foreach}\n	</ul>\n\n	<input type=\"button\" value=\"{$LANG.word_delete}\" class=\"cf_file_delete_selected\"\n		disabled=\"disabled\" {if empty($VALUE) || ($multiple_files == \'no\' && $num_files < 2)}style=\"display: none\"{/if} />\n\n	<input type=\"file\" class=\"cf_file_upload_btn\" name=\"{$NAME}{if $multiple_files == \"yes\"}[]{/if}\"\n		{if $multiple_files == \"yes\"}multiple=\"multiple\"{/if}\n		{if $multiple_files == \"no\" && $num_files > 0}style=\"display:none\"{/if} /> \n\n    <div id=\"file_field_{$FIELD_ID}_message_id\" class=\"cf_file_message\"></div>\n</div>\n\n{if $comments}\n    <div class=\"cf_field_comments\">{$comments}</div>\n{/if}', '', '.cf_file_list {\n	display: none;\n	list-style-type: none;\n	padding: 0;\n	margin: 0;\n}\n.ft_file_multiple.cf_file_list {\n	margin-bottom: 4px;\n}\n.cf_file_list_view {\n	list-style-type: none;\n	padding: 0;\n	margin: 0;\n}\n.cf_file_list_view.cf_file_list_horizontal li {\n	display: inline-block;\n}\n.cf_file.cf_file_has_items .cf_file_list {\n	display: block;\n}\n.cf_file_top_row {\n	border-bottom: 1px solid #dddddd;\n	display: none;\n}\n.cf_file.cf_file_has_items.cf_file_multiple .cf_file_top_row,\n.cf_file.cf_file_has_multiple_items .cf_file_top_row {\n	display: block;\n}\n.cf_file_col {\n	font-style: italic;\n	color: #999999;\n}\n.cf_file_row_cb {\n	display: none;\n}\n.cf_file.cf_file_has_items.cf_file_multiple .cf_file_row_cb,\n.cf_file.cf_file_has_multiple_items .cf_file_row_cb {\n	display: inline-block;\n}\n.cf_file_num_files {\n	color: #444444;\n}', '/* all JS for this module is found in /modules/field_type_file/scripts/edit_submission.js */'),
(13, 'no', 'yes', 'This module can only be edited via the tinyMCE module.', 6, '{$LANG.word_wysiwyg}', 'tinymce', 2, 'no', 'no', 'textarea', NULL, 5, 'large,very_large', 'smarty', 'core', '', '{if $CONTEXTPAGE == \"edit_submission\"}\n    {$VALUE}\n{elseif $CONTEXTPAGE == \"submission_listing\"}\n    {$VALUE|strip_tags}\n{else}\n    {$VALUE|nl2br}\n{/if}', '<textarea name=\"{$NAME}\" id=\"cf_{$NAME}_id\" class=\"cf_tinymce\">{$VALUE}</textarea>\n<script>\ncf_tinymce_settings[\"{$NAME}\"] = {literal}{{/literal}\n    skin: \"lightgray\",\n    branding: false,\n    menubar: false,\n    elementpath: false,\n{if $toolbar == \"basic\"}\n    toolbar: [\n        \'bold italic underline strikethrough | bullist numlist\'\n    ],\n{elseif $toolbar == \"simple\"}\n    toolbar: [\n        \'bold italic underline strikethrough | bullist numlist | outdent indent | blockquote hr | link unlink forecolor backcolor\'\n    ],\n    plugins: \'hr link textcolor lists\',\n{elseif $toolbar == \"advanced\"}\n    toolbar: [\n        \'bold italic underline strikethrough | bullist numlist | outdent indent | blockquote hr | undo redo link unlink | fontselect fontsizeselect\',\n        \'forecolor backcolor | subscript superscript code\'\n    ],\n    plugins: \'hr link textcolor lists code\',\n{elseif $toolbar == \"expert\"}\n    toolbar: [\n        \'bold italic underline strikethrough | bullist numlist | outdent indent | blockquote hr |  formatselect fontselect fontsizeselect\',\n        \'undo redo link unlink | forecolor backcolor | subscript superscript | newdocument charmap removeformat cleanup code\'\n    ],\n    plugins: \'hr link textcolor lists code\',\n{/if}\n{if $resizing}\n    statusbar: true,\n    resize: true\n{else}\n    statusbar: false,\n    resize: false\n{/if}\n{literal}}{/literal}\n</script>\n{if $comments}\n    <div class=\"cf_field_comments\">{$comments}</div>\n{/if}', '', 'body .mce-ico {\n    font-size: 13px;\n}\nbody .mce-btn button {\n    padding: 3px 5px 3px 7px;\n}', '// this is populated by each tinyMCE WYWISYG with their settings on page load\nvar cf_tinymce_settings = {};\n\n$(function() {\n    $(\'textarea.cf_tinymce\').each(function() {\n        var field_name = $(this).attr(\"name\");\n        var settings   = cf_tinymce_settings[field_name];\n        settings.selector = \"#\" + $(this).attr(\"id\");\n        tinymce.init(settings);\n    });\n});\n\ncf_tinymce_settings.check_required = function() {\n    var errors = [];\n    for (var i=0; i<rsv_custom_func_errors.length; i++) {\n        if (rsv_custom_func_errors[i].func != \"cf_tinymce_settings.check_required\") {\n            continue;\n        }\n        var field_name = rsv_custom_func_errors[i].field;\n        var val = $.trim(tinyMCE.get(\"cf_\" + field_name + \"_id\").getContent());\n        if (!val) {\n            var el = document.edit_submission_form[field_name];\n            errors.push([el, rsv_custom_func_errors[i].err]);\n        }\n    }\n    if (errors.length) {\n        return errors;\n    }\n    return true;\n}');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_type_settings`
--

CREATE TABLE `frm1dnc_field_type_settings` (
  `setting_id` mediumint(8) UNSIGNED NOT NULL,
  `field_type_id` mediumint(8) UNSIGNED NOT NULL,
  `field_label` varchar(255) NOT NULL,
  `field_setting_identifier` varchar(50) NOT NULL,
  `field_type` enum('textbox','textarea','radios','checkboxes','select','multi-select','option_list_or_form_field') NOT NULL,
  `field_orientation` enum('horizontal','vertical','na') NOT NULL DEFAULT 'na',
  `default_value_type` enum('static','dynamic') NOT NULL DEFAULT 'static',
  `default_value` varchar(255) DEFAULT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_field_type_settings`
--

INSERT INTO `frm1dnc_field_type_settings` (`setting_id`, `field_type_id`, `field_label`, `field_setting_identifier`, `field_type`, `field_orientation`, `default_value_type`, `default_value`, `list_order`) VALUES
(1, 1, '{$LANG.word_size}', 'size', 'select', 'na', 'static', 'cf_size_medium', 1),
(2, 1, '{$LANG.phrase_max_length}', 'maxlength', 'textbox', 'na', 'static', '', 2),
(3, 1, '{$LANG.word_highlight}', 'highlight', 'select', 'na', 'static', '', 3),
(4, 1, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 4),
(5, 2, '{$LANG.word_height}', 'height', 'select', 'na', 'static', 'cf_size_small', 1),
(6, 2, '{$LANG.phrase_highlight_colour}', 'highlight_colour', 'select', 'na', 'static', '', 2),
(7, 2, '{$LANG.phrase_input_length}', 'input_length', 'radios', 'horizontal', 'static', '', 3),
(8, 2, '{$LANG.phrase_max_length_words_chars}', 'maxlength', 'textbox', 'na', 'static', '', 4),
(9, 2, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 5),
(10, 3, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 1),
(11, 4, '{$LANG.phrase_option_list_or_contents}', 'contents', 'option_list_or_form_field', 'na', 'static', '', 1),
(12, 4, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 2),
(13, 5, '{$LANG.phrase_option_list_or_contents}', 'contents', 'option_list_or_form_field', 'na', 'static', '', 1),
(14, 5, '{$LANG.phrase_num_rows}', 'num_rows', 'textbox', 'na', 'static', '5', 2),
(15, 5, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 3),
(16, 6, '{$LANG.phrase_option_list_or_contents}', 'contents', 'option_list_or_form_field', 'na', 'static', '', 1),
(17, 6, '{$LANG.word_formatting}', 'formatting', 'select', 'na', 'static', 'horizontal', 2),
(18, 6, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 3),
(19, 7, '{$LANG.phrase_option_list_or_contents}', 'contents', 'option_list_or_form_field', 'na', 'static', '', 1),
(20, 7, '{$LANG.word_formatting}', 'formatting', 'select', 'na', 'static', 'horizontal', 2),
(21, 7, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 3),
(22, 8, '{$LANG.phrase_custom_display_format}', 'display_format', 'select', 'na', 'static', 'yy-mm-dd', 1),
(23, 8, '{$LANG.phrase_apply_timezone_offset}', 'apply_timezone_offset', 'radios', 'horizontal', 'static', 'no', 2),
(24, 8, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 3),
(25, 9, '{$LANG.phrase_custom_display_format}', 'display_format', 'select', 'na', 'static', 'h:mm TT|ampm`true', 1),
(26, 9, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 2),
(27, 10, '{$LANG.phrase_phone_number_format}', 'phone_number_format', 'textbox', 'na', 'static', '(xxx) xxx-xxxx', 1),
(28, 10, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 2),
(29, 11, '{$LANG.phrase_code_markup_type}', 'code_markup', 'select', 'na', 'static', 'HTML', 1),
(30, 11, '{$LANG.word_height}', 'height', 'select', 'na', 'static', '200', 2),
(31, 11, '{$LANG.phrase_field_comments}', 'comments', 'textarea', 'na', 'static', '', 3),
(32, 12, 'Open link with Fancybox', 'use_fancybox', 'radios', 'horizontal', 'static', 'no', 1),
(33, 12, 'Allow multiple file uploads', 'multiple_files', 'radios', 'horizontal', 'static', 'no', 2),
(34, 12, 'Filename format', 'file_name_format', 'textbox', 'na', 'static', '{$clean_filename}', 3),
(35, 12, 'Folder Path', 'folder_path', 'textbox', 'na', 'dynamic', 'file_upload_dir,core', 4),
(36, 12, 'Folder URL', 'folder_url', 'textbox', 'na', 'dynamic', 'file_upload_url,core', 5),
(37, 12, 'Permitted File Types', 'permitted_file_types', 'textbox', 'na', 'dynamic', 'file_upload_filetypes,core', 6),
(38, 12, 'Max File Size (KB)', 'max_file_size', 'textbox', 'na', 'dynamic', 'file_upload_max_size,core', 7),
(39, 12, 'Field Comments', 'comments', 'textbox', 'na', 'static', '', 8),
(40, 13, 'Toolbar', 'toolbar', 'select', 'na', 'static', 'simple', 1),
(41, 13, 'Allow Toolbar Resizing', 'resizing', 'radios', 'horizontal', 'static', 'true', 2),
(42, 13, 'Field Comments', 'comments', 'textarea', 'na', 'static', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_type_setting_options`
--

CREATE TABLE `frm1dnc_field_type_setting_options` (
  `setting_id` mediumint(9) NOT NULL,
  `option_text` varchar(255) DEFAULT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  `option_order` smallint(6) NOT NULL,
  `is_new_sort_group` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_field_type_setting_options`
--

INSERT INTO `frm1dnc_field_type_setting_options` (`setting_id`, `option_text`, `option_value`, `option_order`, `is_new_sort_group`) VALUES
(1, '{$LANG.word_tiny}', 'cf_size_tiny', 1, 'yes'),
(1, '{$LANG.word_small}', 'cf_size_small', 2, 'yes'),
(1, '{$LANG.word_medium}', 'cf_size_medium', 3, 'yes'),
(1, '{$LANG.word_large}', 'cf_size_large', 4, 'yes'),
(1, '{$LANG.phrase_full_width}', 'cf_size_full_width', 5, 'yes'),
(3, '{$LANG.word_none}', '', 1, 'yes'),
(3, '{$LANG.word_red}', 'cf_colour_red', 2, 'yes'),
(3, '{$LANG.word_orange}', 'cf_colour_orange', 3, 'yes'),
(3, '{$LANG.word_yellow}', 'cf_colour_yellow', 4, 'yes'),
(3, '{$LANG.word_green}', 'cf_colour_green', 5, 'yes'),
(3, '{$LANG.word_blue}', 'cf_colour_blue', 6, 'yes'),
(5, '{$LANG.phrase_tiny_30px}', 'cf_size_tiny', 1, 'yes'),
(5, '{$LANG.phrase_small_80px}', 'cf_size_small', 2, 'yes'),
(5, '{$LANG.phrase_medium_150px}', 'cf_size_medium', 3, 'yes'),
(5, '{$LANG.phrase_large_300px}', 'cf_size_large', 4, 'yes'),
(6, '{$LANG.word_none}', '', 1, 'yes'),
(6, '{$LANG.word_red}', 'cf_colour_red', 2, 'yes'),
(6, '{$LANG.word_orange}', 'cf_colour_orange', 3, 'yes'),
(6, '{$LANG.word_yellow}', 'cf_colour_yellow', 4, 'yes'),
(6, '{$LANG.word_green}', 'cf_colour_green', 5, 'yes'),
(6, '{$LANG.word_blue}', 'cf_colour_blue', 6, 'yes'),
(7, '{$LANG.phrase_no_limit}', '', 1, 'yes'),
(7, '{$LANG.word_words}', 'words', 2, 'yes'),
(7, '{$LANG.word_characters}', 'chars', 3, 'yes'),
(17, '{$LANG.word_horizontal}', 'horizontal', 1, 'yes'),
(17, '{$LANG.word_vertical}', 'vertical', 2, 'yes'),
(17, '{$LANG.phrase_2_columns}', 'cf_option_list_2cols', 3, 'yes'),
(17, '{$LANG.phrase_3_columns}', 'cf_option_list_3cols', 4, 'yes'),
(17, '{$LANG.phrase_4_columns}', 'cf_option_list_4cols', 5, 'yes'),
(20, '{$LANG.word_horizontal}', 'horizontal', 1, 'yes'),
(20, '{$LANG.word_vertical}', 'vertical', 2, 'yes'),
(20, '{$LANG.phrase_2_columns}', 'cf_option_list_2cols', 3, 'yes'),
(20, '{$LANG.phrase_3_columns}', 'cf_option_list_3cols', 4, 'yes'),
(20, '{$LANG.phrase_4_columns}', 'cf_option_list_4cols', 5, 'yes'),
(22, '2011-11-30', 'yy-mm-dd', 1, 'yes'),
(22, '30/11/2011 (dd/mm/yyyy)', 'dd/mm/yy', 2, 'yes'),
(22, '11/30/2011 (mm/dd/yyyy)', 'mm/dd/yy', 3, 'yes'),
(22, 'Nov 30, 2011', 'M d, yy', 4, 'yes'),
(22, 'November 30, 2011', 'MM d, yy', 5, 'yes'),
(22, 'Wed Nov 30, 2011', 'D M d, yy', 6, 'yes'),
(22, 'Wednesday, November 30, 2011', 'DD, MM d, yy', 7, 'yes'),
(22, '30. 08. 2011', 'dd. mm. yy', 8, 'yes'),
(22, '30/11/2011 8:00 PM', 'datetime:dd/mm/yy|h:mm TT|ampm`true', 9, 'yes'),
(22, '11/30/2011 8:00 PM', 'datetime:mm/dd/yy|h:mm TT|ampm`true', 10, 'yes'),
(22, '2011-11-30 8:00 PM', 'datetime:yy-mm-dd|h:mm TT|ampm`true', 11, 'yes'),
(22, '2011-11-30 20:00', 'datetime:yy-mm-dd|hh:mm', 12, 'yes'),
(22, '2011-11-30 20:00:00', 'datetime:yy-mm-dd|hh:mm:ss|showSecond`true', 13, 'yes'),
(22, '30. 08. 2011 20:00', 'datetime:dd. mm. yy|hh:mm', 14, 'yes'),
(23, '{$LANG.word_yes}', 'yes', 1, 'yes'),
(23, '{$LANG.word_no}', 'no', 2, 'yes'),
(25, '8:00 AM', 'h:mm TT|ampm`true', 1, 'yes'),
(25, '16:00', 'hh:mm|ampm`false', 2, 'yes'),
(25, '16:00:00', 'hh:mm:ss|showSecond`true|ampm`false', 3, 'yes'),
(29, 'CSS', 'CSS', 1, 'yes'),
(29, 'HTML', 'HTML', 2, 'yes'),
(29, 'JavaScript', 'JavaScript', 3, 'yes'),
(29, 'XML', 'XML', 4, 'yes'),
(30, '{$LANG.phrase_tiny_50px}', '50', 1, 'yes'),
(30, '{$LANG.phrase_small_100px}', '100', 2, 'yes'),
(30, '{$LANG.phrase_medium_200px}', '200', 3, 'yes'),
(30, '{$LANG.phrase_large_400px}', '400', 4, 'yes'),
(32, 'Yes', 'yes', 1, 'yes'),
(32, 'No', 'no', 2, 'no'),
(33, 'Yes', 'yes', 1, 'yes'),
(33, 'No', 'no', 2, 'no'),
(40, 'Basic', 'basic', 1, 'yes'),
(40, 'Simple', 'simple', 2, 'yes'),
(40, 'Advanced', 'advanced', 3, 'yes'),
(40, 'Expert', 'expert', 4, 'yes'),
(41, 'Yes', 'true', 1, 'yes'),
(41, 'No', 'false', 2, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_type_validation_rules`
--

CREATE TABLE `frm1dnc_field_type_validation_rules` (
  `rule_id` mediumint(8) UNSIGNED NOT NULL,
  `field_type_id` mediumint(9) NOT NULL,
  `rsv_rule` varchar(50) NOT NULL,
  `rule_label` varchar(100) NOT NULL,
  `rsv_field_name` varchar(255) NOT NULL,
  `custom_function` varchar(100) NOT NULL,
  `custom_function_required` enum('yes','no','na') NOT NULL DEFAULT 'na',
  `default_error_message` mediumtext NOT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_field_type_validation_rules`
--

INSERT INTO `frm1dnc_field_type_validation_rules` (`rule_id`, `field_type_id`, `rsv_rule`, `rule_label`, `rsv_field_name`, `custom_function`, `custom_function_required`, `default_error_message`, `list_order`) VALUES
(1, 1, 'required', '{$LANG.word_required}', '{$field_name}', '', 'no', '{$LANG.validation_default_rule_required}', 1),
(2, 1, 'valid_email', '{$LANG.phrase_valid_email}', '{$field_name}', '', 'no', '{$LANG.validation_default_rule_valid_email}', 2),
(3, 1, 'digits_only', '{$LANG.phrase_numbers_only}', '{$field_name}', '', 'no', '{$LANG.validation_default_rule_numbers_only}', 3),
(4, 1, 'letters_only', '{$LANG.phrase_letters_only}', '{$field_name}', '', 'no', '{$LANG.validation_default_rule_letters_only}', 4),
(5, 1, 'is_alpha', '{$LANG.phrase_alphanumeric}', '{$field_name}', '', 'no', '{$LANG.validation_default_rule_alpha}', 5),
(6, 2, 'required', '{$LANG.word_required}', '{$field_name}', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(7, 3, 'required', '{$LANG.word_required}', '{$field_name}', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(8, 4, 'required', '{$LANG.word_required}', '{$field_name}', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(9, 5, 'required', '{$LANG.word_required}', '{$field_name}[]', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(10, 6, 'required', '{$LANG.word_required}', '{$field_name}', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(11, 7, 'required', '{$LANG.word_required}', '{$field_name}[]', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(12, 8, 'required', '{$LANG.word_required}', '{$field_name}', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(13, 9, 'required', '{$LANG.word_required}', '{$field_name}', '', 'na', '{$LANG.validation_default_rule_required}', 1),
(14, 10, 'function', '{$LANG.word_required}', '', 'cf_phone.check_required', 'yes', '{$LANG.validation_default_phone_num_required}', 1),
(15, 11, 'function', '{$LANG.word_required}', '', 'cf_code.check_required', 'yes', '{$LANG.validation_default_rule_required}', 1),
(16, 12, 'function', '{$LANG.word_required}', '', 'files_ns.check_required', 'yes', '{$LANG.validation_default_rule_required}', 1),
(17, 13, 'function', '{$LANG.word_required}', '', 'cf_tinymce_settings.check_required', 'yes', '{$LANG.validation_default_rule_required}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_field_validation`
--

CREATE TABLE `frm1dnc_field_validation` (
  `rule_id` mediumint(8) UNSIGNED NOT NULL,
  `field_id` mediumint(9) NOT NULL,
  `error_message` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_forms`
--

CREATE TABLE `frm1dnc_forms` (
  `form_id` mediumint(9) UNSIGNED NOT NULL,
  `form_type` enum('internal','external','form_builder') NOT NULL DEFAULT 'external',
  `access_type` enum('admin','public','private') NOT NULL DEFAULT 'public',
  `submission_type` enum('code','direct') DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `is_active` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_initialized` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_complete` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_multi_page_form` enum('yes','no') NOT NULL DEFAULT 'no',
  `form_name` varchar(255) NOT NULL DEFAULT '',
  `form_url` varchar(255) NOT NULL DEFAULT '',
  `redirect_url` varchar(255) DEFAULT NULL,
  `auto_delete_submission_files` enum('yes','no') NOT NULL DEFAULT 'yes',
  `submission_strip_tags` enum('yes','no') NOT NULL DEFAULT 'yes',
  `edit_submission_page_label` text,
  `add_submission_button_label` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_form_email_fields`
--

CREATE TABLE `frm1dnc_form_email_fields` (
  `form_email_id` mediumint(8) UNSIGNED NOT NULL,
  `form_id` mediumint(8) UNSIGNED NOT NULL,
  `email_field_id` mediumint(9) NOT NULL,
  `first_name_field_id` mediumint(9) DEFAULT NULL,
  `last_name_field_id` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_form_fields`
--

CREATE TABLE `frm1dnc_form_fields` (
  `field_id` mediumint(8) UNSIGNED NOT NULL,
  `form_id` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `field_name` varchar(255) NOT NULL DEFAULT '',
  `field_test_value` mediumtext,
  `field_size` varchar(255) DEFAULT 'medium',
  `field_type_id` smallint(6) NOT NULL DEFAULT '1',
  `is_system_field` enum('yes','no') NOT NULL DEFAULT 'no',
  `data_type` enum('string','number','date') NOT NULL DEFAULT 'string',
  `field_title` varchar(100) DEFAULT NULL,
  `col_name` varchar(100) DEFAULT NULL,
  `list_order` smallint(5) UNSIGNED DEFAULT NULL,
  `is_new_sort_group` enum('yes','no') NOT NULL DEFAULT 'yes',
  `include_on_redirect` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_hooks`
--

CREATE TABLE `frm1dnc_hooks` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `hook_type` enum('code','template') NOT NULL,
  `component` enum('core','api','module') NOT NULL,
  `filepath` varchar(255) NOT NULL,
  `action_location` varchar(255) NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `params` mediumtext,
  `overridable` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_hooks`
--

INSERT INTO `frm1dnc_hooks` (`id`, `hook_type`, `component`, `filepath`, `action_location`, `function_name`, `params`, `overridable`) VALUES
(1, 'code', 'core', '/global/code/General.class.php', 'main', 'FormTools\\General::checkClientMayView', 'client_id,form_id,view_id,permissions', 'permissions'),
(2, 'code', 'core', '/global/code/General.class.php', 'end', 'FormTools\\General::generateJsMessages', 'js', 'js'),
(3, 'code', 'core', '/global/code/General.class.php', 'end', 'FormTools\\General::displayCustomPageMessage', 'flag', 'found,g_success,g_message'),
(4, 'code', 'core', '/global/code/General.class.php', 'end', 'FormTools\\General::evalSmartyString', 'output,placeholder_str,placeholders,theme', 'output'),
(5, 'code', 'core', '/global/code/General.class.php', 'end', 'FormTools\\General::alterTableColumn', 'table,old_col_name,new_col_name,col_type', ''),
(6, 'code', 'core', '/global/code/General.class.php', 'end', 'FormTools\\General::getSubmissionPlaceholders', 'placeholders', 'placeholders'),
(7, 'code', 'core', '/global/code/Clients.class.php', 'start', 'FormTools\\Clients::updateClient', 'account_id,info', 'info'),
(8, 'code', 'core', '/global/code/Clients.class.php', 'end', 'FormTools\\Clients::updateClient', 'account_id,info', 'success,message'),
(9, 'code', 'core', '/global/code/Clients.class.php', 'end', 'FormTools\\Clients::deleteClient', 'account_id', 'success,message'),
(10, 'code', 'core', '/global/code/Clients.class.php', 'end', 'FormTools\\Clients::disableClient', 'account_id', ''),
(11, 'code', 'core', '/global/code/Clients.class.php', 'end', 'FormTools\\Clients::getClientFormViews', 'account_id,info', 'info'),
(12, 'code', 'core', '/global/code/Clients.class.php', 'start', 'FormTools\\Clients::searchClients', 'search_criteria', 'search_criteria'),
(13, 'code', 'core', '/global/code/Clients.class.php', 'end', 'FormTools\\Clients::searchClients', 'search_criteria,clients', 'clients'),
(14, 'code', 'core', '/global/code/Themes.class.php', 'end', 'FormTools\\Themes::getList', 'theme_info', 'theme_info'),
(15, 'code', 'core', '/global/code/Themes.class.php', 'end', 'FormTools\\Themes::getTheme', 'theme_id,theme_info', 'theme_info'),
(16, 'code', 'core', '/global/code/Themes.class.php', 'end', 'FormTools\\Themes::getThemeByThemeFolder', 'theme_folder,theme_info', 'theme_info'),
(17, 'code', 'core', '/global/code/Themes.class.php', 'main', 'FormTools\\Themes::getPage', 'smarty,template,page_vars', 'smarty'),
(18, 'code', 'core', '/global/code/Themes.class.php', 'end', 'FormTools\\Themes::displayModulePage', 'account_type,module_folder', ''),
(19, 'code', 'core', '/global/code/Themes.class.php', 'main', 'FormTools\\Themes::displayModulePage', 'g_smarty,template,page_vars', 'g_smarty'),
(20, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::getMenuList', 'menus', 'menus'),
(21, 'code', 'core', '/global/code/Menus.class.php', 'middle', 'FormTools\\Menus::getClientMenuPagesDropdown', 'select_lines', 'select_lines'),
(22, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::getList', 'return_hash', 'return_hash'),
(23, 'code', 'core', '/global/code/Menus.class.php', 'middle', 'FormTools\\Menus::getAdminMenuPagesDropdown', 'select_lines', 'select_lines'),
(24, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::getAdminMenu', 'menu_info', 'menu_info'),
(25, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::getClientMenu', 'menu_info', 'menu_info'),
(26, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::getMenuItems', 'menu_items,menu_id', 'menu_items'),
(27, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::updateMenuOrder', 'menu_id', ''),
(28, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::updateAdminMenu', 'success,message,info', 'success,message'),
(29, 'code', 'core', '/global/code/Menus.class.php', 'end', 'FormTools\\Menus::updateClientMenu', 'info', 'success,message'),
(30, 'code', 'core', '/global/code/Menus.class.php', 'start', 'FormTools\\Menus::deleteClientMenu', 'menu_id', ''),
(31, 'code', 'core', '/global/code/OptionLists.class.php', 'end', 'FormTools\\OptionLists::getList', 'return_hash', 'return_hash'),
(32, 'code', 'core', '/global/code/OptionLists.class.php', 'end', 'FormTools\\OptionLists::updateOptionList', 'list_id,info', 'success,message'),
(33, 'code', 'core', '/global/code/OptionLists.class.php', 'end', 'FormTools\\OptionLists::deleteOptionList', 'list_id', 'success,message'),
(34, 'code', 'core', '/global/code/Pages.class.php', 'start', 'FormTools\\Pages::constructPageURL', 'url,page_identifier,custom_options,args', 'url'),
(35, 'code', 'core', '/global/code/Pages.class.php', 'end', 'FormTools\\Pages::getPageUrl', 'page_identifier,params,full_url', 'full_url'),
(36, 'code', 'core', '/global/code/Modules.class.php', 'start', 'FormTools\\Modules::getList', 'modules_info', 'modules_info'),
(37, 'code', 'core', '/global/code/Modules.class.php', 'start', 'FormTools\\Modules::moduleOverrideData', 'location,data', 'data'),
(38, 'code', 'core', '/global/code/Modules.class.php', 'end', 'FormTools\\Modules::getModule', 'module_id,result', 'result'),
(39, 'code', 'core', '/global/code/Modules.class.php', 'start', 'FormTools\\Modules::searchModules', 'search_criteria', 'search_criteria'),
(40, 'code', 'core', '/global/code/Modules.class.php', 'end', 'FormTools\\Modules::uninstallModule', 'module_id,success,message', 'success,message'),
(41, 'code', 'core', '/global/code/Modules.class.php', 'end', 'FormTools\\Modules::includeModule', 'module_folder', ''),
(42, 'code', 'core', '/global/code/OmitLists.class.php', 'end', 'FormTools\\OmitLists::getPublicFormOmitList', 'clients_id,form_id', 'client_ids'),
(43, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::getEmailTemplateList', 'form_id,info', 'info'),
(44, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::createBlankEmailTemplate', 'email_id', ''),
(45, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::getEmailTemplate', 'email_template', 'email_template'),
(46, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::getEmailTemplates', 'form_id,return_hash', 'return_hash'),
(47, 'code', 'core', '/global/code/Emails.class.php', 'start', 'FormTools\\Emails::sendTestEmail', 'info', 'info'),
(48, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::getEmailPatterns', 'text_patterns,html_patterns', 'text_patterns,html_patterns'),
(49, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::setFieldAsEmailField', 'form_id,infohash', ''),
(50, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::unsetFieldAsEmailField', 'form_email_id', ''),
(51, 'code', 'core', '/global/code/Emails.class.php', 'start', 'FormTools\\Emails::updateEmailTemplate', 'email_id,info', 'info'),
(52, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::updateEmailTemplate', 'email_id,info', 'success,message'),
(53, 'code', 'core', '/global/code/Emails.class.php', 'end', 'FormTools\\Emails::getEditSubmissionEmailTemplates', 'view_id,email_info', 'email_info'),
(54, 'code', 'core', '/global/code/Emails.class.php', 'start', 'FormTools\\Emails::processEmailTemplate', 'form_id,submission_id,email_id,email_components', 'email_components'),
(55, 'code', 'core', '/global/code/User.class.php', 'main', 'FormTools\\User->login', 'account_info', 'account_info'),
(56, 'code', 'core', '/global/code/User.class.php', 'start', 'FormTools\\User->checkAuth', 'account_type', 'boot_out_user,message_flag'),
(57, 'code', 'core', '/global/code/User.class.php', 'main', 'FormTools\\User->getAccountPlaceholders', 'placeholders,account_id', 'placeholders'),
(58, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::getFormFieldSettings', 'field_id,settings', 'settings'),
(59, 'code', 'core', '/global/code/Fields.class.php', 'start', 'FormTools\\Fields::getUploadedFiles', 'form_id,field_ids', 'uploaded_files'),
(60, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::getFormFields', 'form_id,infohash', 'infohash'),
(61, 'code', 'core', '/global/code/Fields.class.php', 'start', 'FormTools\\Fields::updateFormFields', 'infohash,form_id', 'infohash'),
(62, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::deleteFormFields', 'removed_fields,form_id,field_ids,success,message', 'success,message'),
(63, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::getFormField', 'field_id,info', 'info'),
(64, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::addFormFieldsAdvanced', 'infohash,form_id', 'success,message'),
(65, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::getFieldOptions', 'field_id,options', 'options'),
(66, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::getExtendedFieldSettings', 'field_id,setting_name', 'settings'),
(67, 'code', 'core', '/global/code/Fields.class.php', 'end', 'FormTools\\Fields::updateField', 'field_id', 'success,message'),
(68, 'code', 'core', '/global/code/Administrator.class.php', 'main', 'FormTools\\Administrator::getAdminInfo', 'admin_info', 'admin_info'),
(69, 'code', 'core', '/global/code/Administrator.class.php', 'start', 'FormTools\\Administrator::addClient', 'form_vals', 'form_vals'),
(70, 'code', 'core', '/global/code/Administrator.class.php', 'end', 'FormTools\\Administrator::addClient', 'new_user_id,account_settings', 'success,message'),
(71, 'code', 'core', '/global/code/Administrator.class.php', 'start', 'FormTools\\Administrator::updateAdminAccount', 'infohash,account_id', 'infohash'),
(72, 'code', 'core', '/global/code/Administrator.class.php', 'end', 'FormTools\\Administrator::updateAdminAccount', 'infohash,account_id', 'success,message'),
(73, 'code', 'core', '/global/code/Administrator.class.php', 'start', 'FormTools\\Administrator::adminUpdateClient', 'infohash,tab_num', 'infohash,tab_num'),
(74, 'code', 'core', '/global/code/Administrator.class.php', 'end', 'FormTools\\Administrator::adminUpdateClient', 'infohash,tab_num', 'success,message'),
(75, 'code', 'core', '/global/code/Files.class.php', 'start', 'FormTools\\Files::deleteSubmissionFiles', 'form_id,file_field_info', 'success,problems'),
(76, 'code', 'core', '/global/code/Files.class.php', 'end', 'FormTools\\Files::getUniqueFilename', 'return_filename', 'return_filename'),
(77, 'code', 'core', '/global/code/ModuleMenu.class.php', 'end', 'FormTools\\ModuleMenu::getMenuItems', 'menu_items,module_id,module_folder', 'menu_items'),
(78, 'code', 'core', '/global/code/ViewTabs.class.php', 'end', 'FormTools\\ViewTabs::getViewTabs', 'view_id,tab_info', 'tab_info'),
(79, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getViews', 'return_hash', 'return_hash'),
(80, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getViewIds', 'view_ids', 'view_ids'),
(81, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::createView', 'view_id', ''),
(82, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::deleteView', 'view_id', 'success,message'),
(83, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getViewList', 'form_id,result', 'result'),
(84, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getNewViewSubmissionDefaults', 'results,view_id', 'results'),
(85, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getViewClients', 'account_info', 'account_info'),
(86, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::updateView', 'view_id,info', 'success,message'),
(87, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getFormViews', 'view_hash', 'view_hash'),
(88, 'code', 'core', '/global/code/Views.class.php', 'end', 'FormTools\\Views::getView', 'view_id,view_info', 'view_info'),
(89, 'code', 'core', '/global/code/Forms.class.php', 'start', 'FormTools\\Forms::searchForms', 'account_id,is_admin,search_criteria', 'search_criteria'),
(90, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::searchForms', 'account_id,is_admin,search_criteria,form_info', 'form_info'),
(91, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::getForm', 'form_id,form_info', 'form_info'),
(92, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::getFormClients', 'form_id,accounts', 'accounts'),
(93, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::setFormMainSettings', 'infohash,success,message', 'success,message'),
(94, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::finalizeForm', 'form_id', ''),
(95, 'code', 'core', '/global/code/Forms.class.php', 'start', 'FormTools\\Forms::setFormFieldTypes', 'info,form_id', 'info'),
(96, 'code', 'core', '/global/code/Forms.class.php', 'start', 'FormTools\\Forms::deleteForm', 'form_id', ''),
(97, 'code', 'core', '/global/code/Forms.class.php', 'start', 'FormTools\\Forms::clientUpdateFormSettings', 'infohash', 'infohash'),
(98, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::clientUpdateFormSettings', 'infohash,success,message', 'success,message'),
(99, 'code', 'core', '/global/code/Forms.class.php', 'start', 'FormTools\\Forms::updateFormMainTab', 'infohash,form_id', 'infohash'),
(100, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::updateFormMainTab', 'infohash,form_id,success,message', 'success,message'),
(101, 'code', 'core', '/global/code/Forms.class.php', 'start', 'FormTools\\Forms::updateFormFieldsTab', 'infohash,form_id', 'infohash'),
(102, 'code', 'core', '/global/code/Forms.class.php', 'delete_fields', 'FormTools\\Forms::updateFormFieldsTab', 'deleted_field_ids,infohash,form_id', ''),
(103, 'code', 'core', '/global/code/Forms.class.php', 'end', 'FormTools\\Forms::updateFormFieldsTab', 'infohash,field_info,form_id', 'success,message'),
(104, 'code', 'core', '/global/code/Settings.class.php', 'end', 'FormTools\\Settings::updateMainSettings', 'settings', 'success,message'),
(105, 'code', 'core', '/global/code/Settings.class.php', 'end', 'FormTools\\Settings::updateAccountSettings', 'settings', 'success,message'),
(106, 'code', 'core', '/global/code/Settings.class.php', 'end', 'FormTools\\Settings::updateFileSettings', 'infohash', 'success,message'),
(107, 'code', 'core', '/global/code/Settings.class.php', 'end', 'FormTools\\Settings::updateThemeSettings', 'infohash', 'success,message'),
(108, 'code', 'core', '/global/code/ViewFilters.class.php', 'start', 'FormTools\\ViewFilters::getViewFilterSql', 'placeholders,is_client_account', 'placeholders,is_client_account'),
(109, 'code', 'core', '/global/code/Accounts.class.php', 'main', 'FormTools\\Accounts::getAccountSettings', 'account_id,hash', 'hash'),
(110, 'code', 'core', '/global/code/Accounts.class.php', 'start', 'FormTools\\Accounts::setAccountSettings', 'account_id,settings', 'settings'),
(111, 'code', 'core', '/global/code/Accounts.class.php', 'end', 'FormTools\\Accounts::setAccountSettings', 'account_id,settings', ''),
(112, 'code', 'core', '/global/code/Accounts.class.php', 'main', 'FormTools\\Accounts::getAccountInfo', 'account_info', 'account_info'),
(113, 'code', 'core', '/global/code/Accounts.class.php', 'start', 'FormTools\\Accounts::sendPassword', 'info', 'info'),
(114, 'code', 'core', '/global/code/Accounts.class.php', 'end', 'FormTools\\Accounts::sendPassword', 'success,message,info', 'success,message'),
(115, 'code', 'core', '/global/code/Submissions.class.php', 'start', 'FormTools\\Submissions::processFormSubmission', 'form_info,form_id,form_data', 'form_data'),
(116, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::processFormSubmission', 'form_id,submission_id', ''),
(117, 'code', 'core', '/global/code/Submissions.class.php', 'manage_files', 'FormTools\\Submissions::processFormSubmission', 'form_id,submission_id,file_fields,redirect_query_params', 'success,message,redirect_query_params'),
(118, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::createBlankSubmission', 'form_id,now,ip,new_submission_id', ''),
(119, 'code', 'core', '/global/code/Submissions.class.php', 'start', 'FormTools\\Submissions::deleteSubmission', 'form_id,view_id,submission_id,is_admin', ''),
(120, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::deleteSubmission', 'form_id,view_id,submission_id,is_admin', 'success,message'),
(121, 'code', 'core', '/global/code/Submissions.class.php', 'start', 'FormTools\\Submissions::deleteSubmissions', 'form_id,view_id,submissions_to_delete,omit_list,search_fields,is_admin', 'submission_ids'),
(122, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::deleteSubmissions', 'form_id,view_id,submissions_to_delete,omit_list,search_fields,is_admin', 'success,message'),
(123, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::getSubmission', 'form_id,submission_id,view_id,return_arr', 'return_arr'),
(124, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::getSubmissionInfo', 'form_id,submission_id,submission', 'submission'),
(125, 'code', 'core', '/global/code/Submissions.class.php', 'start', 'FormTools\\Submissions::updateSubmission', 'form_id,submission_id,infohash', 'infohash'),
(126, 'code', 'core', '/global/code/Submissions.class.php', 'manage_files', 'FormTools\\Submissions::updateSubmission', 'form_id,submission_id,file_fields', 'success,message'),
(127, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::updateSubmission', 'form_id,submission_id,infohash', 'success,message'),
(128, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::searchSubmissions', 'form_id,submission_id,view_id,results_per_page,page_num,order,columns,search_fields,submission_ids,return_hash', 'return_hash'),
(129, 'code', 'core', '/global/code/Submissions.class.php', 'main', 'FormTools\\Submissions::displaySubmissionListingQuicklinks', 'context', 'quicklinks'),
(130, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::copySubmissions', 'form_id,submission_id_map', ''),
(131, 'code', 'core', '/global/code/Submissions.class.php', 'end', 'FormTools\\Submissions::copySubmission', 'form_id,submission_id_map', ''),
(132, 'template', 'core', '/themes/default/modules_header.tpl', 'modules_head_top', '', '', ''),
(133, 'template', 'core', '/themes/default/modules_header.tpl', 'modules_head_bottom', '', '', ''),
(134, 'template', 'core', '/themes/default/header.tpl', 'head_top', '', '', ''),
(135, 'template', 'core', '/themes/default/header.tpl', 'head_bottom', '', '', ''),
(136, 'template', 'core', '/themes/default/clients/forms/index.tpl', 'client_submission_listings_top', '', '', ''),
(137, 'template', 'core', '/themes/default/clients/forms/index.tpl', 'client_submission_listings_buttons1', '', '', ''),
(138, 'template', 'core', '/themes/default/clients/forms/index.tpl', 'client_submission_listings_buttons2', '', '', ''),
(139, 'template', 'core', '/themes/default/clients/forms/index.tpl', 'client_submission_listings_buttons3', '', '', ''),
(140, 'template', 'core', '/themes/default/clients/forms/index.tpl', 'client_submission_listings_buttons4', '', '', ''),
(141, 'template', 'core', '/themes/default/clients/forms/index.tpl', 'client_submission_listings_bottom', '', '', ''),
(142, 'template', 'core', '/themes/default/clients/forms/edit_submission.tpl', 'client_edit_submission_top', '', '', ''),
(143, 'template', 'core', '/themes/default/clients/forms/edit_submission.tpl', 'client_edit_submission_bottom', '', '', ''),
(144, 'template', 'core', '/themes/default/clients/account/tab_settings.tpl', 'edit_client_settings_top', '', '', ''),
(145, 'template', 'core', '/themes/default/clients/account/tab_settings.tpl', 'edit_client_settings_bottom', '', '', ''),
(146, 'template', 'core', '/themes/default/clients/account/tab_main.tpl', 'edit_client_main_top', '', '', ''),
(147, 'template', 'core', '/themes/default/clients/account/tab_main.tpl', 'edit_client_main_middle', '', '', ''),
(148, 'template', 'core', '/themes/default/clients/account/tab_main.tpl', 'edit_client_main_bottom', '', '', ''),
(149, 'template', 'core', '/themes/default/admin/forms/add/index.tpl', 'add_form_page', '', '', ''),
(150, 'template', 'core', '/themes/default/admin/forms/index.tpl', 'admin_forms_list_top', '', '', ''),
(151, 'template', 'core', '/themes/default/admin/forms/index.tpl', 'admin_forms_form_type_label', '', '', ''),
(152, 'template', 'core', '/themes/default/admin/forms/index.tpl', 'admin_forms_list_bottom', '', '', ''),
(153, 'template', 'core', '/themes/default/admin/forms/option_lists/tab_main.tpl', 'edit_option_list_main', '', '', ''),
(154, 'template', 'core', '/themes/default/admin/forms/option_lists/index.tpl', 'option_list_button_row', '', '', ''),
(155, 'template', 'core', '/themes/default/admin/forms/edit/tab_main.tpl', 'admin_edit_form_main_tab_form_type_dropdown', '', '', ''),
(156, 'template', 'core', '/themes/default/admin/forms/edit/tab_main.tpl', 'admin_edit_form_main_tab_after_main_settings', '', '', ''),
(157, 'template', 'core', '/themes/default/admin/forms/edit/tab_main.tpl', 'admin_edit_form_main_tab_button_row', '', '', ''),
(158, 'template', 'core', '/themes/default/admin/forms/edit/index.tpl', 'admin_edit_form_content', '', '', ''),
(159, 'template', 'core', '/themes/default/admin/forms/edit/tab_edit_view__filters.tpl', 'admin_edit_view_client_map_filter_dropdown', '', '', ''),
(160, 'template', 'core', '/themes/default/admin/forms/edit/tab_edit_email_tab2.tpl', 'edit_template_tab2', '', '', ''),
(161, 'template', 'core', '/themes/default/admin/forms/edit/tab_views.tpl', 'admin_edit_form_views_tab_button_row', '', '', ''),
(162, 'template', 'core', '/themes/default/admin/forms/edit/tab_fields.tpl', 'admin_edit_form_fields_tab_button_row', '', '', ''),
(163, 'template', 'core', '/themes/default/admin/forms/edit/tab_edit_email_tab1.tpl', 'edit_template_tab1', '', '', ''),
(164, 'template', 'core', '/themes/default/admin/forms/edit/tab_edit_email_tab1.tpl', 'edit_template_tab1_advanced', '', '', ''),
(165, 'template', 'core', '/themes/default/admin/forms/edit_submission.tpl', 'admin_edit_submission_top', '', '', ''),
(166, 'template', 'core', '/themes/default/admin/forms/edit_submission.tpl', 'admin_edit_submission_bottom', '', '', ''),
(167, 'template', 'core', '/themes/default/admin/forms/submissions.tpl', 'admin_submission_listings_top', '', '', ''),
(168, 'template', 'core', '/themes/default/admin/forms/submissions.tpl', 'admin_submission_listings_buttons1', '', '', ''),
(169, 'template', 'core', '/themes/default/admin/forms/submissions.tpl', 'admin_submission_listings_buttons2', '', '', ''),
(170, 'template', 'core', '/themes/default/admin/forms/submissions.tpl', 'admin_submission_listings_buttons3', '', '', ''),
(171, 'template', 'core', '/themes/default/admin/forms/submissions.tpl', 'admin_submission_listings_buttons4', '', '', ''),
(172, 'template', 'core', '/themes/default/admin/forms/submissions.tpl', 'admin_submission_listings_bottom', '', '', ''),
(173, 'template', 'core', '/themes/default/admin/clients/tab_settings.tpl', 'admin_edit_client_settings_top', '', '', ''),
(174, 'template', 'core', '/themes/default/admin/clients/tab_settings.tpl', 'admin_edit_client_settings_bottom', '', '', ''),
(175, 'template', 'core', '/themes/default/admin/clients/tab_main.tpl', 'admin_edit_client_main_top', '', '', ''),
(176, 'template', 'core', '/themes/default/admin/clients/tab_main.tpl', 'admin_edit_client_main_middle', '', '', ''),
(177, 'template', 'core', '/themes/default/admin/clients/tab_main.tpl', 'admin_edit_client_main_bottom', '', '', ''),
(178, 'template', 'core', '/themes/default/admin/clients/index.tpl', 'admin_list_clients_top', '', '', ''),
(179, 'template', 'core', '/themes/default/admin/clients/index.tpl', 'admin_list_clients_bottom', '', '', ''),
(180, 'template', 'core', '/themes/default/admin/clients/add.tpl', 'admin_add_client_top', '', '', ''),
(181, 'template', 'core', '/themes/default/admin/clients/add.tpl', 'admin_add_client_bottom', '', '', ''),
(182, 'template', 'core', '/themes/default/admin/clients/tab_forms.tpl', 'admin_edit_client_forms_top', '', '', ''),
(183, 'template', 'core', '/themes/default/admin/clients/tab_forms.tpl', 'admin_edit_client_forms_bottom', '', '', ''),
(184, 'template', 'core', '/themes/default/admin/clients/edit.tpl', 'admin_edit_client_pages_top', '', '', ''),
(185, 'template', 'core', '/themes/default/admin/clients/edit.tpl', 'admin_edit_client_pages_bottom', '', '', ''),
(186, 'template', 'core', '/themes/default/admin/account/index.tpl', 'admin_account_top', '', '', ''),
(187, 'template', 'core', '/themes/default/admin/account/index.tpl', 'admin_account_bottom', '', '', ''),
(188, 'template', 'core', '/themes/default/admin/settings/tab_main.tpl', 'admin_settings_main_tab_bottom', '', '', ''),
(189, 'template', 'core', '/themes/default/admin/settings/tab_edit_client_menu.tpl', 'admin_settings_client_menu_top', '', '', ''),
(190, 'template', 'core', '/themes/default/admin/settings/tab_files.tpl', 'admin_settings_files_bottom', '', '', ''),
(191, 'template', 'core', '/themes/default/admin/settings/tab_edit_admin_menu.tpl', 'admin_settings_admin_menu_top', '', '', ''),
(192, 'template', 'core', '/themes/default/admin/settings/tab_accounts.tpl', 'admin_settings_client_settings_bottom', '', '', ''),
(193, 'template', 'core', '/themes/default/admin/settings/tab_menus.tpl', 'admin_settings_menus_top', '', '', ''),
(194, 'template', 'core', '/themes/default/admin/themes/index.tpl', 'admin_settings_themes_bottom', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_hook_calls`
--

CREATE TABLE `frm1dnc_hook_calls` (
  `hook_id` mediumint(8) UNSIGNED NOT NULL,
  `hook_type` enum('code','template') NOT NULL DEFAULT 'code',
  `action_location` varchar(100) NOT NULL,
  `module_folder` varchar(255) NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `hook_function` varchar(255) NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '50'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_hook_calls`
--

INSERT INTO `frm1dnc_hook_calls` (`hook_id`, `hook_type`, `action_location`, `module_folder`, `function_name`, `hook_function`, `priority`) VALUES
(1, 'code', 'main', 'data_visualization', 'FormTools\\Submissions::displaySubmissionListingQuicklinks', 'addQuicklink', 50),
(2, 'template', 'head_bottom', 'data_visualization', '', 'includeInHead', 50),
(3, 'code', 'start', 'data_visualization', 'FormTools\\Forms::deleteForm', 'deleteFormHook', 50),
(4, 'template', 'data_visualization', 'data_visualization', '', 'displayInPagesModule', 50),
(5, 'template', 'admin_submission_listings_bottom', 'export_manager', '', 'displayExportOptions', 50),
(6, 'template', 'client_submission_listings_bottom', 'export_manager', '', 'displayExportOptions', 50),
(7, 'code', 'manage_files', 'field_type_file', 'FormTools\\Submissions::updateSubmission', 'updateSubmissionHook', 50),
(8, 'code', 'manage_files', 'field_type_file', 'FormTools\\Submissions::processFormSubmission', 'processFormSubmissionHook', 50),
(9, 'code', 'manage_files', 'field_type_file', 'FormTools\\API->processFormSubmission', 'apiProcessFormSubmissionHook', 50),
(10, 'code', 'start', 'field_type_file', 'FormTools\\Files::deleteSubmissionFiles', 'deleteSubmissionsHook', 50),
(11, 'code', 'start', 'field_type_file', 'FormTools\\Fields::getUploadedFiles', 'getUploadedFilesHook', 50),
(12, 'template', 'head_bottom', 'field_type_file', '', 'includeJs', 50),
(13, 'template', 'standalone_form_fields_head_bottom', 'field_type_file', '', 'includeStandaloneJs', 50),
(14, 'template', 'add_form_page', 'form_builder', '', 'displayAddFormOption', 50),
(15, 'template', 'admin_edit_form_main_tab_form_type_dropdown', 'form_builder', '', 'displayFormTypeOption', 50),
(16, 'template', 'admin_forms_form_type_label', 'form_builder', '', 'displayFormBuilderLabel', 50),
(17, 'template', 'admin_edit_form_content', 'form_builder', '', 'displayPublishTab', 50),
(18, 'code', 'start', 'form_builder', 'FormTools\\Modules::moduleOverrideData', 'inlineDataOverride', 50),
(19, 'code', 'end', 'form_builder', 'FormTools\\General::displayCustomPageMessage', 'displayFormCreatedMessage', 50),
(20, 'code', 'start', 'form_builder', 'FormTools\\Forms::deleteForm', 'onDeleteForm', 50),
(21, 'code', 'end', 'form_builder', 'FormTools\\Views::deleteView', 'onDeleteView', 50),
(22, 'code', 'middle', 'pages', 'FormTools\\Menus::getAdminMenuPagesDropdown', 'addPagesMenuItems', 20),
(23, 'code', 'middle', 'pages', 'FormTools\\Menus::getClientMenuPagesDropdown', 'addPagesMenuItems', 20),
(24, 'template', 'edit_template_tab2', 'swift_mailer', '', 'swift_display_extra_fields_tab2', 50),
(25, 'code', 'end', 'swift_mailer', 'ft_create_blank_email_template', 'swift_map_email_template_field', 50),
(26, 'code', 'end', 'swift_mailer', 'ft_delete_email_template', 'swift_delete_email_template_field', 50),
(27, 'code', 'end', 'swift_mailer', 'ft_update_email_template', 'swift_update_email_template_append_extra_fields', 50),
(28, 'code', 'end', 'swift_mailer', 'ft_get_email_template', 'swift_get_email_template_append_extra_fields', 50),
(29, 'template', 'head_bottom', 'field_type_tinymce', '', 'includeFiles', 50),
(30, 'template', 'standalone_form_fields_head_bottom', 'field_type_tinymce', '', 'includeStandaloneFiles', 50);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_list_groups`
--

CREATE TABLE `frm1dnc_list_groups` (
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `group_type` varchar(50) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `custom_data` text NOT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_list_groups`
--

INSERT INTO `frm1dnc_list_groups` (`group_id`, `group_type`, `group_name`, `custom_data`, `list_order`) VALUES
(1, 'field_types', '{$LANG.phrase_standard_fields}', '', 1),
(2, 'field_types', '{$LANG.phrase_special_fields}', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_menus`
--

CREATE TABLE `frm1dnc_menus` (
  `menu_id` smallint(5) UNSIGNED NOT NULL,
  `menu` varchar(255) NOT NULL,
  `menu_type` enum('admin','client') NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_menus`
--

INSERT INTO `frm1dnc_menus` (`menu_id`, `menu`, `menu_type`) VALUES
(1, 'Administrator', 'admin'),
(2, 'Client Menu', 'client');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_menu_items`
--

CREATE TABLE `frm1dnc_menu_items` (
  `menu_item_id` mediumint(8) UNSIGNED NOT NULL,
  `menu_id` mediumint(8) UNSIGNED NOT NULL,
  `display_text` varchar(100) NOT NULL,
  `page_identifier` varchar(50) NOT NULL,
  `custom_options` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_submenu` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_new_sort_group` enum('yes','no') NOT NULL DEFAULT 'yes',
  `list_order` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_menu_items`
--

INSERT INTO `frm1dnc_menu_items` (`menu_item_id`, `menu_id`, `display_text`, `page_identifier`, `custom_options`, `url`, `is_submenu`, `is_new_sort_group`, `list_order`) VALUES
(1, 1, 'Forms', 'admin_forms', '', '/admin/forms/', 'no', 'yes', 1),
(2, 1, 'Add Form', 'add_form_choose_type', '', '/admin/forms/add/', 'yes', 'no', 2),
(3, 1, 'Option Lists', 'option_lists', '', '/admin/forms/option_lists/', 'yes', 'no', 3),
(4, 1, 'Clients', 'clients', '', '/admin/clients/', 'no', 'yes', 4),
(5, 1, 'Modules', 'modules', '', '/admin/modules/', 'no', 'yes', 5),
(6, 1, 'Themes', 'settings_themes', '', '/admin/themes/', 'no', 'yes', 6),
(7, 1, 'Settings', 'settings', '', '/admin/settings', 'no', 'yes', 7),
(8, 1, 'Main', 'settings_main', '', '/admin/settings/index.php?page=main', 'yes', 'no', 8),
(9, 1, 'Accounts', 'settings_accounts', '', '/admin/settings/index.php?page=accounts', 'yes', 'no', 9),
(10, 1, 'Files', 'settings_files', '', '/admin/settings/index.php?page=files', 'yes', 'no', 10),
(11, 1, 'Menus', 'settings_menus', '', '/admin/settings/index.php?page=menus', 'yes', 'no', 11),
(12, 1, 'Your Account', 'your_account', '', '/admin/account', 'no', 'yes', 12),
(13, 1, 'Logout', 'logout', '', '/index.php?logout', 'no', 'yes', 13),
(14, 2, 'Forms', 'client_forms', '', '/clients/index.php', 'no', 'yes', 1),
(15, 2, 'Account', 'client_account', '', '/clients/account/index.php', 'no', 'yes', 2),
(16, 2, 'Login Info', 'client_account_login', '', '/clients/account/index.php?page=main', 'yes', 'no', 3),
(17, 2, 'Settings', 'client_account_settings', '', '/clients/account/index.php?page=settings', 'yes', 'no', 4),
(18, 2, 'Logout', 'logout', '', '/index.php?logout', 'no', 'yes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_modules`
--

CREATE TABLE `frm1dnc_modules` (
  `module_id` mediumint(8) UNSIGNED NOT NULL,
  `is_installed` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `origin_language` varchar(50) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `module_folder` varchar(100) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `author_email` varchar(200) DEFAULT NULL,
  `author_link` varchar(255) DEFAULT NULL,
  `module_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_modules`
--

INSERT INTO `frm1dnc_modules` (`module_id`, `is_installed`, `is_enabled`, `origin_language`, `module_name`, `module_folder`, `version`, `author`, `author_email`, `author_link`, `module_date`) VALUES
(1, 'yes', 'yes', 'en_us', 'System Check', 'system_check', '2.1.5', 'Ben Keen', 'ben.keen@gmail.com', 'http://formtools.org', '2019-03-17 00:00:00'),
(2, 'yes', 'yes', 'en_us', 'Swift Mailer', 'swift_mailer', '2.0.7', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2019-05-05 00:00:00'),
(3, 'yes', 'yes', 'en_us', 'Pages', 'pages', '2.0.7', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2019-03-17 00:00:00'),
(4, 'yes', 'yes', 'en_us', 'Form Builder', 'form_builder', '2.0.10', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2018-06-09 00:00:00'),
(5, 'yes', 'yes', 'en_us', 'Export Manager', 'export_manager', '3.1.0', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2019-04-27 00:00:00'),
(6, 'yes', 'yes', 'en_us', 'TinyMCE Field', 'field_type_tinymce', '2.0.8', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2019-03-17 00:00:00'),
(7, 'yes', 'yes', 'en_us', 'Data Visualization', 'data_visualization', '2.1.2', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2019-03-16 00:00:00'),
(8, 'yes', 'yes', 'en_us', 'File Upload', 'field_type_file', '2.2.4', 'Ben Keen', 'ben.keen@gmail.com', 'https://formtools.org', '2019-04-27 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_data_visualizations`
--

CREATE TABLE `frm1dnc_module_data_visualizations` (
  `vis_id` mediumint(8) UNSIGNED NOT NULL,
  `vis_name` varchar(255) NOT NULL,
  `vis_type` enum('activity','field') NOT NULL,
  `chart_type` enum('line_chart','area_chart','column_chart','bar_chart','pie_chart') NOT NULL,
  `form_id` mediumint(9) NOT NULL,
  `view_id` mediumint(9) DEFAULT NULL,
  `field_id` mediumint(9) DEFAULT NULL,
  `access_type` enum('admin','public','private') NOT NULL DEFAULT 'public',
  `access_view_mapping` enum('all','except','only') NOT NULL DEFAULT 'all',
  `access_views` mediumtext NOT NULL,
  `cache_update_frequency` varchar(8) NOT NULL,
  `date_range` varchar(20) DEFAULT NULL,
  `submission_count_group` enum('year','month','week','day') DEFAULT NULL,
  `colour` varchar(10) DEFAULT NULL,
  `line_width` tinyint(4) DEFAULT NULL,
  `field_chart_ignore_empty_fields` enum('yes','no') DEFAULT NULL,
  `pie_chart_format` enum('2D','3D') DEFAULT NULL,
  `include_legend_quicklinks` enum('yes','no') DEFAULT NULL,
  `include_legend_full_size` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_data_visualization_cache`
--

CREATE TABLE `frm1dnc_module_data_visualization_cache` (
  `vis_id` mediumint(8) UNSIGNED NOT NULL,
  `last_cached` datetime NOT NULL,
  `data` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_data_visualization_clients`
--

CREATE TABLE `frm1dnc_module_data_visualization_clients` (
  `vis_id` mediumint(8) UNSIGNED NOT NULL,
  `account_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_export_groups`
--

CREATE TABLE `frm1dnc_module_export_groups` (
  `export_group_id` smallint(5) UNSIGNED NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `access_type` enum('admin','public','private') NOT NULL DEFAULT 'public',
  `form_view_mapping` enum('all','except','only') NOT NULL DEFAULT 'all',
  `forms_and_views` mediumtext,
  `visibility` enum('show','hide') NOT NULL DEFAULT 'show',
  `icon` varchar(100) NOT NULL,
  `action` enum('file','popup','new_window') NOT NULL DEFAULT 'popup',
  `action_button_text` varchar(255) NOT NULL DEFAULT '',
  `content_type` varchar(50) NOT NULL,
  `popup_height` varchar(5) DEFAULT NULL,
  `popup_width` varchar(5) DEFAULT NULL,
  `headers` text,
  `smarty_template` mediumtext NOT NULL,
  `list_order` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_export_groups`
--

INSERT INTO `frm1dnc_module_export_groups` (`export_group_id`, `group_name`, `access_type`, `form_view_mapping`, `forms_and_views`, `visibility`, `icon`, `action`, `action_button_text`, `content_type`, `popup_height`, `popup_width`, `headers`, `smarty_template`, `list_order`) VALUES
(1, 'HTML / Printer-friendly', 'public', 'all', NULL, 'show', 'printer.png', 'popup', 'Display', 'html', '600', '800', '', '<html>\n<head>\n    <title>{$export_group_name}</title>\n    {literal}\n    <style type=\"text/css\">\n    body { margin: 0px; }\n    table, td, tr, div, span {\n        font-family: verdana; font-size: 8pt;\n    }\n    table { empty-cells: show }\n    #nav_row { background-color: #efefef; padding: 10px; }\n    #export_group_name { color: #336699; font-weight:bold }\n    .print_table { border: 1px solid #dddddd; }\n    .print_table th {\n        border: 1px solid #cccccc;\n        background-color: #efefef;\n        text-align: left;\n    }\n    .print_table td { border: 1px solid #cccccc; }\n    .one_item { margin-bottom: 15px; }\n    .page_break { page-break-after: always; }\n    </style>\n    <style type=\"text/css\" media=\"print\">\n    .no_print { display: none }\n    </style>\n    {/literal}\n</head>\n<body>\n    <div id=\"nav_row\" class=\"no_print\">\n        <span style=\"float:right\">\n            {if $page_type != \"file\"}\n                {* if there\'s more than one export type in this group, display the types in a dropdown *}\n                {if $export_types|@count > 1}\n                    <select name=\"export_type_id\" onchange=\"window.location=\'{$same_page}?export_group_id={$export_group_id}&export_group_{$export_group_id}_results={$export_group_results}&export_type_id=\' + this.value\">\n                    {foreach from=$export_types item=export_type}\n                        <option value=\"{$export_type.export_type_id}\" {if $export_type.export_type_id == $export_type_id}selected{/if}>\n                            {eval var=$export_type.export_type_name}\n                        </option>\n                    {/foreach}\n                    </select>\n                {/if}\n            {/if}\n            <input type=\"button\" onclick=\"window.close()\" value=\"{$LANG.word_close}\" />\n            <input type=\"button\" onclick=\"window.print()\" value=\"{$L.word_print}\" />\n        </span>\n        <span id=\"export_group_name\">{eval var=$export_group_name}</span>\n    </div>\n    <div style=\"padding: 15px\">{$export_type_smarty_template}</div>\n</body>\n</html>', 1),
(2, 'Excel', 'public', 'all', NULL, 'show', 'xls.gif', 'new_window', 'Generate', 'text', NULL, NULL, 'Pragma: public\nCache-Control: max-age=0\nContent-Type: application/vnd.ms-excel; charset=utf-8\nContent-Disposition: attachment; filename={$filename}', '<html>\n<head>\n</head>\n<body>\n\n{$export_type_smarty_template}\n\n</body>\n</html>', 2),
(3, 'XML', 'public', 'all', NULL, 'hide', 'xml.jpg', 'new_window', 'Generate', 'text', NULL, NULL, 'Content-type: application/xml; charset=\"octet-stream\"\r\nContent-Disposition: attachment; filename={$filename}', '<?xml version=\"1.0\" encoding=\"utf-8\" ?>\r\n\r\n{$export_type_smarty_template}', 3),
(4, 'CSV', 'public', 'all', NULL, 'hide', 'csv.gif', 'new_window', 'Generate', 'text', NULL, NULL, 'Content-type: text/csv;\r\nContent-Disposition: attachment; filename={$filename}', '{$export_type_smarty_template}', 4);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_export_group_clients`
--

CREATE TABLE `frm1dnc_module_export_group_clients` (
  `export_group_id` mediumint(8) UNSIGNED NOT NULL,
  `account_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_export_types`
--

CREATE TABLE `frm1dnc_module_export_types` (
  `export_type_id` mediumint(8) UNSIGNED NOT NULL,
  `export_type_name` varchar(255) NOT NULL,
  `export_type_visibility` enum('show','hide') NOT NULL DEFAULT 'show',
  `filename` varchar(255) NOT NULL,
  `export_group_id` smallint(6) DEFAULT NULL,
  `smarty_template` text NOT NULL,
  `list_order` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_export_types`
--

INSERT INTO `frm1dnc_module_export_types` (`export_type_id`, `export_type_name`, `export_type_visibility`, `filename`, `export_group_id`, `smarty_template`, `list_order`) VALUES
(1, 'Table format', 'show', 'submissions-{$M}.{$j}.html', 1, '<h1>{$form_name} - {$view_name}</h1>\n\n<table cellpadding=\"2\" cellspacing=\"0\" width=\"100%\" class=\"print_table\">\n<tr>\n    {foreach from=$display_fields item=column}\n    <th>{$column.field_title}</th>\n    {/foreach}\n</tr>\n{strip}\n{foreach from=$submissions item=submission}\n    {assign var=submission_id value=$submission.submission_id}\n    <tr>\n        {foreach from=$display_fields item=field_info}\n            {assign var=col_name value=$field_info.col_name}\n            {assign var=value value=$submission.$col_name}\n            <td>\n                {smart_display_field form_id=$form_id view_id=$view_id submission_id=$submission_id\n                    field_info=$field_info field_types=$field_types settings=$settings value=$value}\n            </td>\n        {/foreach}\n    </tr>\n{/foreach}\n{/strip}\n</table>', 1),
(2, 'One by one', 'show', 'submissions-{$M}.{$j}.html', 1, '<h1>{$form_name} - {$view_name}</h1>\n\n{strip}\n{foreach from=$submissions item=submission}\n    {assign var=submission_id value=$submission.submission_id}\n    <table cellpadding=\"2\" cellspacing=\"0\" width=\"100%\" class=\"print_table one_item\">\n    {foreach from=$display_fields item=field_info}\n        {assign var=col_name value=$field_info.col_name}\n        {assign var=value value=$submission.$col_name}\n        <tr>\n            <th width=\"140\">{$field_info.field_title}</th>\n            <td>\n                {smart_display_field form_id=$form_id view_id=$view_id submission_id=$submission_id field_info=$field_info\n                    field_types=$field_types settings=$settings value=$value}\n            </td>\n        </tr>\n    {/foreach}\n    </table>\n{/foreach}\n{/strip}', 2),
(3, 'One submission per page', 'show', 'submissions-{$M}.{$j}.html', 1, '<h1>{$form_name} - {$view_name}</h1>\n\n{foreach from=$submissions item=submission name=row}\n    {assign var=submission_id value=$submission.submission_id}\n    <table cellpadding=\"2\" cellspacing=\"0\" width=\"100%\" class=\"print_table one_item\">\n    {foreach from=$display_fields item=field_info}\n        {assign var=col_name value=$field_info.col_name}\n        {assign var=value value=$submission.$col_name}\n        <tr>\n            <th width=\"140\">{$field_info.field_title}</th>\n            <td>\n                {smart_display_field form_id=$form_id view_id=$view_id submission_id=$submission_id field_info=$field_info\n                    field_types=$field_types settings=$settings value=$value}\n            </td>\n        </tr>\n    {/foreach}\n    </table>\n    {if !$smarty.foreach.row.last}\n        <div class=\"no_print\"><i>- {$L.phrase_new_page} -</i></div>\n        <br class=\"page_break\" />\n    {/if}\n{/foreach}', 3),
(4, 'Table format', 'show', 'submissions-{$M}.{$j}.xls', 2, '<h1>{$form_name} - {$view_name}</h1>\n\n<table cellpadding=\"2\" cellspacing=\"0\" width=\"100%\" class=\"print_table\">\n<tr>\n    {foreach from=$display_fields item=column}\n    <th>{$column.field_title}</th>\n    {/foreach}\n</tr>\n{strip}\n{foreach from=$submissions item=submission}\n    {assign var=submission_id value=$submission.submission_id}\n    <tr>\n    {foreach from=$display_fields item=field_info}\n        {assign var=col_name value=$field_info.col_name}\n        {assign var=value value=$submission.$col_name}\n        <td>\n            {smart_display_field form_id=$form_id view_id=$view_id submission_id=$submission_id\n                field_info=$field_info field_types=$field_types settings=$settings value=$value escape=\"excel\"}\n        </td>\n    {/foreach}\n</tr>\n{/foreach}\n{/strip}\n</table>', 1),
(5, 'All submissions', 'show', 'form{$form_id}_{$datetime}.xml', 3, '{strip}\n<export>\n    <export_datetime>{$datetime}</export_datetime>\n    <export_unixtime>{$U}</export_unixtime>\n    <form_info>\n        <form_id>{$form_id}</form_id>\n        <form_name><![CDATA[{$form_name}]]></form_name>\n        <form_url>{$form_url}</form_url>\n    </form_info>\n    <view_info>\n        <view_id>{$view_id}</view_id>\n        <view_name><![CDATA[{$view_name}]]></view_name>\n    </view_info>\n    <submissions>\n        {foreach from=$submissions item=submission name=row}\n            <submission>\n            {foreach from=$display_fields item=field_info name=col_row}\n                {assign var=col_name value=$field_info.col_name}\n                {assign var=value value=$submission.$col_name}\n                <{$col_name}><![CDATA[{smart_display_field form_id=$form_id \n                    view_id=$view_id submission_id=$submission.submission_id\n                    field_info=$field_info field_types=$field_types\n                    settings=$settings value=$value}]]></{$col_name}>\n            {/foreach}\n        </submission>\n        {/foreach}\n    </submissions>\n</export>\n{/strip}', 1),
(6, 'All submissions', 'show', 'form{$form_id}_{$datetime}.csv', 4, '{strip}\n{foreach from=$display_fields item=column name=row}\n  {* workaround for an absurd Microsoft Excel problem, in which the first\n     two characters of a file cannot be ID; see:\n     http://support.microsoft.com/kb/323626 *}\n  {if $smarty.foreach.row.first && $column.field_title == \"ID\"}\n    \'ID\n  {else}\n    {$column.field_title|escape:\'csv\'}\n  {/if}\n  {if !$smarty.foreach.row.last},{/if}\n{/foreach}\n{/strip}\n{foreach from=$submissions item=submission name=row}{strip}\n  {foreach from=$display_fields item=field_info name=col_row}\n    {assign var=col_name value=$field_info.col_name}\n    {assign var=value value=$submission.$col_name}\n    {smart_display_field form_id=$form_id view_id=$view_id \n      submission_id=$submission.submission_id field_info=$field_info\n      field_types=$field_types settings=$settings value=$value\n      escape=\"csv\"}\n    {* if this wasn\'t the last row, output a comma *}\n    {if !$smarty.foreach.col_row.last},{/if}\n  {/foreach}{/strip}\n{if !$smarty.foreach.row.last}\n{/if}\n{/foreach}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_forms`
--

CREATE TABLE `frm1dnc_module_form_builder_forms` (
  `published_form_id` mediumint(8) UNSIGNED NOT NULL,
  `is_online` enum('yes','no') NOT NULL,
  `is_published` enum('yes','no') NOT NULL,
  `form_id` mediumint(9) NOT NULL,
  `view_id` mediumint(9) NOT NULL,
  `set_id` mediumint(9) NOT NULL,
  `publish_date` datetime DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `folder_path` mediumtext NOT NULL,
  `folder_url` mediumtext NOT NULL,
  `include_review_page` enum('yes','no') NOT NULL,
  `include_thanks_page_in_nav` enum('yes','no') NOT NULL,
  `thankyou_page_content` mediumtext,
  `form_offline_page_content` mediumtext,
  `review_page_title` varchar(255) DEFAULT NULL,
  `thankyou_page_title` varchar(255) DEFAULT NULL,
  `offline_date` datetime DEFAULT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_form_placeholders`
--

CREATE TABLE `frm1dnc_module_form_builder_form_placeholders` (
  `published_form_id` mediumint(9) NOT NULL,
  `placeholder_id` mediumint(9) NOT NULL,
  `placeholder_value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_form_templates`
--

CREATE TABLE `frm1dnc_module_form_builder_form_templates` (
  `published_form_id` mediumint(9) NOT NULL,
  `template_type` varchar(30) NOT NULL,
  `template_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_templates`
--

CREATE TABLE `frm1dnc_module_form_builder_templates` (
  `template_id` mediumint(8) UNSIGNED NOT NULL,
  `set_id` mediumint(9) NOT NULL,
  `template_type` varchar(30) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `content` mediumtext,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_form_builder_templates`
--

INSERT INTO `frm1dnc_module_form_builder_templates` (`template_id`, `set_id`, `template_type`, `template_name`, `content`, `list_order`) VALUES
(1, 1, 'page_layout', 'Page Layout', '{{header}}\n{{page}}\n{{footer}}', 1),
(2, 1, 'header', 'Header', '<!DOCTYPE html>\n<html>\n<head>\n<title>{{$form_name}}</title>\n  {{$required_resources}}\n  {{$R.styles}}\n</head>\n<body>\n<div class=\"ts_page\" style=\"width:900px\">\n  <div class=\"ts_header\">\n    <h1>{{$form_name}}</h1>\n  </div>\n  <div class=\"ts_content\">\n    <div class=\"ts_content_inner\">', 2),
(3, 1, 'header', 'No Header', '<!DOCTYPE html>\n<html>\n<head>\n<title>{{$form_name}}</title>\n  {{$required_resources}}\n  {{$R.styles}}\n</head>\n<body>\n<div class=\"ts_page\" style=\"width:900px\">\n  <div class=\"ts_content\">\n    <div class=\"ts_content_inner\">', 3),
(4, 1, 'footer', 'Footer', '    </div>\n  </div>\n</div>\n\n</body>\n</html>', 4),
(5, 1, 'form_page', 'Form Page', '{{navigation}}\n\n<h2>{{$page_name}}</h2>\n\n{{error_message}}\n\n<form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\"\n  id=\"ts_form_element_id\" name=\"edit_submission_form\">\n  <input type=\"hidden\" id=\"form_tools_published_form_id\" value=\"{{$published_form_id}}\" />\n{{foreach from=$grouped_fields key=k item=curr_group name=row}}\n  {{assign var=group value=$curr_group.group}}\n  {{assign var=fields value=$curr_group.fields}}\n\n    <a name=\"s{{$group.group_id}}\"></a>\n  {{if $group.group_name}}\n    <h3>{{$group.group_name}}</h3>\n  {{else}}\n    <br />\n  {{/if}}\n\n  {{if $fields|@count > 0}}\n  <table class=\"table_1\" cellpadding=\"1\" cellspacing=\"1\" border=\"0\" width=\"798\">\n  {{/if}}\n    \n  {{foreach from=$fields item=curr_field}}\n    {{assign var=field_id value=$curr_field.field_id}}\n    <tr>\n      <td width=\"180\" valign=\"top\">\n        {{$curr_field.field_title}}\n        <span class=\"req\">{{if $curr_field.is_required}}*{{/if}}</span>\n      </td>\n      <td class=\"answer\" valign=\"top\">\n        <div class=\"pad_left\">\n        {{edit_custom_field form_id=$form_id field_info=$curr_field field_types=$field_types\n          settings=$settings submission_id=$submission_id}}\n        </div>\n      </td>\n    </tr>\n  {{/foreach}}\n\n  {{if $fields|@count > 0}}\n    </table>  \n  {{/if}}\n\n{{/foreach}}\n\n{{continue_block}}\n\n</form>', 5),
(6, 1, 'review_page', 'Review Page', '{{navigation}}\n\n<h2>{{$review_page_title}}</h2>\n\n<form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\">\n{{foreach from=$grouped_fields item=curr_group}}\n  {{assign var=group value=$curr_group.group}}\n  {{assign var=fields value=$curr_group.fields}}\n\n  {{if $fields|@count > 0}}\n    <h3>\n      <a href=\"?page={{$group.custom_data}}#s{{$group.group_id}}\">EDIT</a>\n      {{$group.group_name}}\n    </h3>\n  \n    <table class=\"table_1\" cellpadding=\"1\" cellspacing=\"1\" border=\"0\" width=\"798\">\n  {{/if}}\n\n  {{foreach from=$fields item=curr_field}}\n    {{assign var=field_id value=$curr_field.field_id}}\n    <tr>\n      <td width=\"200\" class=\"pad_left_small\" valign=\"top\">{{$curr_field.field_title}}</td>\n      <td class=\"answer\" valign=\"top\">\n        <div class=\"pad_left\">\n        {{edit_custom_field form_id=$form_id submission_id=$submission_id\n          field_info=$curr_field field_types=$field_types settings=$settings}}\n        </div>\n      </td>\n    </tr>\n  {{/foreach}}\n\n  {{if $fields|@count > 0}}\n    </table>    \n  {{/if}}\n{{/foreach}}\n\n{{continue_block}}\n\n</form>\n', 6),
(7, 1, 'thankyou_page', 'Thankyou Page', '{{navigation}}\n\n{{$thankyou_page_content}}', 7),
(8, 1, 'form_offline_page', 'Form Offline Page', '{{$form_offline_page_content}}', 8),
(9, 1, 'continue_block', 'Continue - Button Only', '<div class=\"ts_continue_button\">\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n</div>', 9),
(10, 1, 'continue_block', 'Continue - Detailed', '<div class=\"ts_continue_block\">\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n  This is page <b>{{$current_page}}</b> of <b>{{$num_pages}}</b>. You must complete \n  all steps in order for your submission to be processed. Please click continue.\n</div>\n\n', 10),
(11, 1, 'navigation', 'Navigation', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li><a href=\"?page={{$i}}\">{{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">{{$page_info.page_name}}</li>\n    {{else}}\n      <li>{{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 11),
(12, 1, 'navigation', 'Navigation - Numbered', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li><a href=\"{{$filename}}?page={{$i}}\">{{$i}}. {{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">{{$i}}. {{$page_info.page_name}}</li>\n    {{else}}\n      <li>{{$i}}. {{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 12),
(13, 1, 'navigation', 'No Navigation', '', 13),
(14, 1, 'error_message', 'Error Message', '{{if $validation_error}}\n  <div class=\"fb_error\">{{$validation_error}}</div>\n{{/if}}', 14),
(15, 2, 'page_layout', 'Page Layout', '{{header}}\n{{page}}\n{{footer}}', 1),
(16, 2, 'header', 'Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  {{$required_resources}}\n  {{$R.styles}}\n  <script>\n  $(function() {\n    $(\"input,textarea,select\").bind(\"focus\", function() {\n      $(this).closest(\"form\").find(\".ts_field\").removeClass(\"ts_field_row_selected\");\n      $(this).closest(\".ts_field\").addClass(\"ts_field_row_selected\");\n    });\n    $(\":text:visible:enabled:first\").focus();\n  });\n  </script>\n</head>\n<body>\n  <div class=\"ts_page\" style=\"width:800px\">\n    <div class=\"ts_content\">\n', 2),
(17, 2, 'footer', 'Footer', '</div> <!-- ends class=\"ts_content\" div -->\n</div> <!-- ends class=\"ts_page\" div -->\n\n</body>\n</html>', 3),
(18, 2, 'form_page', 'Form Page', '{{navigation}}\n\n{{form_builder_edit_link}}\n\n<h2>{{$page_name}}</h2>\n\n{{error_message}}\n\n<form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\" \n  id=\"ts_form_element_id\" name=\"edit_submission_form\">\n  <input type=\"hidden\" id=\"form_tools_published_form_id\" value=\"{{$published_form_id}}\" />\n{{foreach from=$grouped_fields key=k item=curr_group name=row}}\n  {{assign var=group value=$curr_group.group}}\n  {{assign var=fields value=$curr_group.fields}}\n  \n  <a name=\"s{{$group.group_id}}\"></a>\n  {{if $group.group_name}}\n    <h3>{{$group.group_name|upper}}</h3>\n  {{else}}\n    <br />\n  {{/if}}\n\n  {{foreach from=$fields item=curr_field}}\n    <ul class=\"ts_field\">\n      <li class=\"ts_field_label\">\n        {{$curr_field.field_title}}\n        <span class=\"req\">{{if $curr_field.is_required}}*{{/if}}</span>\n      </li>\n      <li>\n        {{edit_custom_field form_id=$form_id field_info=$curr_field field_types=$field_types\n          settings=$settings submission_id=$submission_id}}\n      </li>\n    </ul>\n  {{/foreach}}\n\n  {{if $fields|@count > 0}}\n    <br />\n  {{/if}}\n{{/foreach}}\n\n{{continue_block}}\n    \n</form>', 4),
(19, 2, 'review_page', 'Review Page', '{{navigation}}\n\n{{form_builder_edit_link}}\n\n<h2>{{$review_page_title}}</h2>\n\n<p>\n  Please review the information below to confirm it is correct. If you need to edit any\n  values, just click the EDIT link at the top right of the section.\n</p>\n\n<form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\">\n{{foreach from=$grouped_fields item=curr_group}}\n  {{assign var=group value=$curr_group.group}}\n  {{assign var=fields value=$curr_group.fields}}\n\n  {{if $fields|@count > 0}}\n  <h3><a href=\"?page={{$group.custom_data|default:1}}#s{{$group.group_id}}\">EDIT</a>{{$group.group_name|upper}}</h3>\n \n    <table class=\"ts_review_table\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" width=\"100%\">\n  {{/if}}\n\n  {{foreach from=$fields item=curr_field}}\n    <tr>\n      <td valign=\"top\" width=\"200\">{{$curr_field.field_title}}</td>\n      <td valign=\"top\">\n        {{edit_custom_field form_id=$form_id submission_id=$submission_id\n          field_info=$curr_field field_types=$field_types settings=$settings}}\n      </td>\n    </tr>\n  {{/foreach}}\n\n  {{if $fields|@count > 0}}\n    </table>\n    \n    <br />\n  {{/if}}\n{{/foreach}}\n\n{{continue_block}}\n\n</form>\n', 5),
(20, 2, 'thankyou_page', 'Thankyou Page', '{{navigation}}\n\n{{form_builder_edit_link}}\n\n{{$thankyou_page_content}}\n', 6),
(21, 2, 'form_offline_page', 'Form Offline Page', '{{$form_offline_page_content}}', 7),
(22, 2, 'continue_block', 'Continue - Simple', '<div>\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n</div>', 8),
(23, 2, 'continue_block', 'Continue - Detailed', '<div class=\"ts_continue_block\">\n  <input type=\"submit\" value=\"Continue\" name=\"form_tools_continue\">  \n  This is page <b>{{$current_page}}</b> of <b>{{$num_pages}}</b>. You must complete all steps in order for your submission to be processed. Please click continue.\n</div>\n', 9),
(24, 2, 'navigation', 'Navigation - 1', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li><a href=\"?page={{$i}}\">{{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">{{$page_info.page_name}}</li>\n    {{else}}\n      <li>{{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 10),
(25, 2, 'navigation', 'Navigation - 2', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li><a href=\"{{$filename}}?page={{$i}}\">{{$i}}. {{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">{{$i}}. {{$page_info.page_name}}</li>\n    {{else}}\n      <li>{{$i}}. {{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 11),
(26, 2, 'navigation', 'Navigation - 3', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li><a href=\"{{$filename}}?page={{$i}}\">&raquo; {{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">&raquo; {{$page_info.page_name}}</li>\n    {{else}}\n      <li>&raquo; {{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 12),
(27, 2, 'navigation', 'Navigation - None', '', 13),
(28, 2, 'error_message', 'Error Message', '{{if $validation_error}}\n  <div class=\"fb_error\">{{$validation_error}}</div>\n{{/if}}\n', 14),
(29, 3, 'page_layout', 'Page Layout', '{{header}}\n{{page}}\n{{footer}}', 1),
(30, 3, 'header', 'Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  <link href=\"http://fonts.googleapis.com/css?family={{$P.font|regex_replace:\'/[ ]/\':\'+\'}}\" rel=\'stylesheet\' type=\'text/css\'>  \n  {{$required_resources}}\n  {{$R.styles}}\n</head>\n<body>\n  <div class=\"ts_page\" style=\"width:900px\">\n    <div class=\"ts_header\">\n      {{form_builder_edit_link}}\n      <h1>{{$form_name}}</h1>\n    </div>\n\n', 2),
(31, 3, 'header', 'No Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  {{$required_resources}}\n  {{$R.styles}}\n</head>\n<body>\n  <div class=\"ts_page\" style=\"width:900px\">\n\n', 3),
(32, 3, 'footer', 'Footer', '  <div class=\"ts_footer\"></div>\n</div> <!-- ends class=\"ts_page\" div -->\n\n</body>\n</html>', 4),
(33, 3, 'form_page', 'Form Page', '{{navigation}}\n\n<div class=\"ts_content\">\n  <div class=\"ts_content_inner\">\n\n  <h2>{{$page_name}}</h2>\n\n  {{error_message}}\n\n  <form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\"\n    id=\"ts_form_element_id\" name=\"edit_submission_form\">\n    <input type=\"hidden\" id=\"form_tools_published_form_id\" value=\"{{$published_form_id}}\" />\n  {{foreach from=$grouped_fields key=k item=curr_group name=row}}\n    {{assign var=group value=$curr_group.group}}\n    {{assign var=fields value=$curr_group.fields}}\n\n      <a name=\"s{{$group.group_id}}\"></a>\n    {{if $group.group_name}}\n      <h3>{{$group.group_name}}</h3>\n    {{else}}\n      <br />\n    {{/if}}\n\n    {{if $fields|@count > 0}}\n    <table class=\"table_1\" cellpadding=\"1\" cellspacing=\"1\" border=\"0\" width=\"798\">\n    {{/if}}\n    \n    {{foreach from=$fields item=curr_field}}\n      <tr>\n        <td width=\"180\" valign=\"top\">\n          {{$curr_field.field_title}}\n          <span class=\"req\">{{if $curr_field.is_required}}*{{/if}}</span>\n        </td>\n        <td class=\"answer\" valign=\"top\">\n          <div class=\"pad_left\">\n          {{edit_custom_field form_id=$form_id field_info=$curr_field field_types=$field_types\n            settings=$settings submission_id=$submission_id}}\n          </div>\n        </td>\n      </tr>\n    {{/foreach}}\n\n    {{if $fields|@count > 0}}\n      </table>  \n    {{/if}}\n\n  {{/foreach}}\n\n  {{continue_block}}\n\n  </form>\n    \n  </div>\n</div>\n', 5),
(34, 3, 'review_page', 'Review Page', '{{navigation}}\n\n<div class=\"ts_content\">\n  <div class=\"ts_content_inner\">\n\n  <h2>{{$review_page_title}}</h2>\n\n  <form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\">\n  {{foreach from=$grouped_fields item=curr_group}}\n    {{assign var=group value=$curr_group.group}}\n    {{assign var=fields value=$curr_group.fields}}\n\n    {{if $fields|@count > 0}}\n      <h3>\n        <a href=\"?page={{$group.custom_data}}#s{{$group.group_id}}\">EDIT</a>\n        {{$group.group_name}}\n      </h3>\n  \n      <table class=\"table_1\" cellpadding=\"1\" cellspacing=\"1\" border=\"0\" width=\"798\">\n    {{/if}}\n\n    {{foreach from=$fields item=curr_field}}\n      <tr>\n        <td width=\"200\" class=\"pad_left_small\" valign=\"top\">{{$curr_field.field_title}}</td>\n        <td class=\"answer\" valign=\"top\">\n          <div class=\"pad_left\">\n          {{edit_custom_field form_id=$form_id submission_id=$submission_id\n            field_info=$curr_field field_types=$field_types settings=$settings}}\n          </div>\n        </td>\n      </tr>\n    {{/foreach}}\n\n    {{if $fields|@count > 0}}\n      </table>    \n    {{/if}}\n  {{/foreach}}\n\n  {{continue_block}}\n\n  </form>\n\n  </div>\n</div>\n\n', 6),
(35, 3, 'thankyou_page', 'Thankyou Page', '{{navigation}}\n\n<div class=\"ts_content\">\n  <div class=\"ts_content_inner\">\n    {{$thankyou_page_content}}\n  </div>\n</div>\n', 7),
(36, 3, 'form_offline_page', 'Form Offline Page', '<div class=\"ts_content\">\n  <div class=\"ts_content_inner\">\n    {{$form_offline_page_content}}\n  </div>\n</div>\n', 8),
(37, 3, 'continue_block', 'Continue - Button Only', '<div class=\"ts_continue_button\">\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n</div>', 9),
(38, 3, 'continue_block', 'Continue - Detailed', '<div class=\"ts_continue_block\">\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n  This is page <b>{{$current_page}}</b> of <b>{{$num_pages}}</b>. You must complete \n  all steps in order for your submission to be processed. Please click continue.\n</div>\n\n', 10),
(39, 3, 'navigation', 'Navigation - Arrows', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li class=\"completed_page\"><a href=\"{{$filename}}?page={{$i}}\">&raquo; {{$page_info.page_name}}</a></li>\n    {{elseif $i != $current_page && $current_page == $num_pages}}\n      <li class=\"completed_page\"><span>&raquo; {{$page_info.page_name}}</span></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">&raquo; {{$page_info.page_name}}</li>\n    {{else}}\n      <li>&raquo; {{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 11),
(40, 3, 'navigation', 'Navigation - Numbered', '<ul id=\"css_nav\" class=\"nav_{{$nav_pages|@count}}_pages\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n      <li class=\"completed_page\"><a href=\"{{$filename}}?page={{$i}}\">{{$i}}. {{$page_info.page_name}}</a></li>\n    {{elseif $i != $current_page && $current_page == $num_pages}}\n      <li class=\"completed_page\"><span>{{$i}}. {{$page_info.page_name}}</span></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n      <li class=\"css_nav_current_page\">{{$i}}. {{$page_info.page_name}}</li>\n    {{else}}\n      <li>{{$i}}. {{$page_info.page_name}}</li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 12),
(41, 3, 'navigation', 'No Navigation', '<ul id=\"css_nav\">\n  <li><span></span></li>\n</ul>', 13),
(42, 3, 'error_message', 'Error Message', '{{if $validation_error}}\n  <div class=\"fb_error\">{{$validation_error}}</div>\n{{/if}}\n\n', 14),
(43, 4, 'page_layout', 'Page Layout', '{{header}}\n{{page}}\n{{footer}}', 1),
(44, 4, 'header', 'Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  {{$required_resources}}\n  <link href=\"http://fonts.googleapis.com/css?family=Trykker\" rel=\"stylesheet\" type=\"text/css\">\n  {{$R.styles}}\n</head>\n<body>\n  <div class=\"ts_head_bg\"></div>\n  <div class=\"ts_page\" style=\"width:960px\">\n    <div class=\"ts_header\"><h1>{{$form_name}}</h1></div>\n    {{form_builder_edit_link}}\n\n    <div class=\"ts_content\">\n      \n\n', 2),
(45, 4, 'header', 'No Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  {{$required_resources}}\n  <link href=\"http://fonts.googleapis.com/css?family=Trykker\" rel=\"stylesheet\" type=\"text/css\">\n  {{$R.styles}}\n</head>\n<body>\n  <div class=\"ts_page\" style=\"width:960px\">\n    {{form_builder_edit_link}}\n    <div class=\"ts_content\">', 3),
(46, 4, 'footer', 'Footer', '<div class=\"clear\"></div>\n\n  </div> <!-- ends class=\"ts_content\" div -->\n</div> <!-- ends class=\"ts_page\" div -->\n\n<div id=\"ts_footer\">{{$P.footer_html}}</div>\n\n</body>\n</html>', 4),
(47, 4, 'form_page', 'Form Page', '{{navigation}}\n\n<div class=\"ts_page_content\">\n\n<h2>{{$page_name}}</h2>\n\n{{error_message}}\n\n<form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\"\n  id=\"ts_form_element_id\" name=\"edit_submission_form\">\n  <input type=\"hidden\" id=\"form_tools_published_form_id\" value=\"{{$published_form_id}}\" />\n{{foreach from=$grouped_fields key=k item=curr_group name=row}}\n  {{assign var=group value=$curr_group.group}}\n  {{assign var=fields value=$curr_group.fields}}\n\n  <a name=\"s{{$group.group_id}}\"></a>\n  <fieldset>\n  {{if $group.group_name}}\n    <legend>{{$group.group_name}}</legend>\n  {{/if}}\n\n  {{if $fields|@count > 0}}\n  <table class=\"table_1\" cellpadding=\"1\" cellspacing=\"1\" border=\"0\" width=\"688\">\n  {{/if}}\n    \n  {{foreach from=$fields item=curr_field name=i}}\n    <tr>\n      <td width=\"180\" valign=\"top\" {{if $smarty.foreach.i.last}}class=\"rowN\"{{/if}}>\n        {{$curr_field.field_title}}\n        <span class=\"req\">{{if $curr_field.is_required}}*{{/if}}</span>\n      </td>\n      <td valign=\"top\" {{if $smarty.foreach.i.last}}class=\"rowN\"{{/if}}>\n        {{edit_custom_field form_id=$form_id field_info=$curr_field field_types=$field_types\n          settings=$settings submission_id=$submission_id}}\n      </td>\n    </tr>\n  {{/foreach}}\n\n  {{if $fields|@count > 0}}\n    </table>  \n  {{/if}}\n\n  </fieldset>\n\n{{/foreach}}\n\n{{continue_block}}\n\n</form>\n  \n</div>\n', 5),
(48, 4, 'review_page', 'Review Page', '{{navigation}}\n\n<div class=\"ts_page_content\">\n\n<h2>{{$review_page_title}}</h2>\n\n<form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\">\n{{foreach from=$grouped_fields item=curr_group}}\n  {{assign var=group value=$curr_group.group}}\n  {{assign var=fields value=$curr_group.fields}}\n\n  <fieldset>\n  {{if $fields|@count > 0}}\n    <legend>{{$group.group_name}} <span class=\"edit_link\">(<a \n      href=\"?page={{$group.custom_data}}#s{{$group.group_id}}\">EDIT</a>)</span>\n    </legend>\n\n    <table class=\"table_1\" cellpadding=\"1\" cellspacing=\"1\" border=\"0\" width=\"668\">\n  {{/if}}\n\n  {{foreach from=$fields item=curr_field name=i}}\n    <tr>\n      <td width=\"200\" valign=\"top\" \n        {{if $smarty.foreach.i.last}}class=\"rowN\"{{/if}}>{{$curr_field.field_title}}</td>\n      <td valign=\"top\" {{if $smarty.foreach.i.last}}class=\"rowN\"{{/if}}>\n        {{edit_custom_field form_id=$form_id submission_id=$submission_id\n          field_info=$curr_field field_types=$field_types settings=$settings}}\n      </td>\n    </tr>\n  {{/foreach}}\n\n  {{if $fields|@count > 0}}\n    </table>    \n  {{/if}}\n  </fieldset>\n\n{{/foreach}}\n\n{{continue_block}}\n\n</form>\n  \n</div>\n\n', 6),
(49, 4, 'thankyou_page', 'Thankyou Page', '{{navigation}}\n\n<div class=\"ts_page_content\">\n{{$thankyou_page_content}}  \n</div>\n', 7),
(50, 4, 'form_offline_page', 'Form Offline Page', '{{$form_offline_page_content}}', 8),
(51, 4, 'continue_block', 'Continue - Button Only', '<div class=\"ts_continue_button\">\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n</div>', 9),
(52, 4, 'navigation', 'Navigation', '{{if $current_page == $num_pages}}\n\n<ul id=\"ts_css_nav\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $i != $num_pages}}\n  <li class=\"completed_page\"><div>&raquo; {{$page_info.page_name}}</div></li>\n    {{else}}\n  <li class=\"css_nav_current_page\"><div>&raquo; {{$page_info.page_name}}</div></li>\n    {{/if}}\n  {{/foreach}}\n</ul>\n\n{{else}}\n\n<ul id=\"ts_css_nav\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n  <li class=\"completed_page\"><a href=\"?page={{$i}}\">&raquo; {{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n  <li class=\"css_nav_current_page\"><div>&raquo; {{$page_info.page_name}}</div></li>\n    {{else}}\n  <li><div>&raquo; {{$page_info.page_name}}</div></li>\n    {{/if}}\n  {{/foreach}}\n</ul>\n\n{{/if}}\n\n', 10),
(53, 4, 'navigation', 'Navigation - Numbered', '<ul id=\"ts_css_nav\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n  <li class=\"completed_page\"><a href=\"?page={{$i}}\">{{$i}}. {{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i || $current_page == $num_pages}}\n  <li class=\"css_nav_current_page\"><div>{{$i}}. {{$page_info.page_name}}</div></li>\n    {{else}}\n  <li><div>{{$i}}. {{$page_info.page_name}}</div></li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 11),
(54, 4, 'error_message', 'Error Message', '{{if $validation_error}}\n  <div class=\"fb_error\">{{$validation_error}}</div>\n{{/if}}\n\n', 12),
(55, 5, 'page_layout', 'Page Layout', '{{header}}\n{{page}}\n{{footer}}', 1),
(56, 5, 'header', 'Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"{{$g_root_url}}/global/css/main.css\">\n  {{$required_resources}}\n  {{$R.styles}}\n  <link href=\'http://fonts.googleapis.com/css?family=Lato\' rel=\'stylesheet\' type=\'text/css\'>\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"{{$g_root_url}}/themes/default/css/styles.css\">\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"{{$g_root_url}}/themes/default/css/swatch_{{$P.swatch|lower|regex_replace:\'/[ ]/\':\'_\'}}.css\">\n</head>\n<body>\n  <div id=\"container\">\n    <div id=\"header\">\n      {{form_builder_edit_link}}\n      <h1>{{$form_name|upper}}</h1>\n    </div>\n\n', 2),
(57, 5, 'header', 'No Header', '<!DOCTYPE html>\n<html>\n<head>\n  <title>{{$form_name}}</title>\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"{{$g_root_url}}/global/css/main.css\">\n  {{$required_resources}}\n  {{$R.styles}}\n  <link href=\'http://fonts.googleapis.com/css?family=Lato\' rel=\'stylesheet\' type=\'text/css\'>\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"{{$g_root_url}}/themes/default/css/styles.css\">\n  <link type=\"text/css\" rel=\"stylesheet\" href=\"{{$g_root_url}}/themes/default/css/swatch_{{$P.swatch|lower|regex_replace:\'/[ ]/\':\'_\'}}.css\">\n  <style>body { background-image: none; }</style>\n</head>\n<body>\n  <div id=\"container\">\n      {{form_builder_edit_link}}\n', 3),
(58, 5, 'footer', 'Footer', '      </div>\n    </td>\n  </tr>\n  </table>\n\n</div>\n\n</body>\n</html>', 4),
(59, 5, 'form_page', 'Form Page', '<div id=\"content\">\n  <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n  <tr>\n    <td width=\"180\" valign=\"top\">\n      <div id=\"left_nav\">\n        {{navigation}}\n      </div>\n    </td>\n    <td valign=\"top\">\n      <div style=\"width:740px\">\n        <div class=\"title margin_bottom_large\">{{$page_name}}</div>\n\n        {{error_message}}\n\n        <form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\"\n          id=\"ts_form_element_id\" name=\"edit_submission_form\">\n          <input type=\"hidden\" id=\"form_tools_published_form_id\" value=\"{{$published_form_id}}\" />\n        {{foreach from=$grouped_fields key=k item=curr_group name=row}}\n          {{assign var=group value=$curr_group.group}}\n          {{assign var=fields value=$curr_group.fields}}\n\n        <a name=\"s{{$group.group_id}}\"></a>\n        {{if $group.group_name}}\n        <div class=\"subtitle underline margin_bottom_large\">{{$group.group_name|upper}}</div>\n        {{/if}}\n\n        {{if $fields|@count > 0}}\n        <table class=\"list_table margin_bottom_large\" cellpadding=\"1\" cellspacing=\"1\" \n          border=\"0\" width=\"688\">\n        {{/if}}\n    \n        {{foreach from=$fields item=curr_field name=i}}\n          {{assign var=field_id value=$curr_field.field_id}}\n          <tr>\n            <td width=\"180\" valign=\"top\" class=\"pad_left_small\">\n              {{$curr_field.field_title}}\n              <span class=\"req\">{{if $curr_field.is_required}}*{{/if}}</span>\n            </td>\n            <td valign=\"top\" {{if $smarty.foreach.i.last}}class=\"rowN\"{{/if}}>\n              {{edit_custom_field form_id=$form_id field_info=$curr_field field_types=$field_types\n              settings=$settings submission_id=$submission_id}}\n            </td>\n          </tr>\n        {{/foreach}}\n\n        {{if $fields|@count > 0}}\n          </table>  \n        {{/if}}\n\n      {{/foreach}}\n\n      {{continue_block}}\n\n      </form>\n\n      </div>\n    </td>\n  </tr>\n  </table>\n</div>\n', 5),
(60, 5, 'review_page', 'Review Page', '<div id=\"content\">\n  <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n  <tr>\n    <td width=\"180\" valign=\"top\">\n      <div id=\"left_nav\">\n        {{navigation}}\n      </div>\n    </td>\n    <td valign=\"top\">\n      <div style=\"width:740px\">\n        <div class=\"title margin_bottom_large\">{{$review_page_title}}</div>\n\n        <form action=\"{{$page_url}}\" method=\"post\" enctype=\"multipart/form-data\">\n        {{foreach from=$grouped_fields item=curr_group}}\n          {{assign var=group value=$curr_group.group}}\n          {{assign var=fields value=$curr_group.fields}}\n\n          {{if $fields|@count > 0}}\n            <div class=\"subtitle underline margin_bottom_large\">\n              {{$group.group_name|upper|default:\"&nbsp;\"}}\n              <span class=\"edit_link\">\n                <a href=\"?page={{$group.custom_data}}#s{{$group.group_id}}\">EDIT</a>\n              </span>\n            </div>\n\n            <table class=\"list_table margin_bottom_large\" cellpadding=\"1\" cellspacing=\"1\" \n              border=\"0\" width=\"668\">\n          {{/if}}\n\n          {{foreach from=$fields item=curr_field name=i}}\n            {{assign var=field_id value=$curr_field.field_id}}\n            <tr>\n              <td class=\"pad_left_small\" width=\"200\" valign=\"top\">{{$curr_field.field_title}}</td>\n              <td valign=\"top\">\n                {{edit_custom_field form_id=$form_id submission_id=$submission_id\n                  field_info=$curr_field field_types=$field_types settings=$settings}}\n              </td>\n            </tr>\n          {{/foreach}}\n\n          {{if $fields|@count > 0}}\n            </table>    \n          {{/if}}\n \n        {{/foreach}}\n\n        {{continue_block}}\n\n      </form>\n\n      </div>\n    </td>\n  </tr>\n  </table>\n</div>\n', 6),
(61, 5, 'thankyou_page', 'Thankyou Page', '<div id=\"content\">\n  <table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">\n  <tr>\n    <td width=\"180\" valign=\"top\">\n      <div id=\"left_nav\">\n        {{navigation}}\n      </div>\n    </td>\n    <td valign=\"top\">\n      <div style=\"width:740px\">\n      {{$thankyou_page_content}} \n      </div>\n    </td>\n  </tr>\n  </table>\n</div>\n\n', 7),
(62, 5, 'form_offline_page', 'Form Offline Page', '<div id=\"content\">\n  {{$form_offline_page_content}}\n</div>', 8),
(63, 5, 'continue_block', 'Continue - Button Only', '<div class=\"ts_continue_button\">\n  <input type=\"submit\" name=\"form_tools_continue\" value=\"Continue\" />\n</div>', 9),
(64, 5, 'navigation', 'Navigation', '<ul id=\"ts_css_nav\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n  \n  {{if $current_page > $i && $current_page != $num_pages}}\n  \n  <li class=\"nav_link_submenu completed_page\"><a href=\"?page={{$i}}\">{{$page_info.page_name}}</a></li>\n  \n  {{elseif $current_page == $i}}\n  \n  <li class=\"css_nav_current_page\"><div>{{$page_info.page_name}}</div></li>\n    {{else}}\n  <li><div>{{$page_info.page_name}}</div></li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 10),
(65, 5, 'navigation', 'Navigation - Numbered', '<ul id=\"ts_css_nav\">\n  {{foreach from=$nav_pages item=page_info name=row}}\n    {{assign var=i value=$smarty.foreach.row.iteration}}\n    {{if $current_page > $i && $current_page != $num_pages}}\n    <li class=\"nav_link_submenu completed_page\"><a href=\"?page={{$i}}\">{{$i}}. {{$page_info.page_name}}</a></li>\n    {{elseif $current_page == $i}}\n    <li class=\"css_nav_current_page\"><div>{{$i}}. {{$page_info.page_name}}</div></li>\n    {{else}}\n    <li><div>{{$i}}. {{$page_info.page_name}}</div></li>\n    {{/if}}\n  {{/foreach}}\n</ul>', 11),
(66, 5, 'error_message', 'Error Message', '{{if $validation_error}}\n  <div class=\"ft_message error margin_bottom_large\">\n    <div style=\"padding:8px\">\n      {{$validation_error}}\n    </div>\n  </div>\n{{/if}}\n\n', 12);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_template_sets`
--

CREATE TABLE `frm1dnc_module_form_builder_template_sets` (
  `set_id` mediumint(8) UNSIGNED NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `version` varchar(20) NOT NULL,
  `description` mediumtext,
  `is_complete` enum('yes','no') NOT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_form_builder_template_sets`
--

INSERT INTO `frm1dnc_module_form_builder_template_sets` (`set_id`, `set_name`, `version`, `description`, `is_complete`, `list_order`) VALUES
(1, 'Default Template Set', '1.2', 'A neutral, grey-themed set of templates that lets you choose a highlight colour to match your site.', 'yes', 1),
(2, 'ProSimple', '1.3', 'A simple, professional-looking and attractive grey-themed Template Set without a header. It contains placeholders to let you choose the highlight colour, font and font size. Labels are placed directly above the fields to provide clear identification.', 'yes', 2),
(3, 'Conformist', '1.2', 'A clean blue Template Set with delicate CSS3 gradients and tab-like, top-row page navigation.', 'yes', 3),
(4, 'Illuminate', '1.1', 'A bold, bright-coloured theme with choice of colour set and footer content. Navigation is required and displayed as a left column. Uses the \"Trykker\" Google Web Font for a little extra snap!', 'yes', 4),
(5, 'Theme - Default', '1.1', 'A form template set based on the same styles as the default Form Tools user interface. Complete with choice of swatches!', 'yes', 5);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_template_set_placeholders`
--

CREATE TABLE `frm1dnc_module_form_builder_template_set_placeholders` (
  `placeholder_id` mediumint(8) UNSIGNED NOT NULL,
  `set_id` mediumint(9) NOT NULL,
  `placeholder_label` varchar(255) NOT NULL,
  `placeholder` varchar(255) NOT NULL,
  `field_type` enum('textbox','textarea','password','radios','checkboxes','select','multi-select') NOT NULL,
  `field_orientation` enum('horizontal','vertical','na') NOT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `field_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_form_builder_template_set_placeholders`
--

INSERT INTO `frm1dnc_module_form_builder_template_set_placeholders` (`placeholder_id`, `set_id`, `placeholder_label`, `placeholder`, `field_type`, `field_orientation`, `default_value`, `field_order`) VALUES
(1, 1, 'Highlight Colours', 'colours', 'select', 'na', 'Blue-Grey', 1),
(2, 2, 'Colour Palette', 'colours', 'select', 'na', 'Green', 1),
(3, 2, 'Font', 'font', 'select', 'na', 'Verdana', 2),
(4, 2, 'Font Size', 'font_size', 'select', 'na', '9pt', 3),
(5, 3, 'Title Font', 'font', 'select', 'na', 'Italianno', 1),
(6, 3, 'Title Font Size', 'font_size', 'select', 'na', '44px', 2),
(7, 4, 'Colours', 'colours', 'select', 'na', 'Orange', 1),
(8, 4, 'Footer HTML', 'footer_html', 'textarea', 'horizontal', '', 2),
(9, 5, 'Swatch', 'swatch', 'select', 'na', 'Orange', 1);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_template_set_placeholder_opts`
--

CREATE TABLE `frm1dnc_module_form_builder_template_set_placeholder_opts` (
  `placeholder_id` mediumint(9) NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `field_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_form_builder_template_set_placeholder_opts`
--

INSERT INTO `frm1dnc_module_form_builder_template_set_placeholder_opts` (`placeholder_id`, `option_text`, `field_order`) VALUES
(1, 'Red', 1),
(1, 'Orange', 2),
(1, 'Yellow', 3),
(1, 'Green', 4),
(1, 'Blue', 5),
(1, 'Blue-Grey', 6),
(1, 'Grey', 7),
(2, 'Blue', 1),
(2, 'Green', 2),
(2, 'Orange', 3),
(2, 'Purple', 4),
(3, 'Arial', 1),
(3, 'Georgia, Verdana', 2),
(3, '\"Lucida Grande\",\"Lucida Sans Unicode\", Tahoma, sans-serif', 3),
(3, 'Tahoma', 4),
(3, 'Verdana', 5),
(4, '8pt', 1),
(4, '9pt', 2),
(4, '10pt', 3),
(4, '11pt', 4),
(4, '12pt', 5),
(5, 'Aladin', 1),
(5, 'Alegreya SC', 2),
(5, 'Alike Angular', 3),
(5, 'Almendra SC', 4),
(5, 'Chango', 5),
(5, 'Fredericka the Great', 6),
(5, 'Frijole', 7),
(5, 'Gudea', 8),
(5, 'Italianno', 9),
(5, 'Jim Nightshade', 10),
(5, 'Lustria', 11),
(5, 'Miss Fajardose', 12),
(5, 'Montez', 13),
(5, 'Telex', 14),
(5, 'Yesteryear', 15),
(6, '20px', 1),
(6, '22px', 2),
(6, '24px', 3),
(6, '26px', 4),
(6, '28px', 5),
(6, '30px', 6),
(6, '32px', 7),
(6, '34px', 8),
(6, '36px', 9),
(6, '38px', 10),
(6, '40px', 11),
(6, '42px', 12),
(6, '44px', 13),
(6, '46px', 14),
(6, '48px', 15),
(6, '50px', 16),
(6, '52px', 17),
(6, '54px', 18),
(6, '56px', 19),
(6, '58px', 20),
(6, '60px', 21),
(7, 'Red', 1),
(7, 'Orange', 2),
(7, 'Green', 3),
(7, 'Blue', 4),
(7, 'Black', 5),
(7, 'Grey', 6),
(7, 'White', 7),
(9, 'Aquamarine', 1),
(9, 'Blue', 2),
(9, 'Dark Blue', 3),
(9, 'Green', 4),
(9, 'Grey', 5),
(9, 'Light Brown', 6),
(9, 'Orange', 7),
(9, 'Purple', 8),
(9, 'Red', 9),
(9, 'Yellow', 10);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_form_builder_template_set_resources`
--

CREATE TABLE `frm1dnc_module_form_builder_template_set_resources` (
  `resource_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_type` enum('css','js') NOT NULL,
  `template_set_id` mediumint(8) UNSIGNED NOT NULL,
  `resource_name` varchar(255) NOT NULL,
  `placeholder` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `last_updated` datetime NOT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_form_builder_template_set_resources`
--

INSERT INTO `frm1dnc_module_form_builder_template_set_resources` (`resource_id`, `resource_type`, `template_set_id`, `resource_name`, `placeholder`, `content`, `last_updated`, `list_order`) VALUES
(1, 'css', 1, 'General Styles', 'styles', 'body {\n  text-align: center;\n  padding: 0px;\n  margin: 0px;\n  background-color: #efefef;\n}\ntd, th, p, input, textarea, select,ul,li,div, span {\n  font-family: \"Lucida Grande\",\"Lucida Sans Unicode\", Tahoma, sans-serif;\n  font-size: 12px;\n  color: #555555;\n}\ntd, th, p, textarea, ul,li, div {\n  line-height: 22px;\n}\na:link, a:visited {\n  color: #336699;\n}\ntable {\n  empty-cells: show;\n}\n\n/* page sections */\n.ts_page:after {\n  -moz-transform: translate(0pt, 0pt);\n  background: none repeat scroll 0 0 transparent;\n  border-radius: 20px 20px 20px 20px;\n  box-shadow: 15px 0 30px rgba(0, 0, 0, 0.2);\n  content: \"\";\n  left: 0;\n  position: absolute;\n  width: 100%;\n  z-index: -2;\n}\n.ts_page {\n  margin: 40px auto;\n  position: relative;\n  text-align: left;\n}\n.ts_header {\n  background: none repeat scroll 0 0 rgba(0, 0, 0, 0.5);\n  border: 3px solid #CCCCCC;\n  height: 140px;\n  background: #3a3a3a; /* Old browsers */\n  background: -moz-linear-gradient(45deg,  #777777 0%, #999999 100%); /* FF3.6+ */\n  background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,#777777), color-stop(100%,#999999)); /* Chrome,Safari4+ */\n  background: -webkit-linear-gradient(45deg,  #777777 0%,#999999 100%); /* Chrome10+,Safari5.1+ */\n  background: -o-linear-gradient(45deg,  #777777 0%,#999999 100%); /* Opera 11.10+ */\n  background: -ms-linear-gradient(45deg,  #777777 0%,#999999 100%); /* IE10+ */\n  background: linear-gradient(45deg,  #777777 0%,#999999 100%); /* W3C */\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#777777\', endColorstr=\'#999999\',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */\n  box-shadow: 0 1px 12px rgba(0, 0, 0, 0.1);\n}\n.ts_header h1 {\n  margin: 56px 50px;\n  padding: 0px;\n  font-size: 20px;\n  color: white;\n}\n.ts_content {\n  background-color: white;\n  border: 1px solid #CCCCCC;\n  box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);\n  padding: 25px 50px;\n}\n.ts_continue_block {\n  margin-top: 16px;\n  background-color: #ffffdd;\n  padding: 8px;\n  box-shadow:1px 2px 2px #878787;\n}\n.ts_continue_block input {\n  float: right;\n}\n.ts_continue_button {\n  margin-top: 12px;\n}\n.highlighted_cell {\n  color: #990000;\n  background-color: #ffffee;\n  text-align: center;\n}\n.light_grey {\n  color: #999999;\n}\nh2 {\n  font-size: 24px;\n}\nh3 {\n  border-top-left-radius: 4px;\n  border-top-right-radius: 4px;\n  -webkit-border-top-left-radius: 4px;\n  -webkit-border-top-right-radius: 4px;\n  -moz-border-radius-topleft: 4px;\n  -moz-border-radius-topright: 4px;\n  font-size: 12px;\n  font-weight: normal;\n  margin-bottom: 0;\n  margin-right: 1px;\n  padding: 1px 0 0 5px;\n  width: 792px;\n  height: 22px;\n}\nh3 a:link, h3 a:visited {\n  background-color: white;\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n  color: black;\n  float: right;\n  line-height: 17px;\n  margin-right: 3px;\n  margin-top: 2px;\n  padding: 0 8px;\n  text-decoration: none;\n}\nh3 a:hover {\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\n\n/* navigation */\nul#css_nav {\n  clear: both;\n  width:100%;\n  margin: 0px;\n  padding: 0px;\n  overflow: hidden;\n}\nul#css_nav li {\n  float: left;\n  background-color: #efefef;\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n  list-style: none;\n  text-align:center;\n  margin: 0px 2px 20px 0px;\n  color: #666666;\n  font-size: 11px;\n  line-height: 20px;\n}\nul#css_nav li span {\n  font-size: 11px;\n  line-height: 20px;\n}\n\nul#css_nav li.css_nav_current_page {\n  background-color: #999999;\n  color: white;\n}\nul#css_nav li a:link, ul#css_nav li a:visited {\n  display: block;\n  text-decoration: none;\n  color: white;\n  background-color: #999999;\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\nul#css_nav li a:hover {\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\n.nav_1_pages li {\n  width: 100%;\n}\n.nav_2_pages li {\n  width: 49.7%;\n}\n.nav_3_pages li {\n  width: 33%;\n}\n.nav_4_pages li {\n  width: 24.7%;\n}\n.nav_5_pages li {\n  width: 19.7%;\n}\n.nav_6_pages li {\n  width: 16.4%;\n}\n.nav_7_pages li {\n  width: 14%;\n}\n.nav_8_pages li {\n  width: 12.2%;\n}\n\n/* notifications */\n.notify {\n  border: 1px solid #336699;\n  background-color: #ffffee;\n  color: #336699;\n  padding: 8px;\n  width: 400px;\n}\n.notify li { color: #336699; }\n.error {\n  font-size: 8pt;\n  border: 1px solid #cc0000;\n  background-color: #ffffee;\n  color: #cc0000;\n  padding: 8px;\n  width: 550px;\n}\n.error span {\n  color: #cc0000;\n  font-weight: bold;\n  margin-bottom: 4px;\n}\n\n/* forms */\ntable.table_1 > tbody > tr > td {\n  border-bottom: 1px solid #dddddd;\n}\n.table_1_bg td {\n  padding: 1px;\n  padding-left: 1px;\n  background-color: #336699;\n  border-bottom: 1px solid #cccccc;\n}\ntd.answer {\n  background-color: #efefef;\n}\n.pad_left {\n  padding-left: 4px;\n}\n.req {\n  color: #aa0000;\n}\n.fb_error {\n  border: 1px solid #990000;\n  padding: 8px;\n  background-color: #ffefef;\n}\n\n/* for the code / markup editor */\n.editor {\n  background-color: white;\n  border: 1px solid #999999;\n  padding: 3px;\n}\n\n\n/* - - - \"Highlight Colour\" placeholder conditional CSS - - -*/\n{{if $P.colours == \"Red\"}}\nh3 {\n  background-color: #cc3131;\n  color: white;\n}\nul#css_nav li a:hover {\n  background-color: #861e1e;\n}\nh3 a:hover {\n  background-color: #fac1c1;\n  color: black;\n}\n{{elseif $P.colours == \"Orange\"}}\nh3 {\n  background-color: #ff9c00;\n  color: white;\n}\nul#css_nav li a:hover {\n  background-color: #4c3512;\n}\nh3 a:hover {\n  background-color: #ffefd5;\n  color: black;\n}\n{{elseif $P.colours == \"Yellow\"}}\nh3 {\n  background-color: #FAEC0C;\n  color: #777777;\n}\nul#css_nav li a:hover {\n  background-color: #595900;\n}\nh3 a:hover {\n  background-color: #444000;\n  color: #ffffcc;\n}\n{{elseif $P.colours == \"Green\"}}\nh3 {\n  background-color: #009211;\n  color: white;\n}\nul#css_nav li a:hover {\n  background-color: #004608;\n}\nh3 a:hover {\n  background-color: #daf4dd;\n  color: black;\n}\n{{elseif $P.colours == \"Blue\"}}\nh3 {\n  background-color: #2969c9;\n  color: white;\n}\nh3 a:hover {\n  background-color: #a6c8f0;\n  color: black;\n}\nul#css_nav li a:hover {\n  background-color: #1e4580;\n}\n{{elseif $P.colours == \"Grey\"}}\nh3 {\n  background-color: #777777;\n  color: white;\n}\nul#css_nav li a:hover {\n  background-color: #333333;\n}\nh3 a:hover {\n  background-color: #222222;\n  color: white;\n}\n{{else}}\nh3 {\n  background-color: #6D8AAC;\n  color: white;\n}\nul#css_nav li a:hover {\n  background-color: #2e425a;\n}\nh3 a:hover {\n  background-color: #c9e2ff;\n  color: black;\n}\n{{/if}}\n', '2022-05-25 14:10:15', 1),
(2, 'css', 2, 'General Styles', 'styles', '{{if $P.colours == \"Blue\"}}\n  {{assign var=header_bg value=\"#388ef4\"}}\n  {{assign var=border_colour value=\"#C4DFFF\"}}\n  {{assign var=selected_row_bg value=\"#d5e8ff\"}}\n  {{assign var=selected_row_bottom value=\"#d5e8ff\"}}\n  {{assign var=content_border value=\"#94c5fe\"}}\n  {{assign var=continue_block_colour value=\"#f1f7ff\"}}\n{{elseif $P.colours == \"Green\"}}\n  {{assign var=header_bg value=\"#0b9c00\"}}\n  {{assign var=border_colour value=\"#e7ffe5\"}}\n  {{assign var=selected_row_bg value=\"#d9f4cb\"}}\n  {{assign var=selected_row_bottom value=\"#d9f4cb\"}}\n  {{assign var=content_border value=\"#ade0aa\"}}\n  {{assign var=continue_block_colour value=\"#E9F9E7\"}}\n{{elseif $P.colours == \"Purple\"}}\n  {{assign var=header_bg value=\"#ac52ce\"}}\n  {{assign var=border_colour value=\"#f7e0ff\"}}\n  {{assign var=selected_row_bg value=\"#f6dfff\"}}\n  {{assign var=selected_row_bottom value=\"#f6dfff\"}}\n  {{assign var=content_border value=\"#e9c1f8\"}}\n  {{assign var=continue_block_colour value=\"#ffffcc\"}}\n{{elseif $P.colours == \"Orange\"}}\n  {{assign var=header_bg value=\"#ffa904\"}}\n  {{assign var=border_colour value=\"#ffa904\"}}\n  {{assign var=selected_row_bg value=\"#ffd789\"}}\n  {{assign var=selected_row_bottom value=\"#ffa904\"}}\n  {{assign var=content_border value=\"#CE911A\"}}\n  {{assign var=continue_block_colour value=\"#f1f7ff\"}}\n{{/if}}\n\nbody {\n  text-align: center;\n  padding: 0px;\n  margin: 0px;\n  background-color: #999999;\n}\ntd, th, p, input, textarea, select,ul,li,div, span {\n  font-family: {{$P.font}};\n  font-size: {{$P.font_size}};\n  color: #555555;\n}\ntd, th, p, textarea, ul,li, div {\n  line-height: 22px;\n}\na:link, a:visited {\n  color: #336699;\n}\ntable {\n  empty-cells: show;\n}\n#form_builder__edit_link {\n  float: right;\n}\n.req {\n  color: #aa0000;\n}\n.fb_error {\n  margin-top: 16px;\n  padding: 8px;\n  box-shadow: 1px 2px 2px #878787;\n  background-color: #ffefef;\n}\n\n\n/* page sections */\n.ts_page:after {\n  -moz-transform: translate(0pt, 0pt);\n  background: none repeat scroll 0 0 transparent;\n  border-radius: 20px 20px 20px 20px;\n  box-shadow: 15px 0 30px rgba(0, 0, 0, 0.2);\n  content: \"\";\n  left: 0;\n  position: absolute;\n  width: 100%;\n  z-index: -2;\n}\n.ts_page {\n  margin: 20px auto 0px;\n  background: #ccc;\n  position:relative;\n  box-shadow: 1px 6px 11px rgba(0, 0, 0, 0.36);\n  -moz-box-shadow: 1px 6px 11px rgba(0, 0, 0, 0.36);\n  -webkit-box-shadow: 1px 6px 11px rgba(0, 0, 0, 0.36);\n  text-align: left;\n  border: 5px solid {{$border_colour}};\n}\n.ts_header {\n  background: none repeat scroll 0 0 rgba(0, 0, 0, 0.5);\n  border: 3px solid #CCCCCC;\n  height: 140px;\n  background: #3a3a3a; /* Old browsers */\n  background: -moz-linear-gradient(45deg,  #777777 0%, #999999 100%); /* FF3.6+ */\n  background: -webkit-gradient(linear, left bottom, right top, color-stop(0%,#3a3a3a), color-stop(100%,#4f4f4f)); /* Chrome,Safari4+ */\n  background: -webkit-linear-gradient(45deg,  #3a3a3a 0%,#4f4f4f 100%); /* Chrome10+,Safari5.1+ */\n  background: -o-linear-gradient(45deg,  #3a3a3a 0%,#4f4f4f 100%); /* Opera 11.10+ */\n  background: -ms-linear-gradient(45deg,  #3a3a3a 0%,#4f4f4f 100%); /* IE10+ */\n  background: linear-gradient(45deg,  #3a3a3a 0%,#4f4f4f 100%); /* W3C */\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#3a3a3a\', endColorstr=\'#4f4f4f\',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */\n  box-shadow: 0 1px 12px rgba(0, 0, 0, 0.1);\n}\n.ts_header h1 {\n  margin: 56px 50px;\n  padding: 0px;\n  font-size: 20px;\n  color: white;\n}\n.ts_content {\n  background-color: white;\n  box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);\n  padding: 25px 50px;\n  border: 1px solid {{$content_border}};\n}\n.ts_continue_block {\n  margin-top: 16px;\n  padding: 8px;\n  box-shadow: 1px 2px 2px #878787;\n  background-color: {{$continue_block_colour}};\n}\n.ts_continue_block input {\n  float: right;\n}\n.ts_field_row_selected {\n  background-color: {{$selected_row_bg}};\n  border-bottom: 1px solid {{$selected_row_bottom}};\n}\n.ts_continue_button {\n  margin-top: 12px;\n}\n.highlighted_cell {\n  color: #990000;\n  background-color: #ffffee;\n  text-align: center;\n}\n.light_grey {\n  color: #999999;\n}\n.ts_field {\n  border-bottom: 1px solid #efefef;\n  padding: 10px 6px 15px;\n  list-style: none;\n  margin: 0px;\n}\n.ts_review_table td {\n  border-bottom: 1px solid #efefef;\n  padding: 3px 5px 2px;\n}\nh2 {\n  font-size: 24px;\n}\nh3 {\n  background-color: {{$header_bg}};\n  color: white;\n  font-size: 12px;\n  font-weight: normal;\n  margin-bottom: 0;\n  padding: 1px 0 0 5px;\n  height: 22px;\n}\nh3 a:link, h3 a:visited {\n  background-color: white;\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n  color: black;\n  float: right;\n  line-height: 17px;\n  margin-right: 3px;\n  margin-top: 2px;\n  padding: 0 8px;\n  text-decoration: none;\n}\nh3 a:hover {\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\n\n/* navigation */\nul#css_nav {\n  clear: both;\n  width:100%;\n  margin: 0px;\n  padding: 0px;\n  overflow: hidden;\n}\nul#css_nav li {\n  float: left;\n  background-color: #efefef;\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n  list-style: none;\n  text-align:center;\n  margin: 0px 2px 20px 0px;\n  color: #666666;\n  font-size: 11px;\n  line-height: 20px;\n}\nul#css_nav li.css_nav_current_page {\n  background-color: #999999;\n  color: white;\n}\nul#css_nav li a:link, ul#css_nav li a:visited {\n  display: block;\n  text-decoration: none;\n  color: white;\n  background-color: #999999;\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\nul#css_nav li a:hover {\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\n.nav_1_pages li {\n  width: 100%;\n}\n.nav_2_pages li {\n  width: 50%;\n}\n.nav_3_pages li {\n  width: 33%;\n}\n.nav_4_pages li {\n  width: 24.7%;\n}\n.nav_5_pages li {\n  width: 19.5%;\n}\n.nav_6_pages li {\n  width: 16%;\n}\n.nav_7_pages li {\n  width: 13%;\n}\n.nav_8_pages li {\n  width: 12%;\n}\n\n/* notifications */\n.notify {\n  border: 1px solid #336699;\n  background-color: #ffffee;\n  color: #336699;\n  padding: 8px;\n  width: 400px;\n}\n.notify li { color: #336699; }\n.error {\n  font-size: 8pt;\n  border: 1px solid #cc0000;\n  background-color: #ffffee;\n  color: #cc0000;\n  padding: 8px;\n  width: 550px;\n}\n.error span {\n  color: #cc0000;\n  font-weight: bold;\n  margin-bottom: 4px;\n}\n\n/* for the code / markup editor */\n.editor {\n  background-color: white;\n  border: 1px solid #999999;\n  padding: 3px;\n}\nul#css_nav li a:hover {\n  background-color: #2e425a;\n}\nh3 a:hover {\n  background-color: #c9e2ff;\n  color: black;\n}\n', '2022-05-25 14:10:15', 1),
(3, 'css', 3, 'General Styles', 'styles', 'html {\nheight: 100%;\n}\nbody {\nheight: 100%;\ntext-align: center;\npadding: 0px;\nmargin: 0px;\nbackground: rgb(106,147,184);\nbackground: -moz-linear-gradient(top,  rgba(106,147,184,1) 0%, rgba(115,151,183,1) 100%);\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(106,147,184,1)), color-stop(100%,rgba(115,151,183,1)));\nbackground: -webkit-linear-gradient(top,  rgba(106,147,184,1) 0%,rgba(115,151,183,1) 100%);\nbackground: -o-linear-gradient(top,  rgba(106,147,184,1) 0%,rgba(115,151,183,1) 100%);\nbackground: -ms-linear-gradient(top,  rgba(106,147,184,1) 0%,rgba(115,151,183,1) 100%);\nbackground: linear-gradient(top,  rgba(106,147,184,1) 0%,rgba(115,151,183,1) 100%);\nfilter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#6a93b8\', endColorstr=\'#7397b7\',GradientType=0 );\nbackground-repeat: no-repeat;\nbackground-attachment: fixed;\n}\ntd, th, p, input, textarea, select,ul,li,div, span {\nfont-family: \"Lucida Grande\",\"Lucida Sans Unicode\", Tahoma, sans-serif;\nfont-size: 12px;\ncolor: #555555;\n}\ntd, th, p, textarea, ul, li, div {\nline-height: 22px;\n}\na:link, a:visited {\ncolor: #336699;\n}\ntable {\nempty-cells: show;\n}\n\n/* page sections */\n.ts_page:after {\n-moz-transform: translate(0pt, 0pt);\nbackground: none repeat scroll 0 0 transparent;\nborder-radius: 20px 20px 20px 20px;\nbox-shadow: 15px 0 30px rgba(0, 0, 0, 0.2);\ncontent: \"\";\nleft: 0;\nposition: absolute;\nwidth: 100%;\nz-index: -2;\n}\n.ts_page {\nmargin: 40px auto;\nposition: relative;\ntext-align: left;\n}\n.ts_header h1 {\nmargin: 0px 0px 42px 20px;\npadding: 0px;\nfont-size: {{$P.font_size}};\ncolor: white;\nfont-family: \"{{$P.font}}\", \"Lucida Grande\", Arial;\nfont-weight: normal;\n}\n.ts_footer {\nbackground: rgb(64,86,107);\nbackground: -moz-linear-gradient(top,  rgb(64,86,107) 0%, rgb(44,61,76) 100%);\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgb(64,86,107)), color-stop(100%,rgb(44,61,76)));\nbackground: -webkit-linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nbackground: -o-linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nbackground: -ms-linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nbackground: linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nfilter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#40566b\', endColorstr=\'#2c3d4c\',GradientType=0 );\n-webkit-border-bottom-left-radius: 6px;\n-webkit-border-bottom-right-radius: 6px;\n-moz-border-radius-bottomleft: 6px;\n-moz-border-radius-bottomright: 6px;\nborder-bottom-left-radius: 6px;\nborder-bottom-right-radius: 6px;\npadding: 10px 0px;\ntext-align: center;\ncolor: #dddddd;\nbox-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);\nheight: 5px;\n}\n.ts_content {\nbackground-color: white;\nborder: 1px solid #777777;\nborder-top: 0px;\nbox-shadow: 0 8px 12px rgba(0, 0, 0, 0.3);\npadding: 25px 50px;\n}\n.ts_continue_block {\nmargin-top: 16px;\nbackground-color: #ffffdd;\npadding: 8px;\nbox-shadow: 1px 2px 2px #878787;\n}\n.ts_continue_block input {\nfloat: right;\n}\n.ts_continue_button {\nmargin-top: 12px;\n}\n.light_grey {\ncolor: #999999;\n}\nh2 {\nfont-size: 20px;\n}\n.ts_heading {\nfont-size: 20px;\n}\n\nh3 {\nborder-top-left-radius: 4px;\nborder-top-right-radius: 4px;\n-webkit-border-top-left-radius: 4px;\n-webkit-border-top-right-radius: 4px;\n-moz-border-radius-topleft: 4px;\n-moz-border-radius-topright: 4px;\nfont-size: 12px;\nfont-weight: normal;\nmargin-bottom: 0;\nmargin-right: 1px;\npadding: 1px 0 0 5px;\nwidth: 792px;\nbackground-color: #36485a;\ncolor: white;\nheight: 22px;\n}\nh3 a:link, h3 a:visited {\nbackground-color: white;\n-webkit-border-radius: 2px;\n-moz-border-radius: 2px;\nborder-radius: 2px;\ncolor: black;\nfloat: right;\nline-height: 17px;\nmargin-right: 3px;\nmargin-top: 2px;\npadding: 0 8px;\ntext-decoration: none;\n}\nh3 a:hover {\n-webkit-border-radius: 2px;\n-moz-border-radius: 2px;\nborder-radius: 2px;\n}\n\n/* navigation */\nul#css_nav {\nclear: both;\nmargin: 0px;\npadding: 0px 40px;\noverflow: hidden;\nbackground: rgb(64,86,107);\nbackground: -moz-linear-gradient(top,  rgb(64,86,107) 0%, rgb(44,61,76) 100%);\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgb(64,86,107)), color-stop(100%,rgb(44,61,76)));\nbackground: -webkit-linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nbackground: -o-linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nbackground: -ms-linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nbackground: linear-gradient(top,  rgb(64,86,107) 0%,rgb(44,61,76) 100%);\nfilter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#40566b\', endColorstr=\'#2c3d4c\',GradientType=0 );\n-webkit-border-top-left-radius: 6px;\n-webkit-border-top-right-radius: 6px;\n-moz-border-radius-topleft: 6px;\n-moz-border-radius-topright: 6px;\nborder-top-left-radius: 6px;\nborder-top-right-radius: 6px;\nheight: 38px;\n}\nul#css_nav li {\nfloat: left;\nlist-style: none;\ntext-align:center;\ncolor: #dddddd;\nfont-size: 11px;\npadding: 8px 0px;\n}\nul#css_nav li span {\nfont-size: 11px;\n}\n\nul#css_nav li.completed_page {\npadding: 0px;\n}\nul#css_nav li.css_nav_current_page {\nbackground: rgb(249,249,249);\nbackground: -moz-linear-gradient(top, rgba(249,249,249,1) 0%, rgba(255,255,255,1) 100%);\nbackground: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(249,249,249,1)), color-stop(100%,rgba(255,255,255,1)));\nbackground: -webkit-linear-gradient(top, rgba(249,249,249,1) 0%,rgba(255,255,255,1) 100%);\nbackground: -o-linear-gradient(top, rgba(249,249,249,1) 0%,rgba(255,255,255,1) 100%);\nbackground: -ms-linear-gradient(top, rgba(249,249,249,1) 0%,rgba(255,255,255,1) 100%);\nbackground: linear-gradient(top,  rgba(249,249,249,1) 0%,rgba(255,255,255,1) 100%);\nfilter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#f9f9f9\', endColorstr=\'#ffffff\',GradientType=0 );\ncolor: #000000;\n}\nul#css_nav li a:link, ul#css_nav li a:visited, ul#css_nav li span {\ndisplay: block;\ntext-decoration: none;\ncolor: white;\nbackground-color: #333333;\npadding: 8px 0px;\nopacity: 0.5;\nfilter: alpha(opacity=50);\n}\nul#css_nav li a:hover {\nbackground-color: #222222;\nopacity: 0.9;\nfilter: alpha(opacity=90);\n}\n\n.nav_1_pages li {\nwidth: 150px;\n}\n.nav_2_pages li {\nwidth: 150px;\n}\n.nav_3_pages li {\nwidth: 150px;\n}\n.nav_4_pages li {\nwidth: 150px;\n}\n.nav_5_pages li {\nwidth: 150px;\n}\n.nav_6_pages li {\nwidth: 136px;\n}\n.nav_7_pages li {\nwidth: 116px;\n}\n.nav_8_pages li {\nwidth: 102px;\n}\n\n\n/* notifications */\n.notify {\nborder: 1px solid #336699;\nbackground-color: #ffffee;\ncolor: #336699;\npadding: 8px;\nwidth: 400px;\n}\n.notify li { color: #336699; }\n.error {\nfont-size: 8pt;\nborder: 1px solid #cc0000;\nbackground-color: #ffffee;\ncolor: #cc0000;\npadding: 8px;\nwidth: 550px;\n}\n.error span {\ncolor: #cc0000;\nfont-weight: bold;\nmargin-bottom: 4px;\n}\n\n/* forms */\ntable.table_1 > tbody > tr > td {\nborder-bottom: 1px solid #dddddd;\n}\n.table_1_bg td {\npadding: 1px;\npadding-left: 1px;\nbackground-color: #336699;\nborder-bottom: 1px solid #cccccc;\n}\ntd.answer {\nbackground-color: #efefef;\n}\n.pad_left {\npadding-left: 4px;\n}\n.req {\ncolor: #aa0000;\n}\n.fb_error {\nborder: 1px solid #990000;\npadding: 8px;\nbackground-color: #ffefef;\n}\n\n/* for the code / markup editor */\n.editor {\nbackground-color: white;\nborder: 1px solid #999999;\npadding: 3px;\n}\n#form_builder__edit_link {\nposition: absolute;\nright: 5px;\ntop: 0px;\ntext-decoration: none;\n}\n#form_builder__edit_link:hover {\ncolor: #990000;\ntext-decoration: underline;\n}\n', '2022-05-25 14:10:15', 1),
(4, 'css', 4, 'General Styles', 'styles', '{{* This top section defines the colours, based on the selected Colour placeholder *}}\n{{assign var=header_colour value=\"#ffffff\"}}\n{{assign var=header_shadow value=\"on\"}}\n{{if $P.colours == \"Red\"}}\n  {{assign var=c1 value=\"#950000\"}}\n  {{assign var=c2 value=\"#af0a0a\"}}\n  {{assign var=link_colour value=\"#ffffcc\"}}\n  {{assign var=line value=\"#670000\"}}\n  {{assign var=fieldset_bg value=\"#780404\"}}\n  {{assign var=fieldset_lines value=\"#660909\"}}\n  {{assign var=fieldset_colour value=\"#FFFF99\"}}\n  {{assign var=fieldset_shadow value=\"on\"}}\n  {{assign var=font_colour value=\"#ffffff\"}}\n  {{assign var=page_heading value=\"#000000\"}}\n  {{assign var=nav_next_page value=\"#999999\"}}\n  {{assign var=nav_prev_page_text value=\"#999999\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#D78B00\"}}\n  {{assign var=nav_prev_page_border value=\"#999999\"}}\n  {{assign var=submit_btn_over value=\"#ff3c00\"}}\n  {{assign var=edit_link_colour value=\"#ffffff\"}}\n{{elseif $P.colours == \"Orange\"}}\n  {{assign var=c1 value=\"#ffa500\"}}\n  {{assign var=c2 value=\"#ffb12b\"}}\n  {{assign var=link_colour value=\"#990000\"}}\n  {{assign var=line value=\"#ffc558\"}}\n  {{assign var=fieldset_bg value=\"#ef9c00\"}}\n  {{assign var=fieldset_lines value=\"#d28900\"}}\n  {{assign var=fieldset_colour value=\"#FFFF99\"}}\n  {{assign var=fieldset_shadow value=\"on\"}}\n  {{assign var=font_colour value=\"#333333\"}}\n  {{assign var=page_heading value=\"#ffffff\"}}\n  {{assign var=nav_next_page value=\"#555555\"}}\n  {{assign var=nav_prev_page_text value=\"#AF8D4F\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#D78B00\"}}\n  {{assign var=nav_prev_page_border value=\"#E69500\"}}\n  {{assign var=submit_btn_over value=\"#ff3c00\"}}\n  {{assign var=edit_link value=\"#990000\"}}\n{{elseif $P.colours == \"Green\"}}\n  {{assign var=c1 value=\"#299a0b\"}}\n  {{assign var=c2 value=\"#31a612\"}}\n  {{assign var=link_colour value=\"#FFFF99\"}}\n  {{assign var=line value=\"#1c7e00\"}}\n  {{assign var=fieldset_bg value=\"#228a00\"}}\n  {{assign var=fieldset_lines value=\"#1e7d00\"}}\n  {{assign var=fieldset_colour value=\"#FFFF99\"}}\n  {{assign var=fieldset_shadow value=\"on\"}}\n  {{assign var=font_colour value=\"#eeeeee\"}}\n  {{assign var=page_heading value=\"#333333\"}}\n  {{assign var=nav_next_page value=\"#0f4f00\"}}\n  {{assign var=nav_prev_page_text value=\"#136600\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#135205\"}}\n  {{assign var=nav_prev_page_border value=\"#1e710b\"}}\n  {{assign var=submit_btn_over value=\"#0093E8\"}}\n  {{assign var=edit_link value=\"#990000\"}}\n{{elseif $P.colours == \"Blue\"}}\n  {{assign var=c1 value=\"#0083cf\"}}\n  {{assign var=c2 value=\"#0690e0\"}}\n  {{assign var=link_colour value=\"#FFFF99\"}}\n  {{assign var=line value=\"#0c5e8d\"}}\n  {{assign var=fieldset_bg value=\"#0878b8\"}}\n  {{assign var=fieldset_lines value=\"#0669a2\"}}\n  {{assign var=fieldset_colour value=\"#FFFF99\"}}\n  {{assign var=fieldset_shadow value=\"on\"}}\n  {{assign var=font_colour value=\"#eeeeee\"}}\n  {{assign var=page_heading value=\"#222222\"}}\n  {{assign var=nav_next_page value=\"#333333\"}}\n  {{assign var=nav_prev_page_text value=\"#efefef\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#3396e2\"}}\n  {{assign var=nav_prev_page_border value=\"#cccccc\"}}\n  {{assign var=submit_btn_over value=\"#621111\"}}\n  {{assign var=edit_link value=\"#621111\"}}\n{{elseif $P.colours == \"Black\"}}\n  {{assign var=c1 value=\"#222222\"}}\n  {{assign var=c2 value=\"#333333\"}}\n  {{assign var=link_colour value=\"#c8ebff\"}}\n  {{assign var=line value=\"#444444\"}}\n  {{assign var=fieldset_bg value=\"#353535\"}}\n  {{assign var=fieldset_lines value=\"#444444\"}}\n  {{assign var=fieldset_colour value=\"#c8ebff\"}}\n  {{assign var=fieldset_shadow value=\"on\"}}\n  {{assign var=font_colour value=\"#efefef\"}}\n  {{assign var=page_heading value=\"#eeeeee\"}}\n  {{assign var=nav_next_page value=\"#999999\"}}\n  {{assign var=nav_prev_page_text value=\"#3a8ab8\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#3a8ab8\"}}\n  {{assign var=nav_prev_page_border value=\"#4a99c7\"}}\n  {{assign var=submit_btn_over value=\"#3a8ab8\"}}\n  {{assign var=edit_link value=\"#c8ebff\"}}\n{{elseif $P.colours == \"Grey\"}}\n  {{assign var=c1 value=\"#dddddd\"}}\n  {{assign var=c2 value=\"#ffffff\"}}\n  {{assign var=link_colour value=\"#0033cc\"}}\n  {{assign var=line value=\"#cccccc\"}}\n  {{assign var=fieldset_bg value=\"#f2f2f2\"}}\n  {{assign var=fieldset_lines value=\"#aaaaaa\"}}\n  {{assign var=fieldset_colour value=\"#888888\"}}\n  {{assign var=fieldset_shadow value=\"off\"}}\n  {{assign var=font_colour value=\"#333333\"}}\n  {{assign var=page_heading value=\"#555555\"}}\n  {{assign var=nav_next_page value=\"#999999\"}}\n  {{assign var=nav_prev_page_text value=\"#888888\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#888888\"}}\n  {{assign var=nav_prev_page_border value=\"#888888\"}}\n  {{assign var=submit_btn_over value=\"#3a8ab8\"}}\n  {{assign var=edit_link value=\"#c8ebff\"}}\n{{elseif $P.colours == \"White\"}}\n  {{assign var=c1 value=\"#ffffff\"}}\n  {{assign var=c2 value=\"#ffffff\"}}\n  {{assign var=header_colour value=\"#222222\"}}\n  {{assign var=header_shadow value=\"off\"}}\n  {{assign var=link_colour value=\"#0093e8\"}}\n  {{assign var=line value=\"#000000\"}}\n  {{assign var=fieldset_bg value=\"#ffffff\"}}\n  {{assign var=fieldset_lines value=\"#000000\"}}\n  {{assign var=fieldset_colour value=\"#000000\"}}\n  {{assign var=fieldset_shadow value=\"off\"}}\n  {{assign var=font_colour value=\"#333333\"}}\n  {{assign var=page_heading value=\"#555555\"}}\n  {{assign var=nav_next_page value=\"#999999\"}}\n  {{assign var=nav_prev_page_text value=\"#888888\"}}\n  {{assign var=nav_prev_page_bg_over value=\"#888888\"}}\n  {{assign var=nav_prev_page_border value=\"#888888\"}}\n  {{assign var=submit_btn_over value=\"#0093e8\"}}\n  {{assign var=edit_link value=\"#0093e8\"}}\n{{/if}}\nhtml {\n  height: 100%;\n  margin: 0px;\n}\nbody {\n  height: 100%;\n  text-align: center;\n  padding: 0px;\n  margin: 0px;\n  background: {{$c2}}; /* Old browsers */\n  background: -moz-linear-gradient(top, {{$c1}} 0%, {{$c2}} 100%); /* FF3.6+ */\n  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,{{$c1}}), color-stop(100%,{{$c2}})); /* Chrome,Safari4+ */\n  background: -webkit-linear-gradient(top, {{$c1}} 0%,{{$c2}} 100%); /* Chrome10+,Safari5.1+ */\n  background: -o-linear-gradient(top, {{$c1}} 0%,{{$c2}} 100%); /* Opera 11.10+ */\n  background: -ms-linear-gradient(top, {{$c1}} 0%,{{$c2}} 100%); /* IE10+ */\n  background: linear-gradient(top, {{$c1}} 0%,{{$c2}} 100%); /* W3C */\n  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'{{$c1}}\', endColorstr=\'{{$c2}}\',GradientType=0 ); /* IE6-9 */\n  background-repeat: no-repeat;\n  background-attachment: fixed;\n}\ntd, th, p, ul,li,div, span {\n  font-family: Trykker, \"Lucida Grande\", Georgia, serif;\n  font-size: 12px;\n  color: {{$font_colour}};\n}\ninput, textarea, select {\n  font-family: Trykker, \"Lucida Grande\", Georgia, serif;\n  font-size: 12px;\n}\ntd, th, p, textarea, ul,li, div, a {\n  line-height: 25px;\n}\ntable {\n  empty-cells: show;\n}\n.clear {\n  clear: both;\n}\na:link, a:visited {\n  color: {{$link_colour}};\n  text-decoration: none;\n}\na:hover {\n  text-decoration: underline;\n}\ndiv.ui-dialog div, div.ui-dialog li, div.ui-dialog span {\n  color: #333333;\n}\n\n/* page sections */\n.ts_page {\n  margin: 40px auto;\n  position: relative;\n  text-align: left;\n}\n.ts_head_bg {\n  height: 105px;\n  border-bottom: 1px solid {{$line}};\n  position: absolute;\n  top: 0px;\n  width: 100%;\n}\n.ts_header {\n  height: 70px;\n}\n.ts_header h1 {\n  margin: 20px 20px;\n  font-family: Trykker, \"Lucida Grande\", Georgia, serif;\n  font-weight: bold;\n  padding: 0px;\n  font-size: 30px;\n  color: {{$header_colour}};\n  {{if $header_shadow == \"on\"}}text-shadow: 2px 2px 5px #555555;{{/if}}\n}\nh2 {\n  font-size: 21px;\n  font-family: Trykker, \"Lucida Grande\", Georgia, serif;\n  color: {{$page_heading}};\n}\n\n/* navigation */\n#ts_css_nav {\n  width: 180px;\n  float: left;\n  list-style: none;\n  padding: 20px;\n  margin: 0px;\n}\n#ts_css_nav li {\n  list-style: none;\n  margin: 0px 0px 2px;\n  color: #666666;\n  font-size: 12px;\n  line-height: 20px;\n  text-align: left;\n}\n#ts_css_nav div {\n  color: {{$nav_next_page}};\n}\n#ts_css_nav li div, #ts_css_nav li a {\n  padding: 5px 0px 5px 12px;\n  display: block;\n}\nul#ts_css_nav li.completed_page {\n  -webkit-border-radius: 4px;\n  -moz-border-radius: 4px;\n  border-radius: 4px;\n  border: 1px solid {{$nav_prev_page_border}};\n}\nul#ts_css_nav li.completed_page div {\n  color: {{$nav_prev_page_text}};\n}\nul#ts_css_nav li.css_nav_current_page {\n  -webkit-border-radius: 4px;\n  -moz-border-radius: 4px;\n  border-radius: 4px;\n  border: 1px solid #ffffff;\n}\nul#ts_css_nav li.css_nav_current_page div {\n  background-color: #222222;\n  color: white;\n  margin: 1px;\n  -webkit-border-radius: 3px;\n  -moz-border-radius: 3px;\n  border-radius: 3px;\n}\nul#ts_css_nav li a {\n  margin: 1px;\n  -webkit-border-radius: 3px;\n  -moz-border-radius: 3px;\n  border-radius: 3px;\n}\nul#ts_css_nav li a:link, ul#ts_css_nav li a:visited {\n  text-decoration: none;\n  color: {{$nav_prev_page_text}};\n  -webkit-border-radius: 2px;\n  -moz-border-radius: 2px;\n  border-radius: 2px;\n}\nul#ts_css_nav li a:hover {\n  color: white;\n  background-color: {{$nav_prev_page_bg_over}};\n  -webkit-border-radius: 3px;\n  -moz-border-radius: 3px;\n  border-radius: 3px;\n}\n\n/* notifications */\n.notify {\n  border: 1px solid #336699;\n  background-color: #ffffee;\n  color: #336699;\n  padding: 8px;\n  width: 400px;\n}\n.notify li { color: #336699; }\n.error {\n  font-size: 8pt;\n  border: 1px solid #cc0000;\n  background-color: #ffffee;\n  color: #cc0000;\n  padding: 8px;\n  width: 550px;\n}\n.error span {\n  color: #cc0000;\n  font-weight: bold;\n  margin-bottom: 4px;\n}\n\n/* forms */\ntable.table_1 > tbody > tr > td {\n  border-bottom: 1px solid {{$fieldset_lines}};\n}\ntable.table_1 > tbody > tr > td.rowN {\n  border-bottom: none;\n}\n.req {\n  color: #aa0000;\n}\n.fb_error {\n  background-color: #FFFFCC;\n  border: 1px solid #CC0000;\n  color: #CC0000;\n  margin-bottom: 12px;\n  padding: 8px;\n}\n\n/* for the code / markup editor */\n.editor {\n  background-color: white;\n  border: 1px solid #999999;\n  padding: 3px;\n}\n.ts_page_content {\n  width: 720px;\n  float: right;\n}\nfieldset {\n  border: 1px solid {{$fieldset_lines}};\n  font-size: 11pt;\n  font-weight: bold;\n  color: {{$fieldset_colour}};\n  margin-bottom: 10px;\n  background-color: {{$fieldset_bg}};\n}\n{{if $fieldset_shadow == \"on\"}}\nfieldset legend {\n  text-shadow: 2px 2px 3px #333333;\n}\n{{/if}}\n.ts_continue_button input {\n  background-color: #222222;\n  color: white;\n  padding: 2px 10px;\n  border-radius: 3px;\n  border: 0px;\n  cursor: pointer;\n}\n.ts_continue_button input:hover {\n  background-color: {{$submit_btn_over}};\n}\n#ts_footer {\n  border-top: 1px solid {{$line}};\n  padding: 20px;\n  color: #222222;\n}\n.edit_link {\n  text-shadow: none;\n  margin-left: 12px;\n}\n.edit_link a {\n  color: {{$edit_link_colour}};\n  text-decoration: none;\n}\n.edit_link a:hover {\n  text-decoration: underline;\n}\n\n#form_builder__edit_link {\n  position: absolute;\n  right: 5px;\n  top: 5px;\n  padding: 2px 10px;\n  background-color: black;\n  border: 1px solid white;\n  color: white;\n  text-decoration: none;\n  border-radius: 4px;\n}\n#form_builder__edit_link:hover {\n  color: #06a4ff;\n}', '2022-05-25 14:10:15', 1),
(5, 'css', 5, 'Additional Styles', 'styles', '/**\n * The majority of styles for this Template Set are pulled directly from the Core\'s default theme.\n * This supplements them for a few things that aren\'t covered.\n */\nh1 {\n  margin: 0px;\n  padding: 28px 0px 0px 21px;\n  float: left;\n  font-family: \'Lato\', Arial;\n  color: white;\n  font-size: 20px;\n  font-weight: normal;\n}\n#ts_css_nav {\n  list-style:none;\n  margin: 0px;\n  padding: 0px;\n}\n#ts_css_nav li {\n  height: 27px;\n}\n#ts_css_nav li a, #ts_css_nav li div {\n  padding: 2px 0px 2px 4px;\n  width: 150px;\n}\n#ts_css_nav li.completed_page a:link, #ts_css_nav li.completed_page a:visited {\n  display: block;\n  text-underline: none;\n}\n#ts_css_nav li.css_nav_current_page div {\n  font-weight: bold;\n}\n.edit_link {\n  float: right;\n}\n.edit_link a:link, .edit_link a:visited {\n  padding: 0px 7px;\n  background-color: #aaaaaa;\n  color: white;\n  border-radius: 3px;\n  letter-spacing: 0px;\n}\n.edit_link a:hover {\n  background-color: #222222;\n  text-decoration: none;\n}\n#form_builder__edit_link {\n  background-color: #444444;\n  border-radius: 3px 3px 3px 3px;\n  color: white;\n  float: right;\n  margin: 25px;\n  padding: 0 8px;\n}\n#form_builder__edit_link:hover {\n  background-color: #000000;\n  text-decoration: none;\n}\n.ts_heading {\n  font: 17.6px/20px Verdana,sans-serif;\n  padding-bottom: 5px;\n  margin: 0px;\n}', '2022-05-25 14:10:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_menu_items`
--

CREATE TABLE `frm1dnc_module_menu_items` (
  `menu_id` mediumint(8) UNSIGNED NOT NULL,
  `module_id` mediumint(8) UNSIGNED NOT NULL,
  `display_text` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_submenu` enum('yes','no') NOT NULL DEFAULT 'no',
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_module_menu_items`
--

INSERT INTO `frm1dnc_module_menu_items` (`menu_id`, `module_id`, `display_text`, `url`, `is_submenu`, `list_order`) VALUES
(1, 7, 'Visualizations', 'https://fireifly.com/api/modules/data_visualization/index.php', 'no', 1),
(2, 7, 'Main Settings', 'https://fireifly.com/api/modules/data_visualization/settings.php', 'no', 2),
(3, 7, 'Activity Charts', 'https://fireifly.com/api/modules/data_visualization/activity_charts/settings.php', 'yes', 3),
(4, 7, 'Field Charts', 'https://fireifly.com/api/modules/data_visualization/field_charts/settings.php', 'yes', 4),
(5, 7, 'Help', 'https://fireifly.com/api/modules/data_visualization/help.php', 'no', 5),
(6, 5, 'Export Manager', 'https://fireifly.com/api/modules/export_manager/index.php', 'no', 1),
(7, 5, 'Settings', 'https://fireifly.com/api/modules/export_manager/settings.php', 'yes', 2),
(8, 5, 'Reset to Defaults', 'https://fireifly.com/api/modules/export_manager/reset.php', 'yes', 3),
(9, 5, 'Help', 'https://fireifly.com/api/modules/export_manager/help.php', 'yes', 4),
(10, 8, 'File Upload', 'https://fireifly.com/api/modules/field_type_file/index.php', 'no', 1),
(11, 4, 'Template Sets', 'https://fireifly.com/api/modules/form_builder/index.php', 'no', 1),
(12, 4, 'Settings', 'https://fireifly.com/api/modules/form_builder/settings.php', 'no', 2),
(13, 4, 'Help', 'https://fireifly.com/api/modules/form_builder/help.php', 'no', 3),
(14, 3, 'Pages', 'https://fireifly.com/api/modules/pages/index.php', 'no', 1),
(15, 3, 'Add Page', 'https://fireifly.com/api/modules/pages/add.php', 'yes', 2),
(16, 3, 'Settings', 'https://fireifly.com/api/modules/pages/settings.php', 'no', 3),
(17, 3, 'Help', 'https://fireifly.com/api/modules/pages/help.php', 'no', 4),
(18, 2, 'Swift Mailer', 'https://fireifly.com/api/modules/swift_mailer/index.php', 'no', 1),
(19, 2, 'Help', 'https://fireifly.com/api/modules/swift_mailer/help.php', 'yes', 2),
(20, 1, 'System Check', 'https://fireifly.com/api/modules/system_check/index.php', 'no', 1),
(21, 1, 'File Verification', 'https://fireifly.com/api/modules/system_check/files.php', 'yes', 2),
(22, 1, 'Table Verification', 'https://fireifly.com/api/modules/system_check/tables.php', 'yes', 3),
(23, 1, 'Hook Verification', 'https://fireifly.com/api/modules/system_check/hooks.php', 'yes', 4),
(24, 1, 'Orphan Clean-up', 'https://fireifly.com/api/modules/system_check/orphans.php', 'yes', 5),
(25, 1, 'Environment Info', 'https://fireifly.com/api/modules/system_check/env.php', 'no', 6),
(26, 1, 'Help', 'https://fireifly.com/api/modules/system_check/help.php', 'no', 7),
(27, 6, 'TinyMCE Field', 'https://fireifly.com/api/modules/field_type_tinymce/index.php', 'no', 1),
(28, 6, 'Help', 'https://fireifly.com/api/modules/field_type_tinymce/help.php', 'no', 2);

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_pages`
--

CREATE TABLE `frm1dnc_module_pages` (
  `page_id` mediumint(8) UNSIGNED NOT NULL,
  `page_name` varchar(50) NOT NULL,
  `access_type` enum('admin','public','private') NOT NULL DEFAULT 'admin',
  `content_type` enum('html','php','smarty') NOT NULL DEFAULT 'html',
  `use_wysiwyg` enum('yes','no') NOT NULL DEFAULT 'yes',
  `heading` varchar(255) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_pages_clients`
--

CREATE TABLE `frm1dnc_module_pages_clients` (
  `page_id` mediumint(9) UNSIGNED NOT NULL,
  `client_id` mediumint(9) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_module_swift_mailer_email_template_fields`
--

CREATE TABLE `frm1dnc_module_swift_mailer_email_template_fields` (
  `email_template_id` mediumint(9) NOT NULL,
  `return_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_multi_page_form_urls`
--

CREATE TABLE `frm1dnc_multi_page_form_urls` (
  `form_id` mediumint(8) UNSIGNED NOT NULL,
  `form_url` varchar(255) NOT NULL,
  `page_num` tinyint(4) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_new_view_submission_defaults`
--

CREATE TABLE `frm1dnc_new_view_submission_defaults` (
  `view_id` mediumint(9) NOT NULL,
  `field_id` mediumint(9) NOT NULL,
  `default_value` text NOT NULL,
  `list_order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_option_lists`
--

CREATE TABLE `frm1dnc_option_lists` (
  `list_id` mediumint(8) UNSIGNED NOT NULL,
  `option_list_name` varchar(100) NOT NULL,
  `is_grouped` enum('yes','no') NOT NULL,
  `original_form_id` mediumint(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_public_form_omit_list`
--

CREATE TABLE `frm1dnc_public_form_omit_list` (
  `form_id` mediumint(8) UNSIGNED NOT NULL,
  `account_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_public_view_omit_list`
--

CREATE TABLE `frm1dnc_public_view_omit_list` (
  `view_id` mediumint(8) UNSIGNED NOT NULL,
  `account_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_sessions`
--

CREATE TABLE `frm1dnc_sessions` (
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `session_data` text NOT NULL,
  `expires` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_settings`
--

CREATE TABLE `frm1dnc_settings` (
  `setting_id` mediumint(9) NOT NULL,
  `setting_name` varchar(100) NOT NULL,
  `setting_value` text NOT NULL,
  `module` varchar(100) NOT NULL DEFAULT 'core'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_settings`
--

INSERT INTO `frm1dnc_settings` (`setting_id`, `setting_name`, `setting_value`, `module`) VALUES
(1, 'program_version', '3.0.20', 'core'),
(2, 'release_date', '20191019', 'core'),
(3, 'release_type', 'main', 'core'),
(4, 'api_version', '', 'core'),
(5, 'available_languages', 'af,Afrikaans|ar,Arabic|az,Azerbaijani|be,Byelorussian|bg,Bulgarian|ca,Catalan|cs,Czech|cy,Welsh|da,Danish|de,German|el,Greek|en_us,English (US)|es,Spanish|et,Estonian|fa,Persian|fi,Finnish|fr,French|ga,Irish|gl,Galician|hi,Hindi|hr,Croatian|hu,Hungarian|id,Indonesian|is,Icelandic|it,Italian|ja,Japanese|ko,Korean|la,Latvian|lt,Lithuanian|mk,Macedonian|ms,Malay|mt,Maltese|nl,Dutch|no,Norwegian|pl,Polish|pt,Portuguese|pt_br,Portuguese (Brazilian)|pt_eu,Portuguese (European)|ro,Romanian|ru,Russian|sk,Slovak|sl,Slovenian|sr,Serbian|sv,Swedish|sw,Swahili|th,Thai|tl,Filipino|tr,Turkish|uk,Ukrainian|vi,Vietnamese|yi,Yiddish|zh_cn,Chinese (Simplified)|zh_tw,Chinese (Traditional)', 'core'),
(6, 'clients_may_edit_date_format', 'no', 'core'),
(7, 'clients_may_edit_footer_text', 'no', 'core'),
(8, 'clients_may_edit_logout_url', 'yes', 'core'),
(9, 'clients_may_edit_max_failed_login_attempts', 'no', 'core'),
(10, 'clients_may_edit_page_titles', 'no', 'core'),
(11, 'clients_may_edit_sessions_timeout', 'no', 'core'),
(12, 'clients_may_edit_theme', 'yes', 'core'),
(13, 'clients_may_edit_timezone_offset', 'yes', 'core'),
(14, 'clients_may_edit_ui_language', 'yes', 'core'),
(15, 'default_client_menu_id', '2', 'core'),
(16, 'default_client_swatch', 'green', 'core'),
(17, 'default_date_field_search_value', 'none', 'core'),
(18, 'default_date_format', 'M jS y, g:i A', 'core'),
(19, 'default_footer_text', '', 'core'),
(20, 'default_language', 'en_us', 'core'),
(21, 'default_login_page', 'client_forms', 'core'),
(22, 'default_logout_url', 'https://fireifly.com/api', 'core'),
(23, 'default_max_failed_login_attempts', '', 'core'),
(24, 'default_num_submissions_per_page', '10', 'core'),
(25, 'default_page_titles', 'Form Tools - {$page}', 'core'),
(26, 'default_sessions_timeout', '30', 'core'),
(27, 'default_theme', 'default', 'core'),
(28, 'default_timezone_offset', '0', 'core'),
(29, 'edit_submission_shared_resources_js', '$(function() {\n    $(\".fancybox\").fancybox();\n});', 'core'),
(30, 'edit_submission_shared_resources_css', '/* used in the \"Highlight\" setting for most field types */\n.cf_colour_red {\n    background-color: #990000;\n    color: white;\n}\n.cf_colour_orange {\n    background-color: orange;\n}\n.cf_colour_yellow {\n    background-color: yellow;\n}\n.cf_colour_green {\n    background-color: green;\n    color: white;\n}\n.cf_colour_blue {\n    background-color: #336699;\n    color: white;\n}\n/* field comments */\n.cf_field_comments {\n    font-style: italic;\n    color: #999999;\n    clear: both;\n}\n\n/* column layouts for radios & checkboxes */\n.cf_option_list_group_label {\n    font-weight: bold;\n    clear: both;\n    margin-left: 4px;\n}\n.cf_option_list_2cols,\n.cf_option_list_3cols,\n.cf_option_list_4cols {\n    clear: both;\n}\n.cf_option_list_2cols .column {\n    width: 50%;\n    float: left;\n}\n.cf_option_list_3cols .column {\n    width: 33%;\n    float: left;\n}\n.cf_option_list_4cols .column {\n    width: 25%;\n    float: left;\n}\n\n/* Used for the date and time pickers */\n.cf_date_group img {\n    margin-bottom: -4px;\n    padding: 1px;\n}', 'core'),
(31, 'edit_submission_onload_resources', '<script src=\"{$g_root_url}/global/codemirror/lib/codemirror.js\"></script>\n<script src=\"{$g_root_url}/global/codemirror/mode/xml/xml.js\"></script>\n<script src=\"{$g_root_url}/global/codemirror/mode/css/css.js\"></script>\n<script src=\"{$g_root_url}/global/codemirror/mode/javascript/javascript.js\"></script>\n<script src=\"{$g_root_url}/global/scripts/jquery-ui-timepicker-addon.js\"></script>\n<script src=\"{$g_root_url}/global/fancybox/jquery.fancybox-1.3.4.pack.js\"></script>\n<link rel=\"stylesheet\" href=\"{$g_root_url}/global/codemirror/lib/codemirror.css\" type=\"text/css\" media=\"screen\" />\n<link rel=\"stylesheet\" href=\"{$g_root_url}/global/fancybox/jquery.fancybox-1.3.4.css\" type=\"text/css\" media=\"screen\" />', 'core'),
(32, 'field_type_settings_shared_characteristics', 'field_comments:textbox,comments`textarea,comments`password,comments`dropdown,comments`multi_select_dropdown,comments`radio_buttons,comments`checkboxes,comments`date,comments`time,comments`phone,comments`code_markup,comments`file,comments`google_maps_field,comments`tinymce,comments|data_source:dropdown,contents`multi_select_dropdown,contents`radio_buttons,contents`checkboxes,contents|column_formatting:checkboxes,formatting`radio_buttons,formatting|maxlength_attr:textbox,maxlength|colour_highlight:textbox,highlight|folder_path:file,folder_path|folder_url:file,folder_url|permitted_file_types:file,folder_url|max_file_size:file,max_file_size|date_display_format:date,display_format|apply_timezone_offset:date,apply_timezone_offset', 'core'),
(33, 'file_upload_dir', '/home2/fireifly/public_html/api/upload', 'core'),
(34, 'file_upload_filetypes', 'bmp,gif,jpg,jpeg,png,avi,mp3,mp4,doc,txt,pdf,xml,csv,swf,fla,xls,tif', 'core'),
(35, 'file_upload_url', 'https://fireifly.com/api/upload', 'core'),
(36, 'file_upload_max_size', '2000', 'core'),
(37, 'forms_page_default_message', 'Welcome! This program stores all information submitted by your website visitors. To view submissions for a particular form just click on the <b>VIEW</b> link, or see the leftmost navigation menu for other options.', 'core'),
(38, 'logo_link', 'https://formtools.org', 'core'),
(39, 'min_password_length', '', 'core'),
(40, 'num_clients_per_page', '10', 'core'),
(41, 'num_emails_per_page', '10', 'core'),
(42, 'num_forms_per_page', '10', 'core'),
(43, 'num_menus_per_page', '10', 'core'),
(44, 'num_modules_per_page', '10', 'core'),
(45, 'num_option_lists_per_page', '10', 'core'),
(46, 'num_password_history', '', 'core'),
(47, 'program_name', 'Form Tools', 'core'),
(48, 'required_password_chars', '', 'core'),
(49, 'timezone_offset', '0', 'core'),
(50, 'core_version_upgrade_track', '3.0.20', 'core'),
(51, 'quicklinks_dialog_width', '880', 'data_visualization'),
(52, 'quicklinks_dialog_height', '400', 'data_visualization'),
(53, 'quicklinks_dialog_thumb_size', '200', 'data_visualization'),
(54, 'default_cache_frequency', '30', 'data_visualization'),
(55, 'hide_from_client_accounts', 'no', 'data_visualization'),
(56, 'clients_may_refresh_cache', 'yes', 'data_visualization'),
(57, 'activity_chart_date_range', 'last_30_days', 'data_visualization'),
(58, 'activity_chart_submission_count_group', 'day', 'data_visualization'),
(59, 'activity_chart_default_chart_type', 'line_chart', 'data_visualization'),
(60, 'activity_chart_colour', 'blue', 'data_visualization'),
(61, 'activity_chart_line_width', '2', 'data_visualization'),
(62, 'field_chart_default_chart_type', 'pie_chart', 'data_visualization'),
(63, 'field_chart_include_legend_quicklinks', 'no', 'data_visualization'),
(64, 'field_chart_colour', 'blue', 'data_visualization'),
(65, 'field_chart_include_legend_full_size', 'yes', 'data_visualization'),
(66, 'field_chart_pie_chart_format', '2D', 'data_visualization'),
(67, 'field_chart_ignore_empty_fields', 'yes', 'data_visualization'),
(68, 'file_upload_dir', '/home2/fireifly/public_html/api/upload', 'export_manager'),
(69, 'file_upload_url', 'https://fireifly.com/api/upload', 'export_manager'),
(70, 'default_form_offline_page_content', '<h2 class=\"ts_heading\">Sorry!</h2>\n\n<p>\n  The form is currently offline.\n</p>', 'form_builder'),
(71, 'scheduled_offline_form_behaviour', 'allow_completion', 'form_builder'),
(72, 'default_thankyou_page_content', '<h2 class=\"ts_heading\">Thanks!</h2>\n\n<p>\n  Your form has been processed. Thanks for submitting the form.\n</p>\n\n<p>\n  <a href=\"?page=1\">Click here</a> to put through another submission.\n</p>', 'form_builder'),
(73, 'default_published_folder_path', '/home2/fireifly/public_html/api/modules/form_builder/published', 'form_builder'),
(74, 'default_published_folder_url', 'https://fireifly.com/api/modules/form_builder/published', 'form_builder'),
(75, 'review_page_title', 'Review', 'form_builder'),
(76, 'thankyou_page_title', 'Thankyou', 'form_builder'),
(77, 'form_builder_width', '1000', 'form_builder'),
(78, 'form_builder_height', '700', 'form_builder'),
(79, 'edit_form_builder_link_action', 'same_window', 'form_builder'),
(80, 'demo_mode', 'off', 'form_builder'),
(81, 'num_pages_per_page', '10', 'pages'),
(82, 'swiftmailer_enabled', 'no', 'swift_mailer'),
(83, 'smtp_server', '', 'swift_mailer'),
(84, 'port', '', 'swift_mailer'),
(85, 'requires_authentication', 'no', 'swift_mailer'),
(86, 'username', '', 'swift_mailer'),
(87, 'password', '', 'swift_mailer'),
(88, 'authentication_procedure', '', 'swift_mailer'),
(89, 'use_encryption', '', 'swift_mailer'),
(90, 'encryption_type', '', 'swift_mailer'),
(91, 'charset', 'UTF-8', 'swift_mailer'),
(92, 'server_connection_timeout', '15', 'swift_mailer'),
(93, 'use_anti_flooding', '', 'swift_mailer'),
(94, 'anti_flooding_email_batch_size', '', 'swift_mailer'),
(95, 'anti_flooding_email_batch_wait_time', '', 'swift_mailer'),
(96, 'installation_complete', 'yes', 'core');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_themes`
--

CREATE TABLE `frm1dnc_themes` (
  `theme_id` mediumint(8) UNSIGNED NOT NULL,
  `theme_folder` varchar(100) NOT NULL,
  `theme_name` varchar(50) NOT NULL,
  `uses_swatches` enum('yes','no') NOT NULL DEFAULT 'no',
  `swatches` mediumtext,
  `author` varchar(200) DEFAULT NULL,
  `author_email` varchar(255) DEFAULT NULL,
  `author_link` varchar(255) DEFAULT NULL,
  `theme_link` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `is_enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `theme_version` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `frm1dnc_themes`
--

INSERT INTO `frm1dnc_themes` (`theme_id`, `theme_folder`, `theme_name`, `uses_swatches`, `swatches`, `author`, `author_email`, `author_link`, `theme_link`, `description`, `is_enabled`, `theme_version`) VALUES
(1, 'default', 'Default', 'yes', 'red,{$LANG.word_red}|orange,{$LANG.word_orange}|yellow,{$LANG.word_yellow}|green,{$LANG.word_green}|aquamarine,{$LANG.word_aquamarine}|blue,{$LANG.word_blue}|dark_blue,{$LANG.phrase_dark_blue}|purple,{$LANG.word_purple}|grey,{$LANG.word_grey}|light_brown,{$LANG.phrase_light_brown}', 'Ben Keen', NULL, NULL, 'http://themes.formtools.org', 'The default Form Tools theme. It\'s a fixed-width theme requiring 1024 minimum width screens, with a few different colour swatches to choose from.', 'yes', '1.0.0'),
(2, 'classicgrey', 'Classic Grey', 'no', '', 'Ben Keen', NULL, NULL, 'https://themes.formtools.org', 'A remodelling of the old grey-styled Form Tools 1.x theme.', 'yes', '2.0.7'),
(3, 'deepblue', 'Deep Blue', 'no', '', 'ben.keen@gmail.com', NULL, NULL, 'https://themes.formtools.org/', 'A fixed-width blue-coloured theme designed for 1024 pixel minimum screens.', 'yes', '2.0.5');

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_views`
--

CREATE TABLE `frm1dnc_views` (
  `view_id` smallint(6) NOT NULL,
  `form_id` mediumint(8) UNSIGNED NOT NULL,
  `access_type` enum('admin','public','private','hidden') NOT NULL DEFAULT 'public',
  `view_name` varchar(100) NOT NULL,
  `view_order` smallint(6) NOT NULL DEFAULT '1',
  `is_new_sort_group` enum('yes','no') NOT NULL,
  `group_id` smallint(6) DEFAULT NULL,
  `num_submissions_per_page` smallint(6) NOT NULL DEFAULT '10',
  `default_sort_field` varchar(255) NOT NULL DEFAULT 'submission_date',
  `default_sort_field_order` enum('asc','desc') NOT NULL DEFAULT 'desc',
  `may_add_submissions` enum('yes','no') NOT NULL DEFAULT 'yes',
  `may_copy_submissions` enum('yes','no') NOT NULL DEFAULT 'no',
  `may_edit_submissions` enum('yes','no') NOT NULL DEFAULT 'yes',
  `may_delete_submissions` enum('yes','no') NOT NULL DEFAULT 'yes',
  `has_client_map_filter` enum('yes','no') NOT NULL DEFAULT 'no',
  `has_standard_filter` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_view_columns`
--

CREATE TABLE `frm1dnc_view_columns` (
  `view_id` mediumint(9) NOT NULL,
  `field_id` mediumint(9) NOT NULL,
  `list_order` smallint(6) NOT NULL,
  `is_sortable` enum('yes','no') NOT NULL,
  `auto_size` enum('yes','no') NOT NULL DEFAULT 'yes',
  `custom_width` varchar(10) DEFAULT NULL,
  `truncate` enum('truncate','no_truncate') NOT NULL DEFAULT 'truncate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_view_fields`
--

CREATE TABLE `frm1dnc_view_fields` (
  `view_id` mediumint(8) UNSIGNED NOT NULL,
  `field_id` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(9) DEFAULT NULL,
  `is_editable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `is_searchable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `list_order` smallint(5) UNSIGNED DEFAULT NULL,
  `is_new_sort_group` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_view_filters`
--

CREATE TABLE `frm1dnc_view_filters` (
  `filter_id` mediumint(8) UNSIGNED NOT NULL,
  `view_id` mediumint(8) UNSIGNED NOT NULL,
  `filter_type` enum('standard','client_map') NOT NULL DEFAULT 'standard',
  `field_id` mediumint(8) UNSIGNED NOT NULL,
  `operator` enum('equals','not_equals','like','not_like','before','after') NOT NULL DEFAULT 'equals',
  `filter_values` mediumtext NOT NULL,
  `filter_sql` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frm1dnc_view_tabs`
--

CREATE TABLE `frm1dnc_view_tabs` (
  `view_id` mediumint(8) UNSIGNED NOT NULL,
  `tab_number` tinyint(3) UNSIGNED NOT NULL,
  `tab_label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `frm1dnc_accounts`
--
ALTER TABLE `frm1dnc_accounts`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `frm1dnc_account_settings`
--
ALTER TABLE `frm1dnc_account_settings`
  ADD PRIMARY KEY (`account_id`,`setting_name`);

--
-- Indexes for table `frm1dnc_client_forms`
--
ALTER TABLE `frm1dnc_client_forms`
  ADD PRIMARY KEY (`account_id`,`form_id`);

--
-- Indexes for table `frm1dnc_client_views`
--
ALTER TABLE `frm1dnc_client_views`
  ADD PRIMARY KEY (`account_id`,`view_id`);

--
-- Indexes for table `frm1dnc_email_templates`
--
ALTER TABLE `frm1dnc_email_templates`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `frm1dnc_email_template_edit_submission_views`
--
ALTER TABLE `frm1dnc_email_template_edit_submission_views`
  ADD PRIMARY KEY (`email_id`,`view_id`);

--
-- Indexes for table `frm1dnc_email_template_recipients`
--
ALTER TABLE `frm1dnc_email_template_recipients`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `frm1dnc_field_options`
--
ALTER TABLE `frm1dnc_field_options`
  ADD PRIMARY KEY (`list_id`,`list_group_id`,`option_order`);

--
-- Indexes for table `frm1dnc_field_settings`
--
ALTER TABLE `frm1dnc_field_settings`
  ADD PRIMARY KEY (`field_id`,`setting_id`);

--
-- Indexes for table `frm1dnc_field_types`
--
ALTER TABLE `frm1dnc_field_types`
  ADD PRIMARY KEY (`field_type_id`);

--
-- Indexes for table `frm1dnc_field_type_settings`
--
ALTER TABLE `frm1dnc_field_type_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `frm1dnc_field_type_setting_options`
--
ALTER TABLE `frm1dnc_field_type_setting_options`
  ADD PRIMARY KEY (`setting_id`,`option_order`);

--
-- Indexes for table `frm1dnc_field_type_validation_rules`
--
ALTER TABLE `frm1dnc_field_type_validation_rules`
  ADD PRIMARY KEY (`rule_id`);

--
-- Indexes for table `frm1dnc_field_validation`
--
ALTER TABLE `frm1dnc_field_validation`
  ADD UNIQUE KEY `rule_id` (`rule_id`,`field_id`);

--
-- Indexes for table `frm1dnc_forms`
--
ALTER TABLE `frm1dnc_forms`
  ADD PRIMARY KEY (`form_id`);

--
-- Indexes for table `frm1dnc_form_email_fields`
--
ALTER TABLE `frm1dnc_form_email_fields`
  ADD PRIMARY KEY (`form_email_id`);

--
-- Indexes for table `frm1dnc_form_fields`
--
ALTER TABLE `frm1dnc_form_fields`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `frm1dnc_hooks`
--
ALTER TABLE `frm1dnc_hooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frm1dnc_hook_calls`
--
ALTER TABLE `frm1dnc_hook_calls`
  ADD PRIMARY KEY (`hook_id`);

--
-- Indexes for table `frm1dnc_list_groups`
--
ALTER TABLE `frm1dnc_list_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `frm1dnc_menus`
--
ALTER TABLE `frm1dnc_menus`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `frm1dnc_menu_items`
--
ALTER TABLE `frm1dnc_menu_items`
  ADD PRIMARY KEY (`menu_item_id`);

--
-- Indexes for table `frm1dnc_modules`
--
ALTER TABLE `frm1dnc_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `frm1dnc_module_data_visualizations`
--
ALTER TABLE `frm1dnc_module_data_visualizations`
  ADD PRIMARY KEY (`vis_id`);

--
-- Indexes for table `frm1dnc_module_data_visualization_cache`
--
ALTER TABLE `frm1dnc_module_data_visualization_cache`
  ADD PRIMARY KEY (`vis_id`);

--
-- Indexes for table `frm1dnc_module_data_visualization_clients`
--
ALTER TABLE `frm1dnc_module_data_visualization_clients`
  ADD PRIMARY KEY (`vis_id`,`account_id`);

--
-- Indexes for table `frm1dnc_module_export_groups`
--
ALTER TABLE `frm1dnc_module_export_groups`
  ADD PRIMARY KEY (`export_group_id`);

--
-- Indexes for table `frm1dnc_module_export_group_clients`
--
ALTER TABLE `frm1dnc_module_export_group_clients`
  ADD PRIMARY KEY (`export_group_id`,`account_id`);

--
-- Indexes for table `frm1dnc_module_export_types`
--
ALTER TABLE `frm1dnc_module_export_types`
  ADD PRIMARY KEY (`export_type_id`);

--
-- Indexes for table `frm1dnc_module_form_builder_forms`
--
ALTER TABLE `frm1dnc_module_form_builder_forms`
  ADD PRIMARY KEY (`published_form_id`);

--
-- Indexes for table `frm1dnc_module_form_builder_form_placeholders`
--
ALTER TABLE `frm1dnc_module_form_builder_form_placeholders`
  ADD UNIQUE KEY `published_form_id` (`published_form_id`,`placeholder_id`);

--
-- Indexes for table `frm1dnc_module_form_builder_form_templates`
--
ALTER TABLE `frm1dnc_module_form_builder_form_templates`
  ADD PRIMARY KEY (`published_form_id`,`template_type`);

--
-- Indexes for table `frm1dnc_module_form_builder_templates`
--
ALTER TABLE `frm1dnc_module_form_builder_templates`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `frm1dnc_module_form_builder_template_sets`
--
ALTER TABLE `frm1dnc_module_form_builder_template_sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `frm1dnc_module_form_builder_template_set_placeholders`
--
ALTER TABLE `frm1dnc_module_form_builder_template_set_placeholders`
  ADD PRIMARY KEY (`placeholder_id`);

--
-- Indexes for table `frm1dnc_module_form_builder_template_set_placeholder_opts`
--
ALTER TABLE `frm1dnc_module_form_builder_template_set_placeholder_opts`
  ADD PRIMARY KEY (`placeholder_id`,`field_order`);

--
-- Indexes for table `frm1dnc_module_form_builder_template_set_resources`
--
ALTER TABLE `frm1dnc_module_form_builder_template_set_resources`
  ADD PRIMARY KEY (`resource_id`);

--
-- Indexes for table `frm1dnc_module_menu_items`
--
ALTER TABLE `frm1dnc_module_menu_items`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `frm1dnc_module_pages`
--
ALTER TABLE `frm1dnc_module_pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `frm1dnc_module_pages_clients`
--
ALTER TABLE `frm1dnc_module_pages_clients`
  ADD PRIMARY KEY (`page_id`,`client_id`);

--
-- Indexes for table `frm1dnc_module_swift_mailer_email_template_fields`
--
ALTER TABLE `frm1dnc_module_swift_mailer_email_template_fields`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indexes for table `frm1dnc_multi_page_form_urls`
--
ALTER TABLE `frm1dnc_multi_page_form_urls`
  ADD PRIMARY KEY (`form_id`,`page_num`);

--
-- Indexes for table `frm1dnc_new_view_submission_defaults`
--
ALTER TABLE `frm1dnc_new_view_submission_defaults`
  ADD PRIMARY KEY (`view_id`,`field_id`);

--
-- Indexes for table `frm1dnc_option_lists`
--
ALTER TABLE `frm1dnc_option_lists`
  ADD PRIMARY KEY (`list_id`);

--
-- Indexes for table `frm1dnc_public_form_omit_list`
--
ALTER TABLE `frm1dnc_public_form_omit_list`
  ADD PRIMARY KEY (`form_id`,`account_id`);

--
-- Indexes for table `frm1dnc_public_view_omit_list`
--
ALTER TABLE `frm1dnc_public_view_omit_list`
  ADD PRIMARY KEY (`view_id`,`account_id`);

--
-- Indexes for table `frm1dnc_sessions`
--
ALTER TABLE `frm1dnc_sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `frm1dnc_settings`
--
ALTER TABLE `frm1dnc_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `frm1dnc_themes`
--
ALTER TABLE `frm1dnc_themes`
  ADD PRIMARY KEY (`theme_id`);

--
-- Indexes for table `frm1dnc_views`
--
ALTER TABLE `frm1dnc_views`
  ADD PRIMARY KEY (`view_id`);

--
-- Indexes for table `frm1dnc_view_columns`
--
ALTER TABLE `frm1dnc_view_columns`
  ADD PRIMARY KEY (`view_id`,`field_id`,`list_order`);

--
-- Indexes for table `frm1dnc_view_fields`
--
ALTER TABLE `frm1dnc_view_fields`
  ADD PRIMARY KEY (`view_id`,`field_id`);

--
-- Indexes for table `frm1dnc_view_filters`
--
ALTER TABLE `frm1dnc_view_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `frm1dnc_view_tabs`
--
ALTER TABLE `frm1dnc_view_tabs`
  ADD PRIMARY KEY (`view_id`,`tab_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `frm1dnc_accounts`
--
ALTER TABLE `frm1dnc_accounts`
  MODIFY `account_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `frm1dnc_email_templates`
--
ALTER TABLE `frm1dnc_email_templates`
  MODIFY `email_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_email_template_recipients`
--
ALTER TABLE `frm1dnc_email_template_recipients`
  MODIFY `recipient_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_field_types`
--
ALTER TABLE `frm1dnc_field_types`
  MODIFY `field_type_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `frm1dnc_field_type_settings`
--
ALTER TABLE `frm1dnc_field_type_settings`
  MODIFY `setting_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `frm1dnc_field_type_validation_rules`
--
ALTER TABLE `frm1dnc_field_type_validation_rules`
  MODIFY `rule_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `frm1dnc_forms`
--
ALTER TABLE `frm1dnc_forms`
  MODIFY `form_id` mediumint(9) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_form_email_fields`
--
ALTER TABLE `frm1dnc_form_email_fields`
  MODIFY `form_email_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_form_fields`
--
ALTER TABLE `frm1dnc_form_fields`
  MODIFY `field_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_hooks`
--
ALTER TABLE `frm1dnc_hooks`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `frm1dnc_hook_calls`
--
ALTER TABLE `frm1dnc_hook_calls`
  MODIFY `hook_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `frm1dnc_list_groups`
--
ALTER TABLE `frm1dnc_list_groups`
  MODIFY `group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `frm1dnc_menus`
--
ALTER TABLE `frm1dnc_menus`
  MODIFY `menu_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `frm1dnc_menu_items`
--
ALTER TABLE `frm1dnc_menu_items`
  MODIFY `menu_item_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `frm1dnc_modules`
--
ALTER TABLE `frm1dnc_modules`
  MODIFY `module_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `frm1dnc_module_data_visualizations`
--
ALTER TABLE `frm1dnc_module_data_visualizations`
  MODIFY `vis_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_module_export_groups`
--
ALTER TABLE `frm1dnc_module_export_groups`
  MODIFY `export_group_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `frm1dnc_module_export_types`
--
ALTER TABLE `frm1dnc_module_export_types`
  MODIFY `export_type_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `frm1dnc_module_form_builder_forms`
--
ALTER TABLE `frm1dnc_module_form_builder_forms`
  MODIFY `published_form_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_module_form_builder_templates`
--
ALTER TABLE `frm1dnc_module_form_builder_templates`
  MODIFY `template_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `frm1dnc_module_form_builder_template_sets`
--
ALTER TABLE `frm1dnc_module_form_builder_template_sets`
  MODIFY `set_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `frm1dnc_module_form_builder_template_set_placeholders`
--
ALTER TABLE `frm1dnc_module_form_builder_template_set_placeholders`
  MODIFY `placeholder_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `frm1dnc_module_form_builder_template_set_resources`
--
ALTER TABLE `frm1dnc_module_form_builder_template_set_resources`
  MODIFY `resource_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `frm1dnc_module_menu_items`
--
ALTER TABLE `frm1dnc_module_menu_items`
  MODIFY `menu_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `frm1dnc_module_pages`
--
ALTER TABLE `frm1dnc_module_pages`
  MODIFY `page_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_option_lists`
--
ALTER TABLE `frm1dnc_option_lists`
  MODIFY `list_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_settings`
--
ALTER TABLE `frm1dnc_settings`
  MODIFY `setting_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `frm1dnc_themes`
--
ALTER TABLE `frm1dnc_themes`
  MODIFY `theme_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `frm1dnc_views`
--
ALTER TABLE `frm1dnc_views`
  MODIFY `view_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frm1dnc_view_filters`
--
ALTER TABLE `frm1dnc_view_filters`
  MODIFY `filter_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
