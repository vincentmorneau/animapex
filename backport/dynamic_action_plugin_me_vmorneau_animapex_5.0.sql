set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>2292530307876860
,p_default_application_id=>260
,p_default_owner=>'FINANCE'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/me_vmorneau_animapex
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(130672028021197662)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'ME.VMORNEAU.ANIMAPEX'
,p_display_name=>'AnimAPEX'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'/*-------------------------------------',
' * AnimAPEX',
' * Version: 1.0.0 (2017.10.28)',
' * Author: Vincent Morneau',
' *-------------------------------------',
'*/',
'function render (',
'	p_dynamic_action in apex_plugin.t_dynamic_action',
'	, p_plugin in apex_plugin.t_plugin',
') return apex_plugin.t_dynamic_action_render_result is',
'	l_result apex_plugin.t_dynamic_action_render_result;',
'',
'	-- attributes',
'	l_animation varchar2(25) := p_dynamic_action.attribute_01;',
'	l_duration varchar2(25) := p_dynamic_action.attribute_02;',
'	l_delay varchar2(25) := p_dynamic_action.attribute_03;',
'	l_iteration_count varchar2(25) := p_dynamic_action.attribute_04;',
'',
'	-- variable for minified files',
'	l_min varchar2(5);',
'begin',
'	-- defaults',
'	l_animation := nvl(l_animation, ''bounce'');',
'',
'	-- debug',
'	if apex_application.g_debug then',
'		apex_plugin_util.debug_dynamic_action (',
'			p_plugin => p_plugin',
'			, p_dynamic_action => p_dynamic_action',
'		);',
'	else',
'		l_min := ''.min'';',
'	end if;',
'',
'	-- add animapex js',
'	apex_javascript.add_library (',
'		p_name  => ''animapex'' || l_min',
'		, p_directory  => p_plugin.file_prefix || ''js/''',
'	);',
'',
'	-- add css',
'	apex_css.add_file (',
'		p_name => ''animate'' || l_min',
'		, p_directory => p_plugin.file_prefix || ''lib/animate/''',
'	);',
'',
'	l_result.javascript_function := ''animapex.animate'';',
'	l_result.attribute_01 := l_animation;',
'',
'	if l_duration is not null then',
'		l_result.attribute_02 := l_duration;',
'	end if;',
'',
'	if l_delay is not null then',
'		l_result.attribute_03 := l_delay;',
'	end if;',
'',
'	if l_iteration_count is not null then',
'		l_result.attribute_04 := l_iteration_count;',
'	end if;',
'',
'	return l_result;',
'end render;'))
,p_render_function=>'render'
,p_standard_attributes=>'ITEM:BUTTON:REGION:JQUERY_SELECTOR:TRIGGERING_ELEMENT:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://github.com/vincentmorneau/animapex'
,p_plugin_comment=>'backported to APEX 5.0 by Jeff Kemp'
,p_files_version=>7
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(130673473971239148)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Animation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'pulse'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130673790377240348)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>10
,p_display_value=>'bounce'
,p_return_value=>'bounce'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130674111220241193)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>20
,p_display_value=>'flash'
,p_return_value=>'flash'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130674572134242058)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>30
,p_display_value=>'pulse'
,p_return_value=>'pulse'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130674903523243084)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>40
,p_display_value=>'rubberBand'
,p_return_value=>'rubberBand'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130675388996243564)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>50
,p_display_value=>'shake'
,p_return_value=>'shake'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130675761079245170)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>60
,p_display_value=>'headShake'
,p_return_value=>'headShake'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130676167938246387)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>70
,p_display_value=>'swing'
,p_return_value=>'swing'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130676543964247246)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>80
,p_display_value=>'tada'
,p_return_value=>'tada'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130676956154249600)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>90
,p_display_value=>'wobble'
,p_return_value=>'wobble'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130677302620250097)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>100
,p_display_value=>'jello'
,p_return_value=>'jello'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130677734965251168)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>110
,p_display_value=>'bounceIn'
,p_return_value=>'bounceIn'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130678193512251878)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>120
,p_display_value=>'bounceInDown'
,p_return_value=>'bounceInDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130678599812252771)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>130
,p_display_value=>'bounceInLeft'
,p_return_value=>'bounceInLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130678955917253472)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>140
,p_display_value=>'bounceInRight'
,p_return_value=>'bounceInRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130679334661254940)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>150
,p_display_value=>'bounceInUp'
,p_return_value=>'bounceInUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130679735349255707)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>160
,p_display_value=>'bounceOut'
,p_return_value=>'bounceOut'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130680145100256567)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>170
,p_display_value=>'bounceOutDown'
,p_return_value=>'bounceOutDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130680527022257250)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>180
,p_display_value=>'bounceOutLeft'
,p_return_value=>'bounceOutLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130680971447257983)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>190
,p_display_value=>'bounceOutRight'
,p_return_value=>'bounceOutRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130681377931258679)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>200
,p_display_value=>'bounceOutUp'
,p_return_value=>'bounceOutUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130681723236260978)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>210
,p_display_value=>'fadeIn'
,p_return_value=>'fadeIn'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130682104953262276)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>220
,p_display_value=>'fadeInDown'
,p_return_value=>'fadeInDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130682567787263175)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>230
,p_display_value=>'fadeInDownBig'
,p_return_value=>'fadeInDownBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130682922820264035)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>240
,p_display_value=>'fadeInLeft'
,p_return_value=>'fadeInLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130683329994266288)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>250
,p_display_value=>'fadeInLeftBig'
,p_return_value=>'fadeInLeftBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130683719442267883)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>260
,p_display_value=>'fadeInRight'
,p_return_value=>'fadeInRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130684120812268882)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>270
,p_display_value=>'fadeInRightBig'
,p_return_value=>'fadeInRightBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130684585474269454)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>280
,p_display_value=>'fadeInUp'
,p_return_value=>'fadeInUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130684903898270391)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>290
,p_display_value=>'fadeInUpBig'
,p_return_value=>'fadeInUpBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130685381451272323)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>300
,p_display_value=>'fadeOut'
,p_return_value=>'fadeOut'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130685737087273919)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>310
,p_display_value=>'fadeOutDown'
,p_return_value=>'fadeOutDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130686119063274899)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>320
,p_display_value=>'fadeOutDownBig'
,p_return_value=>'fadeOutDownBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130686552150275581)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>330
,p_display_value=>'fadeOutLeft'
,p_return_value=>'fadeOutLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130686913104276414)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>340
,p_display_value=>'fadeOutLeftBig'
,p_return_value=>'fadeOutLeftBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130687393847277295)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>350
,p_display_value=>'fadeOutRight'
,p_return_value=>'fadeOutRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130687729370278198)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>360
,p_display_value=>'fadeOutRightBig'
,p_return_value=>'fadeOutRightBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130688164021279124)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>370
,p_display_value=>'fadeOutUp'
,p_return_value=>'fadeOutUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130688583542280298)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>380
,p_display_value=>'fadeOutUpBig'
,p_return_value=>'fadeOutUpBig'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130688911901280935)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>390
,p_display_value=>'flip'
,p_return_value=>'flip'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130689385903281791)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>400
,p_display_value=>'flipInX'
,p_return_value=>'flipInX'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130689776172283001)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>410
,p_display_value=>'flipInY'
,p_return_value=>'flipInY'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130690175069283902)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>420
,p_display_value=>'flipOutX'
,p_return_value=>'flipOutX'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130690508398284802)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>430
,p_display_value=>'flipOutY'
,p_return_value=>'flipOutY'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130690937018286330)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>440
,p_display_value=>'lightSpeedIn'
,p_return_value=>'lightSpeedIn'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130691360059286969)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>450
,p_display_value=>'lightSpeedOut'
,p_return_value=>'lightSpeedOut'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130691701228287805)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>460
,p_display_value=>'rotateIn'
,p_return_value=>'rotateIn'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130692179661289007)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>470
,p_display_value=>'rotateInDownLeft'
,p_return_value=>'rotateInDownLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130692515787289940)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>480
,p_display_value=>'rotateInDownRight'
,p_return_value=>'rotateInDownRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130692911978290810)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>490
,p_display_value=>'rotateInUpLeft'
,p_return_value=>'rotateInUpLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130693398388292011)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>500
,p_display_value=>'rotateInUpRight'
,p_return_value=>'rotateInUpRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130693734036293045)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>510
,p_display_value=>'rotateOut'
,p_return_value=>'rotateOut'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130694180808293827)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>520
,p_display_value=>'rotateOutDownLeft'
,p_return_value=>'rotateOutDownLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130694578498294590)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>530
,p_display_value=>'rotateOutDownRight'
,p_return_value=>'rotateOutDownRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130694924689295624)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>540
,p_display_value=>'rotateOutUpLeft'
,p_return_value=>'rotateOutUpLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130695383681296869)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>550
,p_display_value=>'rotateOutUpRight'
,p_return_value=>'rotateOutUpRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130695748773298024)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>560
,p_display_value=>'hinge'
,p_return_value=>'hinge'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130696125163299231)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>570
,p_display_value=>'jackInTheBox'
,p_return_value=>'jackInTheBox'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130696574817299830)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>580
,p_display_value=>'rollIn'
,p_return_value=>'rollIn'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130697134124300451)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>590
,p_display_value=>'rollOut'
,p_return_value=>'rollOut'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130697540761302903)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>600
,p_display_value=>'zoomIn'
,p_return_value=>'zoomIn'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130697995687303395)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>610
,p_display_value=>'zoomInDown'
,p_return_value=>'zoomInDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130698340761303908)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>620
,p_display_value=>'zoomInLeft'
,p_return_value=>'zoomInLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130698726001304617)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>630
,p_display_value=>'zoomInRight'
,p_return_value=>'zoomInRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130699179388305540)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>640
,p_display_value=>'zoomInUp'
,p_return_value=>'zoomInUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130699577365306188)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>650
,p_display_value=>'zoomOut'
,p_return_value=>'zoomOut'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130699956416307054)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>660
,p_display_value=>'zoomOutDown'
,p_return_value=>'zoomOutDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130700326578307535)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>670
,p_display_value=>'zoomOutLeft'
,p_return_value=>'zoomOutLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130700705907308146)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>680
,p_display_value=>'zoomOutRight'
,p_return_value=>'zoomOutRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130701122564308608)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>690
,p_display_value=>'zoomOutUp'
,p_return_value=>'zoomOutUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130701562737309801)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>700
,p_display_value=>'slideInDown'
,p_return_value=>'slideInDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130701947357310715)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>710
,p_display_value=>'slideInLeft'
,p_return_value=>'slideInLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130702349994312113)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>720
,p_display_value=>'slideInRight'
,p_return_value=>'slideInRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130702718976312607)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>730
,p_display_value=>'slideInUp'
,p_return_value=>'slideInUp'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130703158012313436)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>740
,p_display_value=>'slideOutDown'
,p_return_value=>'slideOutDown'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130703568162314246)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>750
,p_display_value=>'slideOutLeft'
,p_return_value=>'slideOutLeft'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130704055322320580)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>760
,p_display_value=>'slideOutRight'
,p_return_value=>'slideOutRight'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130704443641321500)
,p_plugin_attribute_id=>wwv_flow_api.id(130673473971239148)
,p_display_sequence=>770
,p_display_value=>'slideOutUp'
,p_return_value=>'slideOutUp'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(130704831983328852)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Duration'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_unit=>'sec'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'Default duration is either 1 or 2 seconds depending on which animation.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(130705175565332094)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Delay'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_unit=>'sec'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(130705470419336112)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Iteration Count'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130705729941341981)
,p_plugin_attribute_id=>wwv_flow_api.id(130705470419336112)
,p_display_sequence=>10
,p_display_value=>'Infinite'
,p_return_value=>'infinite'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130706166476343367)
,p_plugin_attribute_id=>wwv_flow_api.id(130705470419336112)
,p_display_sequence=>20
,p_display_value=>'1'
,p_return_value=>'1'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130706516447343875)
,p_plugin_attribute_id=>wwv_flow_api.id(130705470419336112)
,p_display_sequence=>30
,p_display_value=>'2'
,p_return_value=>'2'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130706934809344249)
,p_plugin_attribute_id=>wwv_flow_api.id(130705470419336112)
,p_display_sequence=>40
,p_display_value=>'3'
,p_return_value=>'3'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130707321360344835)
,p_plugin_attribute_id=>wwv_flow_api.id(130705470419336112)
,p_display_sequence=>50
,p_display_value=>'4'
,p_return_value=>'4'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(130707719436345460)
,p_plugin_attribute_id=>wwv_flow_api.id(130705470419336112)
,p_display_sequence=>60
,p_display_value=>'5'
,p_return_value=>'5'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(130708135295349291)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_name=>'animapex - after animation'
,p_display_name=>'animapex-after'
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(130708407192349292)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_name=>'animapex - before animation'
,p_display_name=>'animapex-before'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0A202A20406E616D65737061636520616E696D617065780A202A2A2F0A76617220616E696D61706578203D20616E696D61706578207C7C207B0A09616E696D6174653A2066756E6374696F6E2829207B0A0909766172206461203D20746869733B';
wwv_flow_api.g_varchar2_table(2) := '0A0A09092F2F20617474726962757465730A090976617220616E696D6174696F6E203D2064612E616374696F6E2E61747472696275746530313B0A0909766172206475726174696F6E203D2064612E616374696F6E2E61747472696275746530323B0A09';
wwv_flow_api.g_varchar2_table(3) := '097661722064656C6179203D2064612E616374696F6E2E61747472696275746530333B0A090976617220697465726174696F6E436F756E74203D2064612E616374696F6E2E61747472696275746530343B0A0A090976617220616E696D6174696F6E456E';
wwv_flow_api.g_varchar2_table(4) := '64203D20277765626B6974416E696D6174696F6E456E64206D6F7A416E696D6174696F6E456E64204D53416E696D6174696F6E456E64206F616E696D6174696F6E656E6420616E696D6174696F6E656E64273B0A0A0909242864612E6166666563746564';
wwv_flow_api.g_varchar2_table(5) := '456C656D656E7473292E656163682866756E6374696F6E2829207B0A090909766172206166666563746564456C656D656E74203D20242874686973293B0A0A0909092F2F2041504558206576656E74202D206265666F72650A0909096166666563746564';
wwv_flow_api.g_varchar2_table(6) := '456C656D656E742E747269676765722827616E696D617065782D6265666F726527293B0A0A0909092F2F204F7074696F6E616C206475726174696F6E20706172616D65746572730A090909696620286475726174696F6E20213D3D20756E646566696E65';
wwv_flow_api.g_varchar2_table(7) := '6429207B0A090909096166666563746564456C656D656E742E637373287B0A090909090927616E696D6174696F6E2D6475726174696F6E273A206475726174696F6E202B202773272C0A0909090909272D7765626B69742D616E696D6174696F6E2D6475';
wwv_flow_api.g_varchar2_table(8) := '726174696F6E273A206475726174696F6E202B202773270A090909097D293B0A0909097D0A0A0909092F2F204F7074696F6E616C2064656C617920706172616D65746572730A0909096966202864656C617920213D3D20756E646566696E656429207B0A';
wwv_flow_api.g_varchar2_table(9) := '090909096166666563746564456C656D656E742E637373287B0A090909090927616E696D6174696F6E2D64656C6179273A2064656C6179202B202773272C0A0909090909272D7765626B69742D616E696D6174696F6E2D64656C6179273A2064656C6179';
wwv_flow_api.g_varchar2_table(10) := '202B202773270A090909097D293B0A0909097D0A0A0909092F2F204F7074696F6E616C20697465726174696F6E436F756E7420706172616D65746572730A09090969662028697465726174696F6E436F756E7420213D3D20756E646566696E656429207B';
wwv_flow_api.g_varchar2_table(11) := '0A090909096166666563746564456C656D656E742E637373287B0A090909090927616E696D6174696F6E2D697465726174696F6E2D636F756E74273A20697465726174696F6E436F756E742C0A0909090909272D7765626B69742D616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(12) := '2D697465726174696F6E2D636F756E74273A20697465726174696F6E436F756E740A090909097D293B0A0909097D0A0A0909092F2F20416E696D61746520636F6D706F6E656E740A0909096166666563746564456C656D656E742E616464436C61737328';
wwv_flow_api.g_varchar2_table(13) := '27616E696D617465642027202B20616E696D6174696F6E292E6F6E6528616E696D6174696F6E456E642C2066756E6374696F6E2829207B0A09090909242874686973290A09090909092E72656D6F7665436C6173732827616E696D617465642027202B20';
wwv_flow_api.g_varchar2_table(14) := '616E696D6174696F6E290A09090909092E637373287B0A09090909090927616E696D6174696F6E2D6475726174696F6E273A2027272C0A090909090909272D7765626B69742D616E696D6174696F6E2D6475726174696F6E273A2027272C0A0909090909';
wwv_flow_api.g_varchar2_table(15) := '0927616E696D6174696F6E2D64656C6179273A2027272C0A090909090909272D7765626B69742D616E696D6174696F6E2D64656C6179273A2027272C0A09090909090927616E696D6174696F6E2D697465726174696F6E2D636F756E74273A2027272C0A';
wwv_flow_api.g_varchar2_table(16) := '090909090909272D7765626B69742D616E696D6174696F6E2D697465726174696F6E2D636F756E74273A2027270A09090909097D290A09090909092F2F2041504558206576656E74202D2061667465720A09090909092E747269676765722827616E696D';
wwv_flow_api.g_varchar2_table(17) := '617065782D616674657227293B0A0909097D293B0A09097D293B0A097D0A7D3B0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(130672369153214886)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_file_name=>'js/animapex.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '406368617273657420225554462D38223B0A0A2F2A210A202A20616E696D6174652E637373202D687474703A2F2F64616E6564656E2E6D652F616E696D6174650A202A2056657273696F6E202D20332E352E320A202A204C6963656E73656420756E6465';
wwv_flow_api.g_varchar2_table(2) := '7220746865204D4954206C6963656E7365202D20687474703A2F2F6F70656E736F757263652E6F72672F6C6963656E7365732F4D49540A202A0A202A20436F707972696768742028632920323031372044616E69656C204564656E0A202A2F0A0A2E616E';
wwv_flow_api.g_varchar2_table(3) := '696D617465647B616E696D6174696F6E2D6475726174696F6E3A31733B616E696D6174696F6E2D66696C6C2D6D6F64653A626F74687D2E616E696D617465642E696E66696E6974657B616E696D6174696F6E2D697465726174696F6E2D636F756E743A69';
wwv_flow_api.g_varchar2_table(4) := '6E66696E6974657D2E616E696D617465642E68696E67657B616E696D6174696F6E2D6475726174696F6E3A32737D2E616E696D617465642E626F756E6365496E2C2E616E696D617465642E626F756E63654F75742C2E616E696D617465642E666C69704F';
wwv_flow_api.g_varchar2_table(5) := '7574582C2E616E696D617465642E666C69704F7574597B616E696D6174696F6E2D6475726174696F6E3A2E3735737D406B65796672616D657320626F756E63657B30252C3230252C3533252C3830252C746F7B616E696D6174696F6E2D74696D696E672D';
wwv_flow_api.g_varchar2_table(6) := '66756E6374696F6E3A63756269632D62657A696572282E3231352C2E36312C2E3335352C31293B7472616E73666F726D3A7472616E736C6174655A2830297D3430252C3433257B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A637562';
wwv_flow_api.g_varchar2_table(7) := '69632D62657A696572282E3735352C2E30352C2E3835352C2E3036293B7472616E73666F726D3A7472616E736C617465336428302C2D333070782C30297D3730257B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D6265';
wwv_flow_api.g_varchar2_table(8) := '7A696572282E3735352C2E30352C2E3835352C2E3036293B7472616E73666F726D3A7472616E736C617465336428302C2D313570782C30297D3930257B7472616E73666F726D3A7472616E736C617465336428302C2D3470782C30297D7D2E626F756E63';
wwv_flow_api.g_varchar2_table(9) := '657B616E696D6174696F6E2D6E616D653A626F756E63653B7472616E73666F726D2D6F726967696E3A63656E74657220626F74746F6D7D406B65796672616D657320666C6173687B30252C3530252C746F7B6F7061636974793A317D3235252C3735257B';
wwv_flow_api.g_varchar2_table(10) := '6F7061636974793A307D7D2E666C6173687B616E696D6174696F6E2D6E616D653A666C6173687D406B65796672616D65732070756C73657B30257B7472616E73666F726D3A7363616C65582831297D3530257B7472616E73666F726D3A7363616C653364';
wwv_flow_api.g_varchar2_table(11) := '28312E30352C312E30352C312E3035297D746F7B7472616E73666F726D3A7363616C65582831297D7D2E70756C73657B616E696D6174696F6E2D6E616D653A70756C73657D406B65796672616D65732072756262657242616E647B30257B7472616E7366';
wwv_flow_api.g_varchar2_table(12) := '6F726D3A7363616C65582831297D3330257B7472616E73666F726D3A7363616C65336428312E32352C2E37352C31297D3430257B7472616E73666F726D3A7363616C653364282E37352C312E32352C31297D3530257B7472616E73666F726D3A7363616C';
wwv_flow_api.g_varchar2_table(13) := '65336428312E31352C2E38352C31297D3635257B7472616E73666F726D3A7363616C653364282E39352C312E30352C31297D3735257B7472616E73666F726D3A7363616C65336428312E30352C2E39352C31297D746F7B7472616E73666F726D3A736361';
wwv_flow_api.g_varchar2_table(14) := '6C65582831297D7D2E72756262657242616E647B616E696D6174696F6E2D6E616D653A72756262657242616E647D406B65796672616D6573207368616B657B30252C746F7B7472616E73666F726D3A7472616E736C6174655A2830297D3130252C333025';
wwv_flow_api.g_varchar2_table(15) := '2C3530252C3730252C3930257B7472616E73666F726D3A7472616E736C6174653364282D313070782C302C30297D3230252C3430252C3630252C3830257B7472616E73666F726D3A7472616E736C617465336428313070782C302C30297D7D2E7368616B';
wwv_flow_api.g_varchar2_table(16) := '657B616E696D6174696F6E2D6E616D653A7368616B657D406B65796672616D657320686561645368616B657B30257B7472616E73666F726D3A7472616E736C617465582830297D362E35257B7472616E73666F726D3A7472616E736C61746558282D3670';
wwv_flow_api.g_varchar2_table(17) := '782920726F7461746559282D39646567297D31382E35257B7472616E73666F726D3A7472616E736C61746558283570782920726F74617465592837646567297D33312E35257B7472616E73666F726D3A7472616E736C61746558282D3370782920726F74';
wwv_flow_api.g_varchar2_table(18) := '61746559282D35646567297D34332E35257B7472616E73666F726D3A7472616E736C61746558283270782920726F74617465592833646567297D3530257B7472616E73666F726D3A7472616E736C617465582830297D7D2E686561645368616B657B616E';
wwv_flow_api.g_varchar2_table(19) := '696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E2D6F75743B616E696D6174696F6E2D6E616D653A686561645368616B657D406B65796672616D6573207377696E677B3230257B7472616E73666F726D3A726F746174652831';
wwv_flow_api.g_varchar2_table(20) := '35646567297D3430257B7472616E73666F726D3A726F74617465282D3130646567297D3630257B7472616E73666F726D3A726F746174652835646567297D3830257B7472616E73666F726D3A726F74617465282D35646567297D746F7B7472616E73666F';
wwv_flow_api.g_varchar2_table(21) := '726D3A726F746174652830646567297D7D2E7377696E677B7472616E73666F726D2D6F726967696E3A746F702063656E7465723B616E696D6174696F6E2D6E616D653A7377696E677D406B65796672616D657320746164617B30257B7472616E73666F72';
wwv_flow_api.g_varchar2_table(22) := '6D3A7363616C65582831297D3130252C3230257B7472616E73666F726D3A7363616C653364282E392C2E392C2E392920726F74617465282D33646567297D3330252C3530252C3730252C3930257B7472616E73666F726D3A7363616C65336428312E312C';
wwv_flow_api.g_varchar2_table(23) := '312E312C312E312920726F746174652833646567297D3430252C3630252C3830257B7472616E73666F726D3A7363616C65336428312E312C312E312C312E312920726F74617465282D33646567297D746F7B7472616E73666F726D3A7363616C65582831';
wwv_flow_api.g_varchar2_table(24) := '297D7D2E746164617B616E696D6174696F6E2D6E616D653A746164617D406B65796672616D657320776F62626C657B30257B7472616E73666F726D3A6E6F6E657D3135257B7472616E73666F726D3A7472616E736C6174653364282D3235252C302C3029';
wwv_flow_api.g_varchar2_table(25) := '20726F74617465282D35646567297D3330257B7472616E73666F726D3A7472616E736C6174653364283230252C302C302920726F746174652833646567297D3435257B7472616E73666F726D3A7472616E736C6174653364282D3135252C302C30292072';
wwv_flow_api.g_varchar2_table(26) := '6F74617465282D33646567297D3630257B7472616E73666F726D3A7472616E736C6174653364283130252C302C302920726F746174652832646567297D3735257B7472616E73666F726D3A7472616E736C6174653364282D35252C302C302920726F7461';
wwv_flow_api.g_varchar2_table(27) := '7465282D31646567297D746F7B7472616E73666F726D3A6E6F6E657D7D2E776F62626C657B616E696D6174696F6E2D6E616D653A776F62626C657D406B65796672616D6573206A656C6C6F7B30252C31312E31252C746F7B7472616E73666F726D3A6E6F';
wwv_flow_api.g_varchar2_table(28) := '6E657D32322E32257B7472616E73666F726D3A736B657758282D31322E356465672920736B657759282D31322E35646567297D33332E33257B7472616E73666F726D3A736B65775828362E32356465672920736B65775928362E3235646567297D34342E';
wwv_flow_api.g_varchar2_table(29) := '34257B7472616E73666F726D3A736B657758282D332E3132356465672920736B657759282D332E313235646567297D35352E35257B7472616E73666F726D3A736B65775828312E353632356465672920736B65775928312E35363235646567297D36362E';
wwv_flow_api.g_varchar2_table(30) := '36257B7472616E73666F726D3A736B657758282D2E37383132356465672920736B657759282D2E3738313235646567297D37372E37257B7472616E73666F726D3A736B657758282E3339303632356465672920736B657759282E33393036323564656729';
wwv_flow_api.g_varchar2_table(31) := '7D38382E38257B7472616E73666F726D3A736B657758282D2E313935333132356465672920736B657759282D2E31393533313235646567297D7D2E6A656C6C6F7B616E696D6174696F6E2D6E616D653A6A656C6C6F3B7472616E73666F726D2D6F726967';
wwv_flow_api.g_varchar2_table(32) := '696E3A63656E7465727D406B65796672616D657320626F756E6365496E7B30252C3230252C3430252C3630252C3830252C746F7B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3231352C2E36312C';
wwv_flow_api.g_varchar2_table(33) := '2E3335352C31297D30257B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E332C2E332C2E33297D3230257B7472616E73666F726D3A7363616C65336428312E312C312E312C312E31297D3430257B7472616E73666F726D3A7363';
wwv_flow_api.g_varchar2_table(34) := '616C653364282E392C2E392C2E39297D3630257B6F7061636974793A313B7472616E73666F726D3A7363616C65336428312E30332C312E30332C312E3033297D3830257B7472616E73666F726D3A7363616C653364282E39372C2E39372C2E3937297D74';
wwv_flow_api.g_varchar2_table(35) := '6F7B6F7061636974793A313B7472616E73666F726D3A7363616C65582831297D7D2E626F756E6365496E7B616E696D6174696F6E2D6E616D653A626F756E6365496E7D406B65796672616D657320626F756E6365496E446F776E7B30252C3630252C3735';
wwv_flow_api.g_varchar2_table(36) := '252C3930252C746F7B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3231352C2E36312C2E3335352C31297D30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428';
wwv_flow_api.g_varchar2_table(37) := '302C2D3330303070782C30297D3630257B6F7061636974793A313B7472616E73666F726D3A7472616E736C617465336428302C323570782C30297D3735257B7472616E73666F726D3A7472616E736C617465336428302C2D313070782C30297D3930257B';
wwv_flow_api.g_varchar2_table(38) := '7472616E73666F726D3A7472616E736C617465336428302C3570782C30297D746F7B7472616E73666F726D3A6E6F6E657D7D2E626F756E6365496E446F776E7B616E696D6174696F6E2D6E616D653A626F756E6365496E446F776E7D406B65796672616D';
wwv_flow_api.g_varchar2_table(39) := '657320626F756E6365496E4C6566747B30252C3630252C3735252C3930252C746F7B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3231352C2E36312C2E3335352C31297D30257B6F706163697479';
wwv_flow_api.g_varchar2_table(40) := '3A303B7472616E73666F726D3A7472616E736C6174653364282D3330303070782C302C30297D3630257B6F7061636974793A313B7472616E73666F726D3A7472616E736C617465336428323570782C302C30297D3735257B7472616E73666F726D3A7472';
wwv_flow_api.g_varchar2_table(41) := '616E736C6174653364282D313070782C302C30297D3930257B7472616E73666F726D3A7472616E736C6174653364283570782C302C30297D746F7B7472616E73666F726D3A6E6F6E657D7D2E626F756E6365496E4C6566747B616E696D6174696F6E2D6E';
wwv_flow_api.g_varchar2_table(42) := '616D653A626F756E6365496E4C6566747D406B65796672616D657320626F756E6365496E52696768747B30252C3630252C3735252C3930252C746F7B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E';
wwv_flow_api.g_varchar2_table(43) := '3231352C2E36312C2E3335352C31297D30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C6174653364283330303070782C302C30297D3630257B6F7061636974793A313B7472616E73666F726D3A7472616E736C6174653364282D';
wwv_flow_api.g_varchar2_table(44) := '323570782C302C30297D3735257B7472616E73666F726D3A7472616E736C617465336428313070782C302C30297D3930257B7472616E73666F726D3A7472616E736C6174653364282D3570782C302C30297D746F7B7472616E73666F726D3A6E6F6E657D';
wwv_flow_api.g_varchar2_table(45) := '7D2E626F756E6365496E52696768747B616E696D6174696F6E2D6E616D653A626F756E6365496E52696768747D406B65796672616D657320626F756E6365496E55707B30252C3630252C3735252C3930252C746F7B616E696D6174696F6E2D74696D696E';
wwv_flow_api.g_varchar2_table(46) := '672D66756E6374696F6E3A63756269632D62657A696572282E3231352C2E36312C2E3335352C31297D30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C3330303070782C30297D3630257B6F7061636974793A';
wwv_flow_api.g_varchar2_table(47) := '313B7472616E73666F726D3A7472616E736C617465336428302C2D323070782C30297D3735257B7472616E73666F726D3A7472616E736C617465336428302C313070782C30297D3930257B7472616E73666F726D3A7472616E736C617465336428302C2D';
wwv_flow_api.g_varchar2_table(48) := '3570782C30297D746F7B7472616E73666F726D3A7472616E736C6174655A2830297D7D2E626F756E6365496E55707B616E696D6174696F6E2D6E616D653A626F756E6365496E55707D406B65796672616D657320626F756E63654F75747B3230257B7472';
wwv_flow_api.g_varchar2_table(49) := '616E73666F726D3A7363616C653364282E392C2E392C2E39297D3530252C3535257B6F7061636974793A313B7472616E73666F726D3A7363616C65336428312E312C312E312C312E31297D746F7B6F7061636974793A303B7472616E73666F726D3A7363';
wwv_flow_api.g_varchar2_table(50) := '616C653364282E332C2E332C2E33297D7D2E626F756E63654F75747B616E696D6174696F6E2D6E616D653A626F756E63654F75747D406B65796672616D657320626F756E63654F7574446F776E7B3230257B7472616E73666F726D3A7472616E736C6174';
wwv_flow_api.g_varchar2_table(51) := '65336428302C313070782C30297D3430252C3435257B6F7061636974793A313B7472616E73666F726D3A7472616E736C617465336428302C2D323070782C30297D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428';
wwv_flow_api.g_varchar2_table(52) := '302C3230303070782C30297D7D2E626F756E63654F7574446F776E7B616E696D6174696F6E2D6E616D653A626F756E63654F7574446F776E7D406B65796672616D657320626F756E63654F75744C6566747B3230257B6F7061636974793A313B7472616E';
wwv_flow_api.g_varchar2_table(53) := '73666F726D3A7472616E736C617465336428323070782C302C30297D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C6174653364282D3230303070782C302C30297D7D2E626F756E63654F75744C6566747B616E696D6174696F';
wwv_flow_api.g_varchar2_table(54) := '6E2D6E616D653A626F756E63654F75744C6566747D406B65796672616D657320626F756E63654F757452696768747B3230257B6F7061636974793A313B7472616E73666F726D3A7472616E736C6174653364282D323070782C302C30297D746F7B6F7061';
wwv_flow_api.g_varchar2_table(55) := '636974793A303B7472616E73666F726D3A7472616E736C6174653364283230303070782C302C30297D7D2E626F756E63654F757452696768747B616E696D6174696F6E2D6E616D653A626F756E63654F757452696768747D406B65796672616D65732062';
wwv_flow_api.g_varchar2_table(56) := '6F756E63654F757455707B3230257B7472616E73666F726D3A7472616E736C617465336428302C2D313070782C30297D3430252C3435257B6F7061636974793A313B7472616E73666F726D3A7472616E736C617465336428302C323070782C30297D746F';
wwv_flow_api.g_varchar2_table(57) := '7B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C2D3230303070782C30297D7D2E626F756E63654F757455707B616E696D6174696F6E2D6E616D653A626F756E63654F757455707D406B65796672616D6573206661';
wwv_flow_api.g_varchar2_table(58) := '6465496E7B30257B6F7061636974793A307D746F7B6F7061636974793A317D7D2E66616465496E7B616E696D6174696F6E2D6E616D653A66616465496E7D406B65796672616D65732066616465496E446F776E7B30257B6F7061636974793A303B747261';
wwv_flow_api.g_varchar2_table(59) := '6E73666F726D3A7472616E736C617465336428302C2D313030252C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E66616465496E446F776E7B616E696D6174696F6E2D6E616D653A66616465496E446F776E7D406B65';
wwv_flow_api.g_varchar2_table(60) := '796672616D65732066616465496E446F776E4269677B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C2D3230303070782C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E';
wwv_flow_api.g_varchar2_table(61) := '66616465496E446F776E4269677B616E696D6174696F6E2D6E616D653A66616465496E446F776E4269677D406B65796672616D65732066616465496E4C6566747B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428';
wwv_flow_api.g_varchar2_table(62) := '2D313030252C302C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E66616465496E4C6566747B616E696D6174696F6E2D6E616D653A66616465496E4C6566747D406B65796672616D65732066616465496E4C65667442';
wwv_flow_api.g_varchar2_table(63) := '69677B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C6174653364282D3230303070782C302C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E66616465496E4C6566744269677B616E696D61';
wwv_flow_api.g_varchar2_table(64) := '74696F6E2D6E616D653A66616465496E4C6566744269677D406B65796672616D65732066616465496E52696768747B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428313030252C302C30297D746F7B6F70616369';
wwv_flow_api.g_varchar2_table(65) := '74793A313B7472616E73666F726D3A6E6F6E657D7D2E66616465496E52696768747B616E696D6174696F6E2D6E616D653A66616465496E52696768747D406B65796672616D65732066616465496E52696768744269677B30257B6F7061636974793A303B';
wwv_flow_api.g_varchar2_table(66) := '7472616E73666F726D3A7472616E736C6174653364283230303070782C302C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E66616465496E52696768744269677B616E696D6174696F6E2D6E616D653A66616465496E';
wwv_flow_api.g_varchar2_table(67) := '52696768744269677D406B65796672616D65732066616465496E55707B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C313030252C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E';
wwv_flow_api.g_varchar2_table(68) := '657D7D2E66616465496E55707B616E696D6174696F6E2D6E616D653A66616465496E55707D406B65796672616D65732066616465496E55704269677B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C323030';
wwv_flow_api.g_varchar2_table(69) := '3070782C30297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E66616465496E55704269677B616E696D6174696F6E2D6E616D653A66616465496E55704269677D406B65796672616D657320666164654F75747B30257B6F70';
wwv_flow_api.g_varchar2_table(70) := '61636974793A317D746F7B6F7061636974793A307D7D2E666164654F75747B616E696D6174696F6E2D6E616D653A666164654F75747D406B65796672616D657320666164654F7574446F776E7B30257B6F7061636974793A317D746F7B6F706163697479';
wwv_flow_api.g_varchar2_table(71) := '3A303B7472616E73666F726D3A7472616E736C617465336428302C313030252C30297D7D2E666164654F7574446F776E7B616E696D6174696F6E2D6E616D653A666164654F7574446F776E7D406B65796672616D657320666164654F7574446F776E4269';
wwv_flow_api.g_varchar2_table(72) := '677B30257B6F7061636974793A317D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C3230303070782C30297D7D2E666164654F7574446F776E4269677B616E696D6174696F6E2D6E616D653A666164654F75';
wwv_flow_api.g_varchar2_table(73) := '74446F776E4269677D406B65796672616D657320666164654F75744C6566747B30257B6F7061636974793A317D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C6174653364282D313030252C302C30297D7D2E666164654F7574';
wwv_flow_api.g_varchar2_table(74) := '4C6566747B616E696D6174696F6E2D6E616D653A666164654F75744C6566747D406B65796672616D657320666164654F75744C6566744269677B30257B6F7061636974793A317D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C';
wwv_flow_api.g_varchar2_table(75) := '6174653364282D3230303070782C302C30297D7D2E666164654F75744C6566744269677B616E696D6174696F6E2D6E616D653A666164654F75744C6566744269677D406B65796672616D657320666164654F757452696768747B30257B6F706163697479';
wwv_flow_api.g_varchar2_table(76) := '3A317D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428313030252C302C30297D7D2E666164654F757452696768747B616E696D6174696F6E2D6E616D653A666164654F757452696768747D406B65796672616D65';
wwv_flow_api.g_varchar2_table(77) := '7320666164654F757452696768744269677B30257B6F7061636974793A317D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C6174653364283230303070782C302C30297D7D2E666164654F757452696768744269677B616E696D';
wwv_flow_api.g_varchar2_table(78) := '6174696F6E2D6E616D653A666164654F757452696768744269677D406B65796672616D657320666164654F757455707B30257B6F7061636974793A317D746F7B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428302C2D31';
wwv_flow_api.g_varchar2_table(79) := '3030252C30297D7D2E666164654F757455707B616E696D6174696F6E2D6E616D653A666164654F757455707D406B65796672616D657320666164654F757455704269677B30257B6F7061636974793A317D746F7B6F7061636974793A303B7472616E7366';
wwv_flow_api.g_varchar2_table(80) := '6F726D3A7472616E736C617465336428302C2D3230303070782C30297D7D2E666164654F757455704269677B616E696D6174696F6E2D6E616D653A666164654F757455704269677D406B65796672616D657320666C69707B30257B7472616E73666F726D';
wwv_flow_api.g_varchar2_table(81) := '3A70657273706563746976652834303070782920726F7461746559282D317475726E293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D6F75747D3430257B7472616E73666F726D3A706572737065637469766528343030';
wwv_flow_api.g_varchar2_table(82) := '707829207472616E736C6174655A2831353070782920726F7461746559282D313930646567293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D6F75747D3530257B7472616E73666F726D3A706572737065637469766528';
wwv_flow_api.g_varchar2_table(83) := '343030707829207472616E736C6174655A2831353070782920726F7461746559282D313730646567293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E7D3830257B7472616E73666F726D3A70657273706563746976';
wwv_flow_api.g_varchar2_table(84) := '6528343030707829207363616C653364282E39352C2E39352C2E3935293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E7D746F7B7472616E73666F726D3A7065727370656374697665283430307078293B616E696D';
wwv_flow_api.g_varchar2_table(85) := '6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E7D7D2E616E696D617465642E666C69707B2D7765626B69742D6261636B666163652D7669736962696C6974793A76697369626C653B6261636B666163652D7669736962696C6974';
wwv_flow_api.g_varchar2_table(86) := '793A76697369626C653B616E696D6174696F6E2D6E616D653A666C69707D406B65796672616D657320666C6970496E587B30257B7472616E73666F726D3A70657273706563746976652834303070782920726F7461746558283930646567293B616E696D';
wwv_flow_api.g_varchar2_table(87) := '6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E3B6F7061636974793A307D3430257B7472616E73666F726D3A70657273706563746976652834303070782920726F7461746558282D3230646567293B616E696D6174696F6E2D74';
wwv_flow_api.g_varchar2_table(88) := '696D696E672D66756E6374696F6E3A656173652D696E7D3630257B7472616E73666F726D3A70657273706563746976652834303070782920726F7461746558283130646567293B6F7061636974793A317D3830257B7472616E73666F726D3A7065727370';
wwv_flow_api.g_varchar2_table(89) := '6563746976652834303070782920726F7461746558282D35646567297D746F7B7472616E73666F726D3A7065727370656374697665283430307078297D7D2E666C6970496E587B2D7765626B69742D6261636B666163652D7669736962696C6974793A76';
wwv_flow_api.g_varchar2_table(90) := '697369626C6521696D706F7274616E743B6261636B666163652D7669736962696C6974793A76697369626C6521696D706F7274616E743B616E696D6174696F6E2D6E616D653A666C6970496E587D406B65796672616D657320666C6970496E597B30257B';
wwv_flow_api.g_varchar2_table(91) := '7472616E73666F726D3A70657273706563746976652834303070782920726F7461746559283930646567293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E3B6F7061636974793A307D3430257B7472616E73666F72';
wwv_flow_api.g_varchar2_table(92) := '6D3A70657273706563746976652834303070782920726F7461746559282D3230646567293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E7D3630257B7472616E73666F726D3A706572737065637469766528343030';
wwv_flow_api.g_varchar2_table(93) := '70782920726F7461746559283130646567293B6F7061636974793A317D3830257B7472616E73666F726D3A70657273706563746976652834303070782920726F7461746559282D35646567297D746F7B7472616E73666F726D3A70657273706563746976';
wwv_flow_api.g_varchar2_table(94) := '65283430307078297D7D2E666C6970496E597B2D7765626B69742D6261636B666163652D7669736962696C6974793A76697369626C6521696D706F7274616E743B6261636B666163652D7669736962696C6974793A76697369626C6521696D706F727461';
wwv_flow_api.g_varchar2_table(95) := '6E743B616E696D6174696F6E2D6E616D653A666C6970496E597D406B65796672616D657320666C69704F7574587B30257B7472616E73666F726D3A7065727370656374697665283430307078297D3330257B7472616E73666F726D3A7065727370656374';
wwv_flow_api.g_varchar2_table(96) := '6976652834303070782920726F7461746558282D3230646567293B6F7061636974793A317D746F7B7472616E73666F726D3A70657273706563746976652834303070782920726F7461746558283930646567293B6F7061636974793A307D7D2E666C6970';
wwv_flow_api.g_varchar2_table(97) := '4F7574587B616E696D6174696F6E2D6E616D653A666C69704F7574583B2D7765626B69742D6261636B666163652D7669736962696C6974793A76697369626C6521696D706F7274616E743B6261636B666163652D7669736962696C6974793A7669736962';
wwv_flow_api.g_varchar2_table(98) := '6C6521696D706F7274616E747D406B65796672616D657320666C69704F7574597B30257B7472616E73666F726D3A7065727370656374697665283430307078297D3330257B7472616E73666F726D3A70657273706563746976652834303070782920726F';
wwv_flow_api.g_varchar2_table(99) := '7461746559282D3135646567293B6F7061636974793A317D746F7B7472616E73666F726D3A70657273706563746976652834303070782920726F7461746559283930646567293B6F7061636974793A307D7D2E666C69704F7574597B2D7765626B69742D';
wwv_flow_api.g_varchar2_table(100) := '6261636B666163652D7669736962696C6974793A76697369626C6521696D706F7274616E743B6261636B666163652D7669736962696C6974793A76697369626C6521696D706F7274616E743B616E696D6174696F6E2D6E616D653A666C69704F7574597D';
wwv_flow_api.g_varchar2_table(101) := '406B65796672616D6573206C696768745370656564496E7B30257B7472616E73666F726D3A7472616E736C617465336428313030252C302C302920736B657758282D3330646567293B6F7061636974793A307D3630257B7472616E73666F726D3A736B65';
wwv_flow_api.g_varchar2_table(102) := '7758283230646567293B6F7061636974793A317D3830257B7472616E73666F726D3A736B657758282D35646567293B6F7061636974793A317D746F7B7472616E73666F726D3A6E6F6E653B6F7061636974793A317D7D2E6C696768745370656564496E7B';
wwv_flow_api.g_varchar2_table(103) := '616E696D6174696F6E2D6E616D653A6C696768745370656564496E3B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D6F75747D406B65796672616D6573206C6967687453706565644F75747B30257B6F7061636974793A31';
wwv_flow_api.g_varchar2_table(104) := '7D746F7B7472616E73666F726D3A7472616E736C617465336428313030252C302C302920736B657758283330646567293B6F7061636974793A307D7D2E6C6967687453706565644F75747B616E696D6174696F6E2D6E616D653A6C696768745370656564';
wwv_flow_api.g_varchar2_table(105) := '4F75743B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E7D406B65796672616D657320726F74617465496E7B30257B7472616E73666F726D2D6F726967696E3A63656E7465723B7472616E73666F726D3A726F746174';
wwv_flow_api.g_varchar2_table(106) := '65282D323030646567293B6F7061636974793A307D746F7B7472616E73666F726D2D6F726967696E3A63656E7465723B7472616E73666F726D3A6E6F6E653B6F7061636974793A317D7D2E726F74617465496E7B616E696D6174696F6E2D6E616D653A72';
wwv_flow_api.g_varchar2_table(107) := '6F74617465496E7D406B65796672616D657320726F74617465496E446F776E4C6566747B30257B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B7472616E73666F726D3A726F74617465282D3435646567293B6F706163697479';
wwv_flow_api.g_varchar2_table(108) := '3A307D746F7B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B7472616E73666F726D3A6E6F6E653B6F7061636974793A317D7D2E726F74617465496E446F776E4C6566747B616E696D6174696F6E2D6E616D653A726F74617465';
wwv_flow_api.g_varchar2_table(109) := '496E446F776E4C6566747D406B65796672616D657320726F74617465496E446F776E52696768747B30257B7472616E73666F726D2D6F726967696E3A726967687420626F74746F6D3B7472616E73666F726D3A726F74617465283435646567293B6F7061';
wwv_flow_api.g_varchar2_table(110) := '636974793A307D746F7B7472616E73666F726D2D6F726967696E3A726967687420626F74746F6D3B7472616E73666F726D3A6E6F6E653B6F7061636974793A317D7D2E726F74617465496E446F776E52696768747B616E696D6174696F6E2D6E616D653A';
wwv_flow_api.g_varchar2_table(111) := '726F74617465496E446F776E52696768747D406B65796672616D657320726F74617465496E55704C6566747B30257B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B7472616E73666F726D3A726F74617465283435646567293B';
wwv_flow_api.g_varchar2_table(112) := '6F7061636974793A307D746F7B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B7472616E73666F726D3A6E6F6E653B6F7061636974793A317D7D2E726F74617465496E55704C6566747B616E696D6174696F6E2D6E616D653A72';
wwv_flow_api.g_varchar2_table(113) := '6F74617465496E55704C6566747D406B65796672616D657320726F74617465496E557052696768747B30257B7472616E73666F726D2D6F726967696E3A726967687420626F74746F6D3B7472616E73666F726D3A726F74617465282D3930646567293B6F';
wwv_flow_api.g_varchar2_table(114) := '7061636974793A307D746F7B7472616E73666F726D2D6F726967696E3A726967687420626F74746F6D3B7472616E73666F726D3A6E6F6E653B6F7061636974793A317D7D2E726F74617465496E557052696768747B616E696D6174696F6E2D6E616D653A';
wwv_flow_api.g_varchar2_table(115) := '726F74617465496E557052696768747D406B65796672616D657320726F746174654F75747B30257B7472616E73666F726D2D6F726967696E3A63656E7465723B6F7061636974793A317D746F7B7472616E73666F726D2D6F726967696E3A63656E746572';
wwv_flow_api.g_varchar2_table(116) := '3B7472616E73666F726D3A726F7461746528323030646567293B6F7061636974793A307D7D2E726F746174654F75747B616E696D6174696F6E2D6E616D653A726F746174654F75747D406B65796672616D657320726F746174654F7574446F776E4C6566';
wwv_flow_api.g_varchar2_table(117) := '747B30257B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B6F7061636974793A317D746F7B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B7472616E73666F726D3A726F74617465283435646567293B';
wwv_flow_api.g_varchar2_table(118) := '6F7061636974793A307D7D2E726F746174654F7574446F776E4C6566747B616E696D6174696F6E2D6E616D653A726F746174654F7574446F776E4C6566747D406B65796672616D657320726F746174654F7574446F776E52696768747B30257B7472616E';
wwv_flow_api.g_varchar2_table(119) := '73666F726D2D6F726967696E3A726967687420626F74746F6D3B6F7061636974793A317D746F7B7472616E73666F726D2D6F726967696E3A726967687420626F74746F6D3B7472616E73666F726D3A726F74617465282D3435646567293B6F7061636974';
wwv_flow_api.g_varchar2_table(120) := '793A307D7D2E726F746174654F7574446F776E52696768747B616E696D6174696F6E2D6E616D653A726F746174654F7574446F776E52696768747D406B65796672616D657320726F746174654F757455704C6566747B30257B7472616E73666F726D2D6F';
wwv_flow_api.g_varchar2_table(121) := '726967696E3A6C65667420626F74746F6D3B6F7061636974793A317D746F7B7472616E73666F726D2D6F726967696E3A6C65667420626F74746F6D3B7472616E73666F726D3A726F74617465282D3435646567293B6F7061636974793A307D7D2E726F74';
wwv_flow_api.g_varchar2_table(122) := '6174654F757455704C6566747B616E696D6174696F6E2D6E616D653A726F746174654F757455704C6566747D406B65796672616D657320726F746174654F7574557052696768747B30257B7472616E73666F726D2D6F726967696E3A726967687420626F';
wwv_flow_api.g_varchar2_table(123) := '74746F6D3B6F7061636974793A317D746F7B7472616E73666F726D2D6F726967696E3A726967687420626F74746F6D3B7472616E73666F726D3A726F74617465283930646567293B6F7061636974793A307D7D2E726F746174654F757455705269676874';
wwv_flow_api.g_varchar2_table(124) := '7B616E696D6174696F6E2D6E616D653A726F746174654F7574557052696768747D406B65796672616D65732068696E67657B30257B7472616E73666F726D2D6F726967696E3A746F70206C6566743B616E696D6174696F6E2D74696D696E672D66756E63';
wwv_flow_api.g_varchar2_table(125) := '74696F6E3A656173652D696E2D6F75747D3230252C3630257B7472616E73666F726D3A726F74617465283830646567293B7472616E73666F726D2D6F726967696E3A746F70206C6566743B616E696D6174696F6E2D74696D696E672D66756E6374696F6E';
wwv_flow_api.g_varchar2_table(126) := '3A656173652D696E2D6F75747D3430252C3830257B7472616E73666F726D3A726F74617465283630646567293B7472616E73666F726D2D6F726967696E3A746F70206C6566743B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173';
wwv_flow_api.g_varchar2_table(127) := '652D696E2D6F75743B6F7061636974793A317D746F7B7472616E73666F726D3A7472616E736C617465336428302C37303070782C30293B6F7061636974793A307D7D2E68696E67657B616E696D6174696F6E2D6E616D653A68696E67657D406B65796672';
wwv_flow_api.g_varchar2_table(128) := '616D6573206A61636B496E546865426F787B30257B6F7061636974793A303B7472616E73666F726D3A7363616C65282E312920726F74617465283330646567293B7472616E73666F726D2D6F726967696E3A63656E74657220626F74746F6D7D3530257B';
wwv_flow_api.g_varchar2_table(129) := '7472616E73666F726D3A726F74617465282D3130646567297D3730257B7472616E73666F726D3A726F746174652833646567297D746F7B6F7061636974793A313B7472616E73666F726D3A7363616C652831297D7D2E6A61636B496E546865426F787B61';
wwv_flow_api.g_varchar2_table(130) := '6E696D6174696F6E2D6E616D653A6A61636B496E546865426F787D406B65796672616D657320726F6C6C496E7B30257B6F7061636974793A303B7472616E73666F726D3A7472616E736C6174653364282D313030252C302C302920726F74617465282D31';
wwv_flow_api.g_varchar2_table(131) := '3230646567297D746F7B6F7061636974793A313B7472616E73666F726D3A6E6F6E657D7D2E726F6C6C496E7B616E696D6174696F6E2D6E616D653A726F6C6C496E7D406B65796672616D657320726F6C6C4F75747B30257B6F7061636974793A317D746F';
wwv_flow_api.g_varchar2_table(132) := '7B6F7061636974793A303B7472616E73666F726D3A7472616E736C617465336428313030252C302C302920726F7461746528313230646567297D7D2E726F6C6C4F75747B616E696D6174696F6E2D6E616D653A726F6C6C4F75747D406B65796672616D65';
wwv_flow_api.g_varchar2_table(133) := '73207A6F6F6D496E7B30257B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E332C2E332C2E33297D3530257B6F7061636974793A317D7D2E7A6F6F6D496E7B616E696D6174696F6E2D6E616D653A7A6F6F6D496E7D406B657966';
wwv_flow_api.g_varchar2_table(134) := '72616D6573207A6F6F6D496E446F776E7B30257B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E312C2E312C2E3129207472616E736C617465336428302C2D3130303070782C30293B616E696D6174696F6E2D74696D696E672D';
wwv_flow_api.g_varchar2_table(135) := '66756E6374696F6E3A63756269632D62657A696572282E35352C2E3035352C2E3637352C2E3139297D3630257B6F7061636974793A313B7472616E73666F726D3A7363616C653364282E3437352C2E3437352C2E34373529207472616E736C6174653364';
wwv_flow_api.g_varchar2_table(136) := '28302C363070782C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3137352C2E3838352C2E33322C31297D7D2E7A6F6F6D496E446F776E7B616E696D6174696F6E2D6E616D653A7A6F6F6D49';
wwv_flow_api.g_varchar2_table(137) := '6E446F776E7D406B65796672616D6573207A6F6F6D496E4C6566747B30257B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E312C2E312C2E3129207472616E736C6174653364282D3130303070782C302C30293B616E696D6174';
wwv_flow_api.g_varchar2_table(138) := '696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E35352C2E3035352C2E3637352C2E3139297D3630257B6F7061636974793A313B7472616E73666F726D3A7363616C653364282E3437352C2E3437352C2E3437352920';
wwv_flow_api.g_varchar2_table(139) := '7472616E736C617465336428313070782C302C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3137352C2E3838352C2E33322C31297D7D2E7A6F6F6D496E4C6566747B616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(140) := '2D6E616D653A7A6F6F6D496E4C6566747D406B65796672616D6573207A6F6F6D496E52696768747B30257B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E312C2E312C2E3129207472616E736C6174653364283130303070782C';
wwv_flow_api.g_varchar2_table(141) := '302C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E35352C2E3035352C2E3637352C2E3139297D3630257B6F7061636974793A313B7472616E73666F726D3A7363616C653364282E3437352C';
wwv_flow_api.g_varchar2_table(142) := '2E3437352C2E34373529207472616E736C6174653364282D313070782C302C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3137352C2E3838352C2E33322C31297D7D2E7A6F6F6D496E5269';
wwv_flow_api.g_varchar2_table(143) := '6768747B616E696D6174696F6E2D6E616D653A7A6F6F6D496E52696768747D406B65796672616D6573207A6F6F6D496E55707B30257B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E312C2E312C2E3129207472616E736C6174';
wwv_flow_api.g_varchar2_table(144) := '65336428302C3130303070782C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E35352C2E3035352C2E3637352C2E3139297D3630257B6F7061636974793A313B7472616E73666F726D3A7363';
wwv_flow_api.g_varchar2_table(145) := '616C653364282E3437352C2E3437352C2E34373529207472616E736C617465336428302C2D363070782C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3137352C2E3838352C2E33322C3129';
wwv_flow_api.g_varchar2_table(146) := '7D7D2E7A6F6F6D496E55707B616E696D6174696F6E2D6E616D653A7A6F6F6D496E55707D406B65796672616D6573207A6F6F6D4F75747B30257B6F7061636974793A317D3530257B6F7061636974793A303B7472616E73666F726D3A7363616C65336428';
wwv_flow_api.g_varchar2_table(147) := '2E332C2E332C2E33297D746F7B6F7061636974793A307D7D2E7A6F6F6D4F75747B616E696D6174696F6E2D6E616D653A7A6F6F6D4F75747D406B65796672616D6573207A6F6F6D4F7574446F776E7B3430257B6F7061636974793A313B7472616E73666F';
wwv_flow_api.g_varchar2_table(148) := '726D3A7363616C653364282E3437352C2E3437352C2E34373529207472616E736C617465336428302C2D363070782C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E35352C2E3035352C2E36';
wwv_flow_api.g_varchar2_table(149) := '37352C2E3139297D746F7B6F7061636974793A303B7472616E73666F726D3A7363616C653364282E312C2E312C2E3129207472616E736C617465336428302C3230303070782C30293B7472616E73666F726D2D6F726967696E3A63656E74657220626F74';
wwv_flow_api.g_varchar2_table(150) := '746F6D3B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3137352C2E3838352C2E33322C31297D7D2E7A6F6F6D4F7574446F776E7B616E696D6174696F6E2D6E616D653A7A6F6F6D4F7574446F776E';
wwv_flow_api.g_varchar2_table(151) := '7D406B65796672616D6573207A6F6F6D4F75744C6566747B3430257B6F7061636974793A313B7472616E73666F726D3A7363616C653364282E3437352C2E3437352C2E34373529207472616E736C617465336428343270782C302C30297D746F7B6F7061';
wwv_flow_api.g_varchar2_table(152) := '636974793A303B7472616E73666F726D3A7363616C65282E3129207472616E736C6174653364282D3230303070782C302C30293B7472616E73666F726D2D6F726967696E3A6C6566742063656E7465727D7D2E7A6F6F6D4F75744C6566747B616E696D61';
wwv_flow_api.g_varchar2_table(153) := '74696F6E2D6E616D653A7A6F6F6D4F75744C6566747D406B65796672616D6573207A6F6F6D4F757452696768747B3430257B6F7061636974793A313B7472616E73666F726D3A7363616C653364282E3437352C2E3437352C2E34373529207472616E736C';
wwv_flow_api.g_varchar2_table(154) := '6174653364282D343270782C302C30297D746F7B6F7061636974793A303B7472616E73666F726D3A7363616C65282E3129207472616E736C6174653364283230303070782C302C30293B7472616E73666F726D2D6F726967696E3A72696768742063656E';
wwv_flow_api.g_varchar2_table(155) := '7465727D7D2E7A6F6F6D4F757452696768747B616E696D6174696F6E2D6E616D653A7A6F6F6D4F757452696768747D406B65796672616D6573207A6F6F6D4F757455707B3430257B6F7061636974793A313B7472616E73666F726D3A7363616C65336428';
wwv_flow_api.g_varchar2_table(156) := '2E3437352C2E3437352C2E34373529207472616E736C617465336428302C363070782C30293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E35352C2E3035352C2E3637352C2E3139297D746F7B6F';
wwv_flow_api.g_varchar2_table(157) := '7061636974793A303B7472616E73666F726D3A7363616C653364282E312C2E312C2E3129207472616E736C617465336428302C2D3230303070782C30293B7472616E73666F726D2D6F726967696E3A63656E74657220626F74746F6D3B616E696D617469';
wwv_flow_api.g_varchar2_table(158) := '6F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E3137352C2E3838352C2E33322C31297D7D2E7A6F6F6D4F757455707B616E696D6174696F6E2D6E616D653A7A6F6F6D4F757455707D406B65796672616D657320736C69';
wwv_flow_api.g_varchar2_table(159) := '6465496E446F776E7B30257B7472616E73666F726D3A7472616E736C617465336428302C2D313030252C30293B7669736962696C6974793A76697369626C657D746F7B7472616E73666F726D3A7472616E736C6174655A2830297D7D2E736C696465496E';
wwv_flow_api.g_varchar2_table(160) := '446F776E7B616E696D6174696F6E2D6E616D653A736C696465496E446F776E7D406B65796672616D657320736C696465496E4C6566747B30257B7472616E73666F726D3A7472616E736C6174653364282D313030252C302C30293B7669736962696C6974';
wwv_flow_api.g_varchar2_table(161) := '793A76697369626C657D746F7B7472616E73666F726D3A7472616E736C6174655A2830297D7D2E736C696465496E4C6566747B616E696D6174696F6E2D6E616D653A736C696465496E4C6566747D406B65796672616D657320736C696465496E52696768';
wwv_flow_api.g_varchar2_table(162) := '747B30257B7472616E73666F726D3A7472616E736C617465336428313030252C302C30293B7669736962696C6974793A76697369626C657D746F7B7472616E73666F726D3A7472616E736C6174655A2830297D7D2E736C696465496E52696768747B616E';
wwv_flow_api.g_varchar2_table(163) := '696D6174696F6E2D6E616D653A736C696465496E52696768747D406B65796672616D657320736C696465496E55707B30257B7472616E73666F726D3A7472616E736C617465336428302C313030252C30293B7669736962696C6974793A76697369626C65';
wwv_flow_api.g_varchar2_table(164) := '7D746F7B7472616E73666F726D3A7472616E736C6174655A2830297D7D2E736C696465496E55707B616E696D6174696F6E2D6E616D653A736C696465496E55707D406B65796672616D657320736C6964654F7574446F776E7B30257B7472616E73666F72';
wwv_flow_api.g_varchar2_table(165) := '6D3A7472616E736C6174655A2830297D746F7B7669736962696C6974793A68696464656E3B7472616E73666F726D3A7472616E736C617465336428302C313030252C30297D7D2E736C6964654F7574446F776E7B616E696D6174696F6E2D6E616D653A73';
wwv_flow_api.g_varchar2_table(166) := '6C6964654F7574446F776E7D406B65796672616D657320736C6964654F75744C6566747B30257B7472616E73666F726D3A7472616E736C6174655A2830297D746F7B7669736962696C6974793A68696464656E3B7472616E73666F726D3A7472616E736C';
wwv_flow_api.g_varchar2_table(167) := '6174653364282D313030252C302C30297D7D2E736C6964654F75744C6566747B616E696D6174696F6E2D6E616D653A736C6964654F75744C6566747D406B65796672616D657320736C6964654F757452696768747B30257B7472616E73666F726D3A7472';
wwv_flow_api.g_varchar2_table(168) := '616E736C6174655A2830297D746F7B7669736962696C6974793A68696464656E3B7472616E73666F726D3A7472616E736C617465336428313030252C302C30297D7D2E736C6964654F757452696768747B616E696D6174696F6E2D6E616D653A736C6964';
wwv_flow_api.g_varchar2_table(169) := '654F757452696768747D406B65796672616D657320736C6964654F757455707B30257B7472616E73666F726D3A7472616E736C6174655A2830297D746F7B7669736962696C6974793A68696464656E3B7472616E73666F726D3A7472616E736C61746533';
wwv_flow_api.g_varchar2_table(170) := '6428302C2D313030252C30297D7D2E736C6964654F757455707B616E696D6174696F6E2D6E616D653A736C6964654F757455707D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(130672760539216188)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_file_name=>'lib/animate/animate.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '406368617273657420225554462D38223B0A0A2F2A210A202A20616E696D6174652E637373202D687474703A2F2F64616E6564656E2E6D652F616E696D6174650A202A2056657273696F6E202D20332E352E320A202A204C6963656E73656420756E6465';
wwv_flow_api.g_varchar2_table(2) := '7220746865204D4954206C6963656E7365202D20687474703A2F2F6F70656E736F757263652E6F72672F6C6963656E7365732F4D49540A202A0A202A20436F707972696768742028632920323031372044616E69656C204564656E0A202A2F0A0A2E616E';
wwv_flow_api.g_varchar2_table(3) := '696D61746564207B0A2020616E696D6174696F6E2D6475726174696F6E3A2031733B0A2020616E696D6174696F6E2D66696C6C2D6D6F64653A20626F74683B0A7D0A0A2E616E696D617465642E696E66696E697465207B0A2020616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(4) := '697465726174696F6E2D636F756E743A20696E66696E6974653B0A7D0A0A2E616E696D617465642E68696E6765207B0A2020616E696D6174696F6E2D6475726174696F6E3A2032733B0A7D0A0A2E616E696D617465642E666C69704F7574582C0A2E616E';
wwv_flow_api.g_varchar2_table(5) := '696D617465642E666C69704F7574592C0A2E616E696D617465642E626F756E6365496E2C0A2E616E696D617465642E626F756E63654F7574207B0A2020616E696D6174696F6E2D6475726174696F6E3A202E3735733B0A7D0A0A406B65796672616D6573';
wwv_flow_api.g_varchar2_table(6) := '20626F756E6365207B0A202066726F6D2C203230252C203533252C203830252C20746F207B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3231352C20302E3631302C20302E3335';
wwv_flow_api.g_varchar2_table(7) := '352C20312E303030293B0A202020207472616E73666F726D3A207472616E736C617465336428302C302C30293B0A20207D0A0A20203430252C20343325207B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A206375626963';
wwv_flow_api.g_varchar2_table(8) := '2D62657A69657228302E3735352C20302E3035302C20302E3835352C20302E303630293B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D333070782C2030293B0A20207D0A0A2020373025207B0A20202020616E696D61';
wwv_flow_api.g_varchar2_table(9) := '74696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3735352C20302E3035302C20302E3835352C20302E303630293B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313570782C';
wwv_flow_api.g_varchar2_table(10) := '2030293B0A20207D0A0A2020393025207B0A202020207472616E73666F726D3A207472616E736C617465336428302C2D3470782C30293B0A20207D0A7D0A0A2E626F756E6365207B0A2020616E696D6174696F6E2D6E616D653A20626F756E63653B0A20';
wwv_flow_api.g_varchar2_table(11) := '207472616E73666F726D2D6F726967696E3A2063656E74657220626F74746F6D3B0A7D0A0A406B65796672616D657320666C617368207B0A202066726F6D2C203530252C20746F207B0A202020206F7061636974793A20313B0A20207D0A0A2020323525';
wwv_flow_api.g_varchar2_table(12) := '2C20373525207B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E666C617368207B0A2020616E696D6174696F6E2D6E616D653A20666C6173683B0A7D0A0A2F2A206F726967696E616C6C7920617574686F726564206279204E69636B2050';
wwv_flow_api.g_varchar2_table(13) := '6574746974202D2068747470733A2F2F6769746875622E636F6D2F6E69636B7065747469742F676C696465202A2F0A0A406B65796672616D65732070756C7365207B0A202066726F6D207B0A202020207472616E73666F726D3A207363616C6533642831';
wwv_flow_api.g_varchar2_table(14) := '2C20312C2031293B0A20207D0A0A2020353025207B0A202020207472616E73666F726D3A207363616C65336428312E30352C20312E30352C20312E3035293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207363616C6533642831';
wwv_flow_api.g_varchar2_table(15) := '2C20312C2031293B0A20207D0A7D0A0A2E70756C7365207B0A2020616E696D6174696F6E2D6E616D653A2070756C73653B0A7D0A0A406B65796672616D65732072756262657242616E64207B0A202066726F6D207B0A202020207472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(16) := '207363616C65336428312C20312C2031293B0A20207D0A0A2020333025207B0A202020207472616E73666F726D3A207363616C65336428312E32352C20302E37352C2031293B0A20207D0A0A2020343025207B0A202020207472616E73666F726D3A2073';
wwv_flow_api.g_varchar2_table(17) := '63616C65336428302E37352C20312E32352C2031293B0A20207D0A0A2020353025207B0A202020207472616E73666F726D3A207363616C65336428312E31352C20302E38352C2031293B0A20207D0A0A2020363525207B0A202020207472616E73666F72';
wwv_flow_api.g_varchar2_table(18) := '6D3A207363616C653364282E39352C20312E30352C2031293B0A20207D0A0A2020373525207B0A202020207472616E73666F726D3A207363616C65336428312E30352C202E39352C2031293B0A20207D0A0A2020746F207B0A202020207472616E73666F';
wwv_flow_api.g_varchar2_table(19) := '726D3A207363616C65336428312C20312C2031293B0A20207D0A7D0A0A2E72756262657242616E64207B0A2020616E696D6174696F6E2D6E616D653A2072756262657242616E643B0A7D0A0A406B65796672616D6573207368616B65207B0A202066726F';
wwv_flow_api.g_varchar2_table(20) := '6D2C20746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A20207D0A0A20203130252C203330252C203530252C203730252C20393025207B0A202020207472616E73666F726D3A207472616E736C61';
wwv_flow_api.g_varchar2_table(21) := '74653364282D313070782C20302C2030293B0A20207D0A0A20203230252C203430252C203630252C20383025207B0A202020207472616E73666F726D3A207472616E736C617465336428313070782C20302C2030293B0A20207D0A7D0A0A2E7368616B65';
wwv_flow_api.g_varchar2_table(22) := '207B0A2020616E696D6174696F6E2D6E616D653A207368616B653B0A7D0A0A406B65796672616D657320686561645368616B65207B0A20203025207B0A202020207472616E73666F726D3A207472616E736C617465582830293B0A20207D0A0A2020362E';
wwv_flow_api.g_varchar2_table(23) := '3525207B0A202020207472616E73666F726D3A207472616E736C61746558282D3670782920726F7461746559282D39646567293B0A20207D0A0A202031382E3525207B0A202020207472616E73666F726D3A207472616E736C6174655828357078292072';
wwv_flow_api.g_varchar2_table(24) := '6F74617465592837646567293B0A20207D0A0A202033312E3525207B0A202020207472616E73666F726D3A207472616E736C61746558282D3370782920726F7461746559282D35646567293B0A20207D0A0A202034332E3525207B0A202020207472616E';
wwv_flow_api.g_varchar2_table(25) := '73666F726D3A207472616E736C61746558283270782920726F74617465592833646567293B0A20207D0A0A2020353025207B0A202020207472616E73666F726D3A207472616E736C617465582830293B0A20207D0A7D0A0A2E686561645368616B65207B';
wwv_flow_api.g_varchar2_table(26) := '0A2020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E2D6F75743B0A2020616E696D6174696F6E2D6E616D653A20686561645368616B653B0A7D0A0A406B65796672616D6573207377696E67207B0A202032302520';
wwv_flow_api.g_varchar2_table(27) := '7B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C203135646567293B0A20207D0A0A2020343025207B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C202D3130646567293B0A2020';
wwv_flow_api.g_varchar2_table(28) := '7D0A0A2020363025207B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C2035646567293B0A20207D0A0A2020383025207B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C202D3564';
wwv_flow_api.g_varchar2_table(29) := '6567293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C2030646567293B0A20207D0A7D0A0A2E7377696E67207B0A20207472616E73666F726D2D6F726967696E3A20746F702063656E';
wwv_flow_api.g_varchar2_table(30) := '7465723B0A2020616E696D6174696F6E2D6E616D653A207377696E673B0A7D0A0A406B65796672616D65732074616461207B0A202066726F6D207B0A202020207472616E73666F726D3A207363616C65336428312C20312C2031293B0A20207D0A0A2020';
wwv_flow_api.g_varchar2_table(31) := '3130252C20323025207B0A202020207472616E73666F726D3A207363616C653364282E392C202E392C202E392920726F74617465336428302C20302C20312C202D33646567293B0A20207D0A0A20203330252C203530252C203730252C20393025207B0A';
wwv_flow_api.g_varchar2_table(32) := '202020207472616E73666F726D3A207363616C65336428312E312C20312E312C20312E312920726F74617465336428302C20302C20312C2033646567293B0A20207D0A0A20203430252C203630252C20383025207B0A202020207472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(33) := '207363616C65336428312E312C20312E312C20312E312920726F74617465336428302C20302C20312C202D33646567293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207363616C65336428312C20312C2031293B0A20207D0A7D';
wwv_flow_api.g_varchar2_table(34) := '0A0A2E74616461207B0A2020616E696D6174696F6E2D6E616D653A20746164613B0A7D0A0A2F2A206F726967696E616C6C7920617574686F726564206279204E69636B20506574746974202D2068747470733A2F2F6769746875622E636F6D2F6E69636B';
wwv_flow_api.g_varchar2_table(35) := '7065747469742F676C696465202A2F0A0A406B65796672616D657320776F62626C65207B0A202066726F6D207B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A0A2020313525207B0A202020207472616E73666F726D3A207472616E73';
wwv_flow_api.g_varchar2_table(36) := '6C6174653364282D3235252C20302C20302920726F74617465336428302C20302C20312C202D35646567293B0A20207D0A0A2020333025207B0A202020207472616E73666F726D3A207472616E736C6174653364283230252C20302C20302920726F7461';
wwv_flow_api.g_varchar2_table(37) := '7465336428302C20302C20312C2033646567293B0A20207D0A0A2020343525207B0A202020207472616E73666F726D3A207472616E736C6174653364282D3135252C20302C20302920726F74617465336428302C20302C20312C202D33646567293B0A20';
wwv_flow_api.g_varchar2_table(38) := '207D0A0A2020363025207B0A202020207472616E73666F726D3A207472616E736C6174653364283130252C20302C20302920726F74617465336428302C20302C20312C2032646567293B0A20207D0A0A2020373525207B0A202020207472616E73666F72';
wwv_flow_api.g_varchar2_table(39) := '6D3A207472616E736C6174653364282D35252C20302C20302920726F74617465336428302C20302C20312C202D31646567293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E776F62626C6520';
wwv_flow_api.g_varchar2_table(40) := '7B0A2020616E696D6174696F6E2D6E616D653A20776F62626C653B0A7D0A0A406B65796672616D6573206A656C6C6F207B0A202066726F6D2C2031312E31252C20746F207B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A0A20203232';
wwv_flow_api.g_varchar2_table(41) := '2E3225207B0A202020207472616E73666F726D3A20736B657758282D31322E356465672920736B657759282D31322E35646567293B0A20207D0A0A202033332E3325207B0A202020207472616E73666F726D3A20736B65775828362E3235646567292073';
wwv_flow_api.g_varchar2_table(42) := '6B65775928362E3235646567293B0A20207D0A0A202034342E3425207B0A202020207472616E73666F726D3A20736B657758282D332E3132356465672920736B657759282D332E313235646567293B0A20207D0A0A202035352E3525207B0A2020202074';
wwv_flow_api.g_varchar2_table(43) := '72616E73666F726D3A20736B65775828312E353632356465672920736B65775928312E35363235646567293B0A20207D0A0A202036362E3625207B0A202020207472616E73666F726D3A20736B657758282D302E37383132356465672920736B65775928';
wwv_flow_api.g_varchar2_table(44) := '2D302E3738313235646567293B0A20207D0A0A202037372E3725207B0A202020207472616E73666F726D3A20736B65775828302E3339303632356465672920736B65775928302E333930363235646567293B0A20207D0A0A202038382E3825207B0A2020';
wwv_flow_api.g_varchar2_table(45) := '20207472616E73666F726D3A20736B657758282D302E313935333132356465672920736B657759282D302E31393533313235646567293B0A20207D0A7D0A0A2E6A656C6C6F207B0A2020616E696D6174696F6E2D6E616D653A206A656C6C6F3B0A202074';
wwv_flow_api.g_varchar2_table(46) := '72616E73666F726D2D6F726967696E3A2063656E7465723B0A7D0A0A406B65796672616D657320626F756E6365496E207B0A202066726F6D2C203230252C203430252C203630252C203830252C20746F207B0A20202020616E696D6174696F6E2D74696D';
wwv_flow_api.g_varchar2_table(47) := '696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3231352C20302E3631302C20302E3335352C20312E303030293B0A20207D0A0A20203025207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A2073';
wwv_flow_api.g_varchar2_table(48) := '63616C653364282E332C202E332C202E33293B0A20207D0A0A2020323025207B0A202020207472616E73666F726D3A207363616C65336428312E312C20312E312C20312E31293B0A20207D0A0A2020343025207B0A202020207472616E73666F726D3A20';
wwv_flow_api.g_varchar2_table(49) := '7363616C653364282E392C202E392C202E39293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C65336428312E30332C20312E30332C20312E3033293B0A20207D0A0A202038';
wwv_flow_api.g_varchar2_table(50) := '3025207B0A202020207472616E73666F726D3A207363616C653364282E39372C202E39372C202E3937293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C65336428312C20312C';
wwv_flow_api.g_varchar2_table(51) := '2031293B0A20207D0A7D0A0A2E626F756E6365496E207B0A2020616E696D6174696F6E2D6E616D653A20626F756E6365496E3B0A7D0A0A406B65796672616D657320626F756E6365496E446F776E207B0A202066726F6D2C203630252C203735252C2039';
wwv_flow_api.g_varchar2_table(52) := '30252C20746F207B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3231352C20302E3631302C20302E3335352C20312E303030293B0A20207D0A0A20203025207B0A202020206F70';
wwv_flow_api.g_varchar2_table(53) := '61636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D3330303070782C2030293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A20747261';
wwv_flow_api.g_varchar2_table(54) := '6E736C617465336428302C20323570782C2030293B0A20207D0A0A2020373525207B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313070782C2030293B0A20207D0A0A2020393025207B0A202020207472616E73666F';
wwv_flow_api.g_varchar2_table(55) := '726D3A207472616E736C617465336428302C203570782C2030293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E626F756E6365496E446F776E207B0A2020616E696D6174696F6E2D6E616D65';
wwv_flow_api.g_varchar2_table(56) := '3A20626F756E6365496E446F776E3B0A7D0A0A406B65796672616D657320626F756E6365496E4C656674207B0A202066726F6D2C203630252C203735252C203930252C20746F207B0A20202020616E696D6174696F6E2D74696D696E672D66756E637469';
wwv_flow_api.g_varchar2_table(57) := '6F6E3A2063756269632D62657A69657228302E3231352C20302E3631302C20302E3335352C20312E303030293B0A20207D0A0A20203025207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364';
wwv_flow_api.g_varchar2_table(58) := '282D3330303070782C20302C2030293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207472616E736C617465336428323570782C20302C2030293B0A20207D0A0A2020373525207B0A20';
wwv_flow_api.g_varchar2_table(59) := '2020207472616E73666F726D3A207472616E736C6174653364282D313070782C20302C2030293B0A20207D0A0A2020393025207B0A202020207472616E73666F726D3A207472616E736C6174653364283570782C20302C2030293B0A20207D0A0A202074';
wwv_flow_api.g_varchar2_table(60) := '6F207B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E626F756E6365496E4C656674207B0A2020616E696D6174696F6E2D6E616D653A20626F756E6365496E4C6566743B0A7D0A0A406B65796672616D657320626F756E6365';
wwv_flow_api.g_varchar2_table(61) := '496E5269676874207B0A202066726F6D2C203630252C203735252C203930252C20746F207B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3231352C20302E3631302C20302E3335';
wwv_flow_api.g_varchar2_table(62) := '352C20312E303030293B0A20207D0A0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364283330303070782C20302C2030293B0A20207D0A0A2020363025207B0A20202020';
wwv_flow_api.g_varchar2_table(63) := '6F7061636974793A20313B0A202020207472616E73666F726D3A207472616E736C6174653364282D323570782C20302C2030293B0A20207D0A0A2020373525207B0A202020207472616E73666F726D3A207472616E736C617465336428313070782C2030';
wwv_flow_api.g_varchar2_table(64) := '2C2030293B0A20207D0A0A2020393025207B0A202020207472616E73666F726D3A207472616E736C6174653364282D3570782C20302C2030293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E';
wwv_flow_api.g_varchar2_table(65) := '626F756E6365496E5269676874207B0A2020616E696D6174696F6E2D6E616D653A20626F756E6365496E52696768743B0A7D0A0A406B65796672616D657320626F756E6365496E5570207B0A202066726F6D2C203630252C203735252C203930252C2074';
wwv_flow_api.g_varchar2_table(66) := '6F207B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3231352C20302E3631302C20302E3335352C20312E303030293B0A20207D0A0A202066726F6D207B0A202020206F70616369';
wwv_flow_api.g_varchar2_table(67) := '74793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C203330303070782C2030293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207472616E736C61';
wwv_flow_api.g_varchar2_table(68) := '7465336428302C202D323070782C2030293B0A20207D0A0A2020373525207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20313070782C2030293B0A20207D0A0A2020393025207B0A202020207472616E73666F726D3A20';
wwv_flow_api.g_varchar2_table(69) := '7472616E736C617465336428302C202D3570782C2030293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A20207D0A7D0A0A2E626F756E6365496E5570207B0A2020616E69';
wwv_flow_api.g_varchar2_table(70) := '6D6174696F6E2D6E616D653A20626F756E6365496E55703B0A7D0A0A406B65796672616D657320626F756E63654F7574207B0A2020323025207B0A202020207472616E73666F726D3A207363616C653364282E392C202E392C202E39293B0A20207D0A0A';
wwv_flow_api.g_varchar2_table(71) := '20203530252C20353525207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C65336428312E312C20312E312C20312E31293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A20202020';
wwv_flow_api.g_varchar2_table(72) := '7472616E73666F726D3A207363616C653364282E332C202E332C202E33293B0A20207D0A7D0A0A2E626F756E63654F7574207B0A2020616E696D6174696F6E2D6E616D653A20626F756E63654F75743B0A7D0A0A406B65796672616D657320626F756E63';
wwv_flow_api.g_varchar2_table(73) := '654F7574446F776E207B0A2020323025207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20313070782C2030293B0A20207D0A0A20203430252C20343525207B0A202020206F7061636974793A20313B0A20202020747261';
wwv_flow_api.g_varchar2_table(74) := '6E73666F726D3A207472616E736C617465336428302C202D323070782C2030293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C203230303070782C20';
wwv_flow_api.g_varchar2_table(75) := '30293B0A20207D0A7D0A0A2E626F756E63654F7574446F776E207B0A2020616E696D6174696F6E2D6E616D653A20626F756E63654F7574446F776E3B0A7D0A0A406B65796672616D657320626F756E63654F75744C656674207B0A2020323025207B0A20';
wwv_flow_api.g_varchar2_table(76) := '2020206F7061636974793A20313B0A202020207472616E73666F726D3A207472616E736C617465336428323070782C20302C2030293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472';
wwv_flow_api.g_varchar2_table(77) := '616E736C6174653364282D3230303070782C20302C2030293B0A20207D0A7D0A0A2E626F756E63654F75744C656674207B0A2020616E696D6174696F6E2D6E616D653A20626F756E63654F75744C6566743B0A7D0A0A406B65796672616D657320626F75';
wwv_flow_api.g_varchar2_table(78) := '6E63654F75745269676874207B0A2020323025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207472616E736C6174653364282D323070782C20302C2030293B0A20207D0A0A2020746F207B0A202020206F70616369';
wwv_flow_api.g_varchar2_table(79) := '74793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364283230303070782C20302C2030293B0A20207D0A7D0A0A2E626F756E63654F75745269676874207B0A2020616E696D6174696F6E2D6E616D653A20626F756E63654F75';
wwv_flow_api.g_varchar2_table(80) := '7452696768743B0A7D0A0A406B65796672616D657320626F756E63654F75745570207B0A2020323025207B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313070782C2030293B0A20207D0A0A20203430252C20343525';
wwv_flow_api.g_varchar2_table(81) := '207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207472616E736C617465336428302C20323070782C2030293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D';
wwv_flow_api.g_varchar2_table(82) := '3A207472616E736C617465336428302C202D3230303070782C2030293B0A20207D0A7D0A0A2E626F756E63654F75745570207B0A2020616E696D6174696F6E2D6E616D653A20626F756E63654F757455703B0A7D0A0A406B65796672616D657320666164';
wwv_flow_api.g_varchar2_table(83) := '65496E207B0A202066726F6D207B0A202020206F7061636974793A20303B0A20207D0A0A2020746F207B0A202020206F7061636974793A20313B0A20207D0A7D0A0A2E66616465496E207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E';
wwv_flow_api.g_varchar2_table(84) := '3B0A7D0A0A406B65796672616D65732066616465496E446F776E207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313030252C2030293B0A20207D0A0A';
wwv_flow_api.g_varchar2_table(85) := '2020746F207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E446F776E207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E446F776E3B0A7D0A0A406B';
wwv_flow_api.g_varchar2_table(86) := '65796672616D65732066616465496E446F776E426967207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D3230303070782C2030293B0A20207D0A0A2020';
wwv_flow_api.g_varchar2_table(87) := '746F207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E446F776E426967207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E446F776E4269673B0A7D';
wwv_flow_api.g_varchar2_table(88) := '0A0A406B65796672616D65732066616465496E4C656674207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364282D313030252C20302C2030293B0A20207D0A0A202074';
wwv_flow_api.g_varchar2_table(89) := '6F207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E4C656674207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E4C6566743B0A7D0A0A406B657966';
wwv_flow_api.g_varchar2_table(90) := '72616D65732066616465496E4C656674426967207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364282D3230303070782C20302C2030293B0A20207D0A0A2020746F20';
wwv_flow_api.g_varchar2_table(91) := '7B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E4C656674426967207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E4C6566744269673B0A7D0A0A40';
wwv_flow_api.g_varchar2_table(92) := '6B65796672616D65732066616465496E5269676874207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428313030252C20302C2030293B0A20207D0A0A2020746F207B';
wwv_flow_api.g_varchar2_table(93) := '0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E5269676874207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E52696768743B0A7D0A0A406B65796672';
wwv_flow_api.g_varchar2_table(94) := '616D65732066616465496E5269676874426967207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364283230303070782C20302C2030293B0A20207D0A0A2020746F207B';
wwv_flow_api.g_varchar2_table(95) := '0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E5269676874426967207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E52696768744269673B0A7D0A0A';
wwv_flow_api.g_varchar2_table(96) := '406B65796672616D65732066616465496E5570207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C20313030252C2030293B0A20207D0A0A2020746F207B0A20';
wwv_flow_api.g_varchar2_table(97) := '2020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E5570207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E55703B0A7D0A0A406B65796672616D657320666164';
wwv_flow_api.g_varchar2_table(98) := '65496E5570426967207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C203230303070782C2030293B0A20207D0A0A2020746F207B0A202020206F7061636974';
wwv_flow_api.g_varchar2_table(99) := '793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E66616465496E5570426967207B0A2020616E696D6174696F6E2D6E616D653A2066616465496E55704269673B0A7D0A0A406B65796672616D657320666164654F75';
wwv_flow_api.g_varchar2_table(100) := '74207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E666164654F7574207B0A2020616E696D6174696F6E2D6E616D653A20666164654F7574';
wwv_flow_api.g_varchar2_table(101) := '3B0A7D0A0A406B65796672616D657320666164654F7574446F776E207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472';
wwv_flow_api.g_varchar2_table(102) := '616E736C617465336428302C20313030252C2030293B0A20207D0A7D0A0A2E666164654F7574446F776E207B0A2020616E696D6174696F6E2D6E616D653A20666164654F7574446F776E3B0A7D0A0A406B65796672616D657320666164654F7574446F77';
wwv_flow_api.g_varchar2_table(103) := '6E426967207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C203230303070782C203029';
wwv_flow_api.g_varchar2_table(104) := '3B0A20207D0A7D0A0A2E666164654F7574446F776E426967207B0A2020616E696D6174696F6E2D6E616D653A20666164654F7574446F776E4269673B0A7D0A0A406B65796672616D657320666164654F75744C656674207B0A202066726F6D207B0A2020';
wwv_flow_api.g_varchar2_table(105) := '20206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364282D313030252C20302C2030293B0A20207D0A7D0A0A2E666164654F75744C65';
wwv_flow_api.g_varchar2_table(106) := '6674207B0A2020616E696D6174696F6E2D6E616D653A20666164654F75744C6566743B0A7D0A0A406B65796672616D657320666164654F75744C656674426967207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A202074';
wwv_flow_api.g_varchar2_table(107) := '6F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364282D3230303070782C20302C2030293B0A20207D0A7D0A0A2E666164654F75744C656674426967207B0A2020616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(108) := '6E616D653A20666164654F75744C6566744269673B0A7D0A0A406B65796672616D657320666164654F75745269676874207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A';
wwv_flow_api.g_varchar2_table(109) := '20303B0A202020207472616E73666F726D3A207472616E736C617465336428313030252C20302C2030293B0A20207D0A7D0A0A2E666164654F75745269676874207B0A2020616E696D6174696F6E2D6E616D653A20666164654F757452696768743B0A7D';
wwv_flow_api.g_varchar2_table(110) := '0A0A406B65796672616D657320666164654F75745269676874426967207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A2074';
wwv_flow_api.g_varchar2_table(111) := '72616E736C6174653364283230303070782C20302C2030293B0A20207D0A7D0A0A2E666164654F75745269676874426967207B0A2020616E696D6174696F6E2D6E616D653A20666164654F757452696768744269673B0A7D0A0A406B65796672616D6573';
wwv_flow_api.g_varchar2_table(112) := '20666164654F75745570207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313030';
wwv_flow_api.g_varchar2_table(113) := '252C2030293B0A20207D0A7D0A0A2E666164654F75745570207B0A2020616E696D6174696F6E2D6E616D653A20666164654F757455703B0A7D0A0A406B65796672616D657320666164654F75745570426967207B0A202066726F6D207B0A202020206F70';
wwv_flow_api.g_varchar2_table(114) := '61636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D3230303070782C2030293B0A20207D0A7D0A0A2E666164654F757455704269';
wwv_flow_api.g_varchar2_table(115) := '67207B0A2020616E696D6174696F6E2D6E616D653A20666164654F757455704269673B0A7D0A0A406B65796672616D657320666C6970207B0A202066726F6D207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920';
wwv_flow_api.g_varchar2_table(116) := '726F74617465336428302C20312C20302C202D333630646567293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D6F75743B0A20207D0A0A2020343025207B0A202020207472616E73666F726D3A20706572';
wwv_flow_api.g_varchar2_table(117) := '737065637469766528343030707829207472616E736C617465336428302C20302C2031353070782920726F74617465336428302C20312C20302C202D313930646567293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20';
wwv_flow_api.g_varchar2_table(118) := '656173652D6F75743B0A20207D0A0A2020353025207B0A202020207472616E73666F726D3A20706572737065637469766528343030707829207472616E736C617465336428302C20302C2031353070782920726F74617465336428302C20312C20302C20';
wwv_flow_api.g_varchar2_table(119) := '2D313730646567293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B0A20207D0A0A2020383025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920736361';
wwv_flow_api.g_varchar2_table(120) := '6C653364282E39352C202E39352C202E3935293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A20706572737065637469766528';
wwv_flow_api.g_varchar2_table(121) := '3430307078293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B0A20207D0A7D0A0A2E616E696D617465642E666C6970207B0A20202D7765626B69742D6261636B666163652D7669736962696C6974';
wwv_flow_api.g_varchar2_table(122) := '793A2076697369626C653B0A20206261636B666163652D7669736962696C6974793A2076697369626C653B0A2020616E696D6174696F6E2D6E616D653A20666C69703B0A7D0A0A406B65796672616D657320666C6970496E58207B0A202066726F6D207B';
wwv_flow_api.g_varchar2_table(123) := '0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428312C20302C20302C203930646567293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B';
wwv_flow_api.g_varchar2_table(124) := '0A202020206F7061636974793A20303B0A20207D0A0A2020343025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428312C20302C20302C202D3230646567293B0A20202020616E696D61';
wwv_flow_api.g_varchar2_table(125) := '74696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B0A20207D0A0A2020363025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428312C20302C20302C2031306465';
wwv_flow_api.g_varchar2_table(126) := '67293B0A202020206F7061636974793A20313B0A20207D0A0A2020383025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428312C20302C20302C202D35646567293B0A20207D0A0A2020';
wwv_flow_api.g_varchar2_table(127) := '746F207B0A202020207472616E73666F726D3A207065727370656374697665283430307078293B0A20207D0A7D0A0A2E666C6970496E58207B0A20202D7765626B69742D6261636B666163652D7669736962696C6974793A2076697369626C652021696D';
wwv_flow_api.g_varchar2_table(128) := '706F7274616E743B0A20206261636B666163652D7669736962696C6974793A2076697369626C652021696D706F7274616E743B0A2020616E696D6174696F6E2D6E616D653A20666C6970496E583B0A7D0A0A406B65796672616D657320666C6970496E59';
wwv_flow_api.g_varchar2_table(129) := '207B0A202066726F6D207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428302C20312C20302C203930646567293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F';
wwv_flow_api.g_varchar2_table(130) := '6E3A20656173652D696E3B0A202020206F7061636974793A20303B0A20207D0A0A2020343025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428302C20312C20302C202D323064656729';
wwv_flow_api.g_varchar2_table(131) := '3B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B0A20207D0A0A2020363025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428302C';
wwv_flow_api.g_varchar2_table(132) := '20312C20302C203130646567293B0A202020206F7061636974793A20313B0A20207D0A0A2020383025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428302C20312C20302C202D356465';
wwv_flow_api.g_varchar2_table(133) := '67293B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207065727370656374697665283430307078293B0A20207D0A7D0A0A2E666C6970496E59207B0A20202D7765626B69742D6261636B666163652D7669736962696C6974793A20';
wwv_flow_api.g_varchar2_table(134) := '76697369626C652021696D706F7274616E743B0A20206261636B666163652D7669736962696C6974793A2076697369626C652021696D706F7274616E743B0A2020616E696D6174696F6E2D6E616D653A20666C6970496E593B0A7D0A0A406B6579667261';
wwv_flow_api.g_varchar2_table(135) := '6D657320666C69704F757458207B0A202066726F6D207B0A202020207472616E73666F726D3A207065727370656374697665283430307078293B0A20207D0A0A2020333025207B0A202020207472616E73666F726D3A2070657273706563746976652834';
wwv_flow_api.g_varchar2_table(136) := '303070782920726F74617465336428312C20302C20302C202D3230646567293B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F746174';
wwv_flow_api.g_varchar2_table(137) := '65336428312C20302C20302C203930646567293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E666C69704F757458207B0A2020616E696D6174696F6E2D6E616D653A20666C69704F7574583B0A20202D7765626B69742D6261636B6661';
wwv_flow_api.g_varchar2_table(138) := '63652D7669736962696C6974793A2076697369626C652021696D706F7274616E743B0A20206261636B666163652D7669736962696C6974793A2076697369626C652021696D706F7274616E743B0A7D0A0A406B65796672616D657320666C69704F757459';
wwv_flow_api.g_varchar2_table(139) := '207B0A202066726F6D207B0A202020207472616E73666F726D3A207065727370656374697665283430307078293B0A20207D0A0A2020333025207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465';
wwv_flow_api.g_varchar2_table(140) := '336428302C20312C20302C202D3135646567293B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A2070657273706563746976652834303070782920726F74617465336428302C20312C20302C';
wwv_flow_api.g_varchar2_table(141) := '203930646567293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E666C69704F757459207B0A20202D7765626B69742D6261636B666163652D7669736962696C6974793A2076697369626C652021696D706F7274616E743B0A2020626163';
wwv_flow_api.g_varchar2_table(142) := '6B666163652D7669736962696C6974793A2076697369626C652021696D706F7274616E743B0A2020616E696D6174696F6E2D6E616D653A20666C69704F7574593B0A7D0A0A406B65796672616D6573206C696768745370656564496E207B0A202066726F';
wwv_flow_api.g_varchar2_table(143) := '6D207B0A202020207472616E73666F726D3A207472616E736C617465336428313030252C20302C20302920736B657758282D3330646567293B0A202020206F7061636974793A20303B0A20207D0A0A2020363025207B0A202020207472616E73666F726D';
wwv_flow_api.g_varchar2_table(144) := '3A20736B657758283230646567293B0A202020206F7061636974793A20313B0A20207D0A0A2020383025207B0A202020207472616E73666F726D3A20736B657758282D35646567293B0A202020206F7061636974793A20313B0A20207D0A0A2020746F20';
wwv_flow_api.g_varchar2_table(145) := '7B0A202020207472616E73666F726D3A206E6F6E653B0A202020206F7061636974793A20313B0A20207D0A7D0A0A2E6C696768745370656564496E207B0A2020616E696D6174696F6E2D6E616D653A206C696768745370656564496E3B0A2020616E696D';
wwv_flow_api.g_varchar2_table(146) := '6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D6F75743B0A7D0A0A406B65796672616D6573206C6967687453706565644F7574207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A';
wwv_flow_api.g_varchar2_table(147) := '202020207472616E73666F726D3A207472616E736C617465336428313030252C20302C20302920736B657758283330646567293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E6C6967687453706565644F7574207B0A2020616E696D61';
wwv_flow_api.g_varchar2_table(148) := '74696F6E2D6E616D653A206C6967687453706565644F75743B0A2020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E3B0A7D0A0A406B65796672616D657320726F74617465496E207B0A202066726F6D207B0A2020';
wwv_flow_api.g_varchar2_table(149) := '20207472616E73666F726D2D6F726967696E3A2063656E7465723B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C202D323030646567293B0A202020206F7061636974793A20303B0A20207D0A0A2020746F207B0A20';
wwv_flow_api.g_varchar2_table(150) := '2020207472616E73666F726D2D6F726967696E3A2063656E7465723B0A202020207472616E73666F726D3A206E6F6E653B0A202020206F7061636974793A20313B0A20207D0A7D0A0A2E726F74617465496E207B0A2020616E696D6174696F6E2D6E616D';
wwv_flow_api.g_varchar2_table(151) := '653A20726F74617465496E3B0A7D0A0A406B65796672616D657320726F74617465496E446F776E4C656674207B0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A202020207472616E7366';
wwv_flow_api.g_varchar2_table(152) := '6F726D3A20726F74617465336428302C20302C20312C202D3435646567293B0A202020206F7061636974793A20303B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A2020202074';
wwv_flow_api.g_varchar2_table(153) := '72616E73666F726D3A206E6F6E653B0A202020206F7061636974793A20313B0A20207D0A7D0A0A2E726F74617465496E446F776E4C656674207B0A2020616E696D6174696F6E2D6E616D653A20726F74617465496E446F776E4C6566743B0A7D0A0A406B';
wwv_flow_api.g_varchar2_table(154) := '65796672616D657320726F74617465496E446F776E5269676874207B0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A202020207472616E73666F726D3A20726F74617465336428302C';
wwv_flow_api.g_varchar2_table(155) := '20302C20312C203435646567293B0A202020206F7061636974793A20303B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A202020207472616E73666F726D3A206E6F6E653B0A';
wwv_flow_api.g_varchar2_table(156) := '202020206F7061636974793A20313B0A20207D0A7D0A0A2E726F74617465496E446F776E5269676874207B0A2020616E696D6174696F6E2D6E616D653A20726F74617465496E446F776E52696768743B0A7D0A0A406B65796672616D657320726F746174';
wwv_flow_api.g_varchar2_table(157) := '65496E55704C656674207B0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C203435646567293B0A202020';
wwv_flow_api.g_varchar2_table(158) := '206F7061636974793A20303B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A202020207472616E73666F726D3A206E6F6E653B0A202020206F7061636974793A20313B0A20207D';
wwv_flow_api.g_varchar2_table(159) := '0A7D0A0A2E726F74617465496E55704C656674207B0A2020616E696D6174696F6E2D6E616D653A20726F74617465496E55704C6566743B0A7D0A0A406B65796672616D657320726F74617465496E55705269676874207B0A202066726F6D207B0A202020';
wwv_flow_api.g_varchar2_table(160) := '207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C202D3930646567293B0A202020206F7061636974793A20303B0A20207D0A0A2020746F';
wwv_flow_api.g_varchar2_table(161) := '207B0A202020207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A202020207472616E73666F726D3A206E6F6E653B0A202020206F7061636974793A20313B0A20207D0A7D0A0A2E726F74617465496E5570526967687420';
wwv_flow_api.g_varchar2_table(162) := '7B0A2020616E696D6174696F6E2D6E616D653A20726F74617465496E557052696768743B0A7D0A0A406B65796672616D657320726F746174654F7574207B0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A2063656E746572';
wwv_flow_api.g_varchar2_table(163) := '3B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A2063656E7465723B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C2032303064656729';
wwv_flow_api.g_varchar2_table(164) := '3B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E726F746174654F7574207B0A2020616E696D6174696F6E2D6E616D653A20726F746174654F75743B0A7D0A0A406B65796672616D657320726F746174654F7574446F776E4C656674207B';
wwv_flow_api.g_varchar2_table(165) := '0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420';
wwv_flow_api.g_varchar2_table(166) := '626F74746F6D3B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C203435646567293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E726F746174654F7574446F776E4C656674207B0A2020616E696D61';
wwv_flow_api.g_varchar2_table(167) := '74696F6E2D6E616D653A20726F746174654F7574446F776E4C6566743B0A7D0A0A406B65796672616D657320726F746174654F7574446F776E5269676874207B0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A2072696768';
wwv_flow_api.g_varchar2_table(168) := '7420626F74746F6D3B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A202020207472616E73666F726D3A20726F74617465336428302C';
wwv_flow_api.g_varchar2_table(169) := '20302C20312C202D3435646567293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E726F746174654F7574446F776E5269676874207B0A2020616E696D6174696F6E2D6E616D653A20726F746174654F7574446F776E52696768743B0A7D';
wwv_flow_api.g_varchar2_table(170) := '0A0A406B65796672616D657320726F746174654F757455704C656674207B0A202066726F6D207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A202020206F7061636974793A20313B0A20207D0A0A2020746F';
wwv_flow_api.g_varchar2_table(171) := '207B0A202020207472616E73666F726D2D6F726967696E3A206C65667420626F74746F6D3B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C202D3435646567293B0A202020206F7061636974793A20303B0A20207D0A';
wwv_flow_api.g_varchar2_table(172) := '7D0A0A2E726F746174654F757455704C656674207B0A2020616E696D6174696F6E2D6E616D653A20726F746174654F757455704C6566743B0A7D0A0A406B65796672616D657320726F746174654F757455705269676874207B0A202066726F6D207B0A20';
wwv_flow_api.g_varchar2_table(173) := '2020207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D2D6F726967696E3A20726967687420626F74746F6D3B0A20';
wwv_flow_api.g_varchar2_table(174) := '2020207472616E73666F726D3A20726F74617465336428302C20302C20312C203930646567293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E726F746174654F757455705269676874207B0A2020616E696D6174696F6E2D6E616D653A';
wwv_flow_api.g_varchar2_table(175) := '20726F746174654F7574557052696768743B0A7D0A0A406B65796672616D65732068696E6765207B0A20203025207B0A202020207472616E73666F726D2D6F726967696E3A20746F70206C6566743B0A20202020616E696D6174696F6E2D74696D696E67';
wwv_flow_api.g_varchar2_table(176) := '2D66756E6374696F6E3A20656173652D696E2D6F75743B0A20207D0A0A20203230252C20363025207B0A202020207472616E73666F726D3A20726F74617465336428302C20302C20312C203830646567293B0A202020207472616E73666F726D2D6F7269';
wwv_flow_api.g_varchar2_table(177) := '67696E3A20746F70206C6566743B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E2D6F75743B0A20207D0A0A20203430252C20383025207B0A202020207472616E73666F726D3A20726F746174653364';
wwv_flow_api.g_varchar2_table(178) := '28302C20302C20312C203630646567293B0A202020207472616E73666F726D2D6F726967696E3A20746F70206C6566743B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A20656173652D696E2D6F75743B0A202020206F70';
wwv_flow_api.g_varchar2_table(179) := '61636974793A20313B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C2037303070782C2030293B0A202020206F7061636974793A20303B0A20207D0A7D0A0A2E68696E6765207B0A2020616E69';
wwv_flow_api.g_varchar2_table(180) := '6D6174696F6E2D6E616D653A2068696E67653B0A7D0A0A406B65796672616D6573206A61636B496E546865426F78207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C6528302E312920';
wwv_flow_api.g_varchar2_table(181) := '726F74617465283330646567293B0A202020207472616E73666F726D2D6F726967696E3A2063656E74657220626F74746F6D3B0A20207D0A0A2020353025207B0A202020207472616E73666F726D3A20726F74617465282D3130646567293B0A20207D0A';
wwv_flow_api.g_varchar2_table(182) := '0A2020373025207B0A202020207472616E73666F726D3A20726F746174652833646567293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C652831293B0A20207D0A7D0A0A2E6A';
wwv_flow_api.g_varchar2_table(183) := '61636B496E546865426F78207B0A2020616E696D6174696F6E2D6E616D653A206A61636B496E546865426F783B0A7D0A0A2F2A206F726967696E616C6C7920617574686F726564206279204E69636B20506574746974202D2068747470733A2F2F676974';
wwv_flow_api.g_varchar2_table(184) := '6875622E636F6D2F6E69636B7065747469742F676C696465202A2F0A0A406B65796672616D657320726F6C6C496E207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207472616E736C6174653364';
wwv_flow_api.g_varchar2_table(185) := '282D313030252C20302C20302920726F74617465336428302C20302C20312C202D313230646567293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A206E6F6E653B0A20207D0A7D0A0A2E72';
wwv_flow_api.g_varchar2_table(186) := '6F6C6C496E207B0A2020616E696D6174696F6E2D6E616D653A20726F6C6C496E3B0A7D0A0A2F2A206F726967696E616C6C7920617574686F726564206279204E69636B20506574746974202D2068747470733A2F2F6769746875622E636F6D2F6E69636B';
wwv_flow_api.g_varchar2_table(187) := '7065747469742F676C696465202A2F0A0A406B65796672616D657320726F6C6C4F7574207B0A202066726F6D207B0A202020206F7061636974793A20313B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73';
wwv_flow_api.g_varchar2_table(188) := '666F726D3A207472616E736C617465336428313030252C20302C20302920726F74617465336428302C20302C20312C20313230646567293B0A20207D0A7D0A0A2E726F6C6C4F7574207B0A2020616E696D6174696F6E2D6E616D653A20726F6C6C4F7574';
wwv_flow_api.g_varchar2_table(189) := '3B0A7D0A0A406B65796672616D6573207A6F6F6D496E207B0A202066726F6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E332C202E332C202E33293B0A20207D0A0A2020353025207B0A20';
wwv_flow_api.g_varchar2_table(190) := '2020206F7061636974793A20313B0A20207D0A7D0A0A2E7A6F6F6D496E207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D496E3B0A7D0A0A406B65796672616D6573207A6F6F6D496E446F776E207B0A202066726F6D207B0A202020206F70';
wwv_flow_api.g_varchar2_table(191) := '61636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E312C202E312C202E3129207472616E736C617465336428302C202D3130303070782C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E637469';
wwv_flow_api.g_varchar2_table(192) := '6F6E3A2063756269632D62657A69657228302E3535302C20302E3035352C20302E3637352C20302E313930293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C653364282E34';
wwv_flow_api.g_varchar2_table(193) := '37352C202E3437352C202E34373529207472616E736C617465336428302C20363070782C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3137352C20302E3838352C2030';
wwv_flow_api.g_varchar2_table(194) := '2E3332302C2031293B0A20207D0A7D0A0A2E7A6F6F6D496E446F776E207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D496E446F776E3B0A7D0A0A406B65796672616D6573207A6F6F6D496E4C656674207B0A202066726F6D207B0A202020';
wwv_flow_api.g_varchar2_table(195) := '206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E312C202E312C202E3129207472616E736C6174653364282D3130303070782C20302C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E';
wwv_flow_api.g_varchar2_table(196) := '6374696F6E3A2063756269632D62657A69657228302E3535302C20302E3035352C20302E3637352C20302E313930293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C653364';
wwv_flow_api.g_varchar2_table(197) := '282E3437352C202E3437352C202E34373529207472616E736C617465336428313070782C20302C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3137352C20302E383835';
wwv_flow_api.g_varchar2_table(198) := '2C20302E3332302C2031293B0A20207D0A7D0A0A2E7A6F6F6D496E4C656674207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D496E4C6566743B0A7D0A0A406B65796672616D6573207A6F6F6D496E5269676874207B0A202066726F6D207B';
wwv_flow_api.g_varchar2_table(199) := '0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E312C202E312C202E3129207472616E736C6174653364283130303070782C20302C2030293B0A20202020616E696D6174696F6E2D74696D696E672D';
wwv_flow_api.g_varchar2_table(200) := '66756E6374696F6E3A2063756269632D62657A69657228302E3535302C20302E3035352C20302E3637352C20302E313930293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C';
wwv_flow_api.g_varchar2_table(201) := '653364282E3437352C202E3437352C202E34373529207472616E736C6174653364282D313070782C20302C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3137352C2030';
wwv_flow_api.g_varchar2_table(202) := '2E3838352C20302E3332302C2031293B0A20207D0A7D0A0A2E7A6F6F6D496E5269676874207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D496E52696768743B0A7D0A0A406B65796672616D6573207A6F6F6D496E5570207B0A202066726F';
wwv_flow_api.g_varchar2_table(203) := '6D207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E312C202E312C202E3129207472616E736C617465336428302C203130303070782C2030293B0A20202020616E696D6174696F6E2D74696D69';
wwv_flow_api.g_varchar2_table(204) := '6E672D66756E6374696F6E3A2063756269632D62657A69657228302E3535302C20302E3035352C20302E3637352C20302E313930293B0A20207D0A0A2020363025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A2073';
wwv_flow_api.g_varchar2_table(205) := '63616C653364282E3437352C202E3437352C202E34373529207472616E736C617465336428302C202D363070782C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E313735';
wwv_flow_api.g_varchar2_table(206) := '2C20302E3838352C20302E3332302C2031293B0A20207D0A7D0A0A2E7A6F6F6D496E5570207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D496E55703B0A7D0A0A406B65796672616D6573207A6F6F6D4F7574207B0A202066726F6D207B0A';
wwv_flow_api.g_varchar2_table(207) := '202020206F7061636974793A20313B0A20207D0A0A2020353025207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E332C202E332C202E33293B0A20207D0A0A2020746F207B0A202020206F7061';
wwv_flow_api.g_varchar2_table(208) := '636974793A20303B0A20207D0A7D0A0A2E7A6F6F6D4F7574207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D4F75743B0A7D0A0A406B65796672616D6573207A6F6F6D4F7574446F776E207B0A2020343025207B0A202020206F7061636974';
wwv_flow_api.g_varchar2_table(209) := '793A20313B0A202020207472616E73666F726D3A207363616C653364282E3437352C202E3437352C202E34373529207472616E736C617465336428302C202D363070782C2030293B0A20202020616E696D6174696F6E2D74696D696E672D66756E637469';
wwv_flow_api.g_varchar2_table(210) := '6F6E3A2063756269632D62657A69657228302E3535302C20302E3035352C20302E3637352C20302E313930293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C653364282E312C';
wwv_flow_api.g_varchar2_table(211) := '202E312C202E3129207472616E736C617465336428302C203230303070782C2030293B0A202020207472616E73666F726D2D6F726967696E3A2063656E74657220626F74746F6D3B0A20202020616E696D6174696F6E2D74696D696E672D66756E637469';
wwv_flow_api.g_varchar2_table(212) := '6F6E3A2063756269632D62657A69657228302E3137352C20302E3838352C20302E3332302C2031293B0A20207D0A7D0A0A2E7A6F6F6D4F7574446F776E207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D4F7574446F776E3B0A7D0A0A406B';
wwv_flow_api.g_varchar2_table(213) := '65796672616D6573207A6F6F6D4F75744C656674207B0A2020343025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C653364282E3437352C202E3437352C202E34373529207472616E736C617465336428';
wwv_flow_api.g_varchar2_table(214) := '343270782C20302C2030293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C65282E3129207472616E736C6174653364282D3230303070782C20302C2030293B0A202020207472';
wwv_flow_api.g_varchar2_table(215) := '616E73666F726D2D6F726967696E3A206C6566742063656E7465723B0A20207D0A7D0A0A2E7A6F6F6D4F75744C656674207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D4F75744C6566743B0A7D0A0A406B65796672616D6573207A6F6F6D';
wwv_flow_api.g_varchar2_table(216) := '4F75745269676874207B0A2020343025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C653364282E3437352C202E3437352C202E34373529207472616E736C6174653364282D343270782C20302C203029';
wwv_flow_api.g_varchar2_table(217) := '3B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E73666F726D3A207363616C65282E3129207472616E736C6174653364283230303070782C20302C2030293B0A202020207472616E73666F726D2D6F726967';
wwv_flow_api.g_varchar2_table(218) := '696E3A2072696768742063656E7465723B0A20207D0A7D0A0A2E7A6F6F6D4F75745269676874207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F6D4F757452696768743B0A7D0A0A406B65796672616D6573207A6F6F6D4F75745570207B0A20';
wwv_flow_api.g_varchar2_table(219) := '20343025207B0A202020206F7061636974793A20313B0A202020207472616E73666F726D3A207363616C653364282E3437352C202E3437352C202E34373529207472616E736C617465336428302C20363070782C2030293B0A20202020616E696D617469';
wwv_flow_api.g_varchar2_table(220) := '6F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3535302C20302E3035352C20302E3637352C20302E313930293B0A20207D0A0A2020746F207B0A202020206F7061636974793A20303B0A202020207472616E7366';
wwv_flow_api.g_varchar2_table(221) := '6F726D3A207363616C653364282E312C202E312C202E3129207472616E736C617465336428302C202D3230303070782C2030293B0A202020207472616E73666F726D2D6F726967696E3A2063656E74657220626F74746F6D3B0A20202020616E696D6174';
wwv_flow_api.g_varchar2_table(222) := '696F6E2D74696D696E672D66756E6374696F6E3A2063756269632D62657A69657228302E3137352C20302E3838352C20302E3332302C2031293B0A20207D0A7D0A0A2E7A6F6F6D4F75745570207B0A2020616E696D6174696F6E2D6E616D653A207A6F6F';
wwv_flow_api.g_varchar2_table(223) := '6D4F757455703B0A7D0A0A406B65796672616D657320736C696465496E446F776E207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313030252C2030293B0A202020207669736962696C697479';
wwv_flow_api.g_varchar2_table(224) := '3A2076697369626C653B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A20207D0A7D0A0A2E736C696465496E446F776E207B0A2020616E696D6174696F6E2D6E616D653A20';
wwv_flow_api.g_varchar2_table(225) := '736C696465496E446F776E3B0A7D0A0A406B65796672616D657320736C696465496E4C656674207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C6174653364282D313030252C20302C2030293B0A202020207669736962';
wwv_flow_api.g_varchar2_table(226) := '696C6974793A2076697369626C653B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A20207D0A7D0A0A2E736C696465496E4C656674207B0A2020616E696D6174696F6E2D6E';
wwv_flow_api.g_varchar2_table(227) := '616D653A20736C696465496E4C6566743B0A7D0A0A406B65796672616D657320736C696465496E5269676874207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C617465336428313030252C20302C2030293B0A20202020';
wwv_flow_api.g_varchar2_table(228) := '7669736962696C6974793A2076697369626C653B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A20207D0A7D0A0A2E736C696465496E5269676874207B0A2020616E696D61';
wwv_flow_api.g_varchar2_table(229) := '74696F6E2D6E616D653A20736C696465496E52696768743B0A7D0A0A406B65796672616D657320736C696465496E5570207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20313030252C2030293B0A';
wwv_flow_api.g_varchar2_table(230) := '202020207669736962696C6974793A2076697369626C653B0A20207D0A0A2020746F207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A20207D0A7D0A0A2E736C696465496E5570207B0A2020616E696D';
wwv_flow_api.g_varchar2_table(231) := '6174696F6E2D6E616D653A20736C696465496E55703B0A7D0A0A406B65796672616D657320736C6964654F7574446F776E207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C2030293B0A2020';
wwv_flow_api.g_varchar2_table(232) := '7D0A0A2020746F207B0A202020207669736962696C6974793A2068696464656E3B0A202020207472616E73666F726D3A207472616E736C617465336428302C20313030252C2030293B0A20207D0A7D0A0A2E736C6964654F7574446F776E207B0A202061';
wwv_flow_api.g_varchar2_table(233) := '6E696D6174696F6E2D6E616D653A20736C6964654F7574446F776E3B0A7D0A0A406B65796672616D657320736C6964654F75744C656674207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C617465336428302C20302C20';
wwv_flow_api.g_varchar2_table(234) := '30293B0A20207D0A0A2020746F207B0A202020207669736962696C6974793A2068696464656E3B0A202020207472616E73666F726D3A207472616E736C6174653364282D313030252C20302C2030293B0A20207D0A7D0A0A2E736C6964654F75744C6566';
wwv_flow_api.g_varchar2_table(235) := '74207B0A2020616E696D6174696F6E2D6E616D653A20736C6964654F75744C6566743B0A7D0A0A406B65796672616D657320736C6964654F75745269676874207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E736C61746533';
wwv_flow_api.g_varchar2_table(236) := '6428302C20302C2030293B0A20207D0A0A2020746F207B0A202020207669736962696C6974793A2068696464656E3B0A202020207472616E73666F726D3A207472616E736C617465336428313030252C20302C2030293B0A20207D0A7D0A0A2E736C6964';
wwv_flow_api.g_varchar2_table(237) := '654F75745269676874207B0A2020616E696D6174696F6E2D6E616D653A20736C6964654F757452696768743B0A7D0A0A406B65796672616D657320736C6964654F75745570207B0A202066726F6D207B0A202020207472616E73666F726D3A207472616E';
wwv_flow_api.g_varchar2_table(238) := '736C617465336428302C20302C2030293B0A20207D0A0A2020746F207B0A202020207669736962696C6974793A2068696464656E3B0A202020207472616E73666F726D3A207472616E736C617465336428302C202D313030252C2030293B0A20207D0A7D';
wwv_flow_api.g_varchar2_table(239) := '0A0A2E736C6964654F75745570207B0A2020616E696D6174696F6E2D6E616D653A20736C6964654F757455703B0A7D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(130673176846216651)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_file_name=>'lib/animate/animate.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B22616E696D617065782E6A73225D2C226E616D6573223A5B5D2C226D617070696E6773223A223B3B3B3B3B3B3B414141413B414143413B414143413B414143413B414143413B414143413B41';
wwv_flow_api.g_varchar2_table(2) := '4143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B41';
wwv_flow_api.g_varchar2_table(3) := '4143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B41';
wwv_flow_api.g_varchar2_table(4) := '4143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B414143413B41414341222C2266696C65223A22616E';
wwv_flow_api.g_varchar2_table(5) := '696D617065782E6A73222C22736F7572636573436F6E74656E74223A5B222F2A2A5C6E202A20406E616D65737061636520616E696D617065785C6E202A2A2F5C6E76617220616E696D61706578203D20616E696D61706578207C7C207B5C6E5C74616E69';
wwv_flow_api.g_varchar2_table(6) := '6D6174653A2066756E6374696F6E2829207B5C6E5C745C74766172206461203D20746869733B5C6E5C6E5C745C742F2F20617474726962757465735C6E5C745C7476617220616E696D6174696F6E203D2064612E616374696F6E2E617474726962757465';
wwv_flow_api.g_varchar2_table(7) := '30313B5C6E5C745C74766172206475726174696F6E203D2064612E616374696F6E2E61747472696275746530323B5C6E5C745C747661722064656C6179203D2064612E616374696F6E2E61747472696275746530333B5C6E5C745C747661722069746572';
wwv_flow_api.g_varchar2_table(8) := '6174696F6E436F756E74203D2064612E616374696F6E2E61747472696275746530343B5C6E5C6E5C745C7476617220616E696D6174696F6E456E64203D20277765626B6974416E696D6174696F6E456E64206D6F7A416E696D6174696F6E456E64204D53';
wwv_flow_api.g_varchar2_table(9) := '416E696D6174696F6E456E64206F616E696D6174696F6E656E6420616E696D6174696F6E656E64273B5C6E5C6E5C745C74242864612E6166666563746564456C656D656E7473292E656163682866756E6374696F6E2829207B5C6E5C745C745C74766172';
wwv_flow_api.g_varchar2_table(10) := '206166666563746564456C656D656E74203D20242874686973293B5C6E5C6E5C745C745C742F2F2041504558206576656E74202D206265666F72655C6E5C745C745C746166666563746564456C656D656E742E747269676765722827616E696D61706578';
wwv_flow_api.g_varchar2_table(11) := '2D6265666F726527293B5C6E5C6E5C745C745C742F2F204F7074696F6E616C206475726174696F6E20706172616D65746572735C6E5C745C745C74696620286475726174696F6E20213D3D20756E646566696E656429207B5C6E5C745C745C745C746166';
wwv_flow_api.g_varchar2_table(12) := '666563746564456C656D656E742E637373287B5C6E5C745C745C745C745C7427616E696D6174696F6E2D6475726174696F6E273A206475726174696F6E202B202773272C5C6E5C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D64';
wwv_flow_api.g_varchar2_table(13) := '75726174696F6E273A206475726174696F6E202B202773275C6E5C745C745C745C747D293B5C6E5C745C745C747D5C6E5C6E5C745C745C742F2F204F7074696F6E616C2064656C617920706172616D65746572735C6E5C745C745C746966202864656C61';
wwv_flow_api.g_varchar2_table(14) := '7920213D3D20756E646566696E656429207B5C6E5C745C745C745C746166666563746564456C656D656E742E637373287B5C6E5C745C745C745C745C7427616E696D6174696F6E2D64656C6179273A2064656C6179202B202773272C5C6E5C745C745C74';
wwv_flow_api.g_varchar2_table(15) := '5C745C74272D7765626B69742D616E696D6174696F6E2D64656C6179273A2064656C6179202B202773275C6E5C745C745C745C747D293B5C6E5C745C745C747D5C6E5C6E5C745C745C742F2F204F7074696F6E616C20697465726174696F6E436F756E74';
wwv_flow_api.g_varchar2_table(16) := '20706172616D65746572735C6E5C745C745C7469662028697465726174696F6E436F756E7420213D3D20756E646566696E656429207B5C6E5C745C745C745C746166666563746564456C656D656E742E637373287B5C6E5C745C745C745C745C7427616E';
wwv_flow_api.g_varchar2_table(17) := '696D6174696F6E2D697465726174696F6E2D636F756E74273A20697465726174696F6E436F756E742C5C6E5C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D697465726174696F6E2D636F756E74273A20697465726174696F6E43';
wwv_flow_api.g_varchar2_table(18) := '6F756E745C6E5C745C745C745C747D293B5C6E5C745C745C747D5C6E5C6E5C745C745C742F2F20416E696D61746520636F6D706F6E656E745C6E5C745C745C746166666563746564456C656D656E742E616464436C6173732827616E696D617465642027';
wwv_flow_api.g_varchar2_table(19) := '202B20616E696D6174696F6E292E6F6E6528616E696D6174696F6E456E642C2066756E6374696F6E2829207B5C6E5C745C745C745C74242874686973295C6E5C745C745C745C745C742E72656D6F7665436C6173732827616E696D617465642027202B20';
wwv_flow_api.g_varchar2_table(20) := '616E696D6174696F6E295C6E5C745C745C745C745C742E637373287B5C6E5C745C745C745C745C745C7427616E696D6174696F6E2D6475726174696F6E273A2027272C5C6E5C745C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(21) := '6475726174696F6E273A2027272C5C6E5C745C745C745C745C745C7427616E696D6174696F6E2D64656C6179273A2027272C5C6E5C745C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D64656C6179273A2027272C5C6E5C745C74';
wwv_flow_api.g_varchar2_table(22) := '5C745C745C745C7427616E696D6174696F6E2D697465726174696F6E2D636F756E74273A2027272C5C6E5C745C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D697465726174696F6E2D636F756E74273A2027275C6E5C745C745C';
wwv_flow_api.g_varchar2_table(23) := '745C745C747D295C6E5C745C745C745C745C742F2F2041504558206576656E74202D2061667465725C6E5C745C745C745C745C742E747269676765722827616E696D617065782D616674657227293B5C6E5C745C745C747D293B5C6E5C745C747D293B5C';
wwv_flow_api.g_varchar2_table(24) := '6E5C747D5C6E7D3B5C6E225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(130709795726368106)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_file_name=>'js/animapex.js.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210A202A20616E696D61706578202D20412064796E616D696320616374696F6E20706C7567696E20746F20656173696C7920616E696D61746520616E79204150455820636F6D706F6E656E740A202A2040617574686F722056696E63656E74204D6F';
wwv_flow_api.g_varchar2_table(2) := '726E6561750A202A204076657273696F6E2076312E302E300A202A20406C696E6B200A202A20406C6963656E7365204D49540A202A2F0A76617220616E696D617065783D616E696D617065787C7C7B616E696D6174653A66756E6374696F6E28297B7661';
wwv_flow_api.g_varchar2_table(3) := '7220693D746869732C613D692E616374696F6E2E61747472696275746530312C6E3D692E616374696F6E2E61747472696275746530322C743D692E616374696F6E2E61747472696275746530332C6F3D692E616374696F6E2E6174747269627574653034';
wwv_flow_api.g_varchar2_table(4) := '3B2428692E6166666563746564456C656D656E7473292E656163682866756E6374696F6E28297B76617220693D242874686973293B692E747269676765722822616E696D617065782D6265666F726522292C766F69642030213D3D6E2626692E63737328';
wwv_flow_api.g_varchar2_table(5) := '7B22616E696D6174696F6E2D6475726174696F6E223A6E2B2273222C222D7765626B69742D616E696D6174696F6E2D6475726174696F6E223A6E2B2273227D292C766F69642030213D3D742626692E637373287B22616E696D6174696F6E2D64656C6179';
wwv_flow_api.g_varchar2_table(6) := '223A742B2273222C222D7765626B69742D616E696D6174696F6E2D64656C6179223A742B2273227D292C766F69642030213D3D6F2626692E637373287B22616E696D6174696F6E2D697465726174696F6E2D636F756E74223A6F2C222D7765626B69742D';
wwv_flow_api.g_varchar2_table(7) := '616E696D6174696F6E2D697465726174696F6E2D636F756E74223A6F7D292C692E616464436C6173732822616E696D6174656420222B61292E6F6E6528227765626B6974416E696D6174696F6E456E64206D6F7A416E696D6174696F6E456E64204D5341';
wwv_flow_api.g_varchar2_table(8) := '6E696D6174696F6E456E64206F616E696D6174696F6E656E6420616E696D6174696F6E656E64222C66756E6374696F6E28297B242874686973292E72656D6F7665436C6173732822616E696D6174656420222B61292E637373287B22616E696D6174696F';
wwv_flow_api.g_varchar2_table(9) := '6E2D6475726174696F6E223A22222C222D7765626B69742D616E696D6174696F6E2D6475726174696F6E223A22222C22616E696D6174696F6E2D64656C6179223A22222C222D7765626B69742D616E696D6174696F6E2D64656C6179223A22222C22616E';
wwv_flow_api.g_varchar2_table(10) := '696D6174696F6E2D697465726174696F6E2D636F756E74223A22222C222D7765626B69742D616E696D6174696F6E2D697465726174696F6E2D636F756E74223A22227D292E747269676765722822616E696D617065782D616674657222297D297D297D7D';
wwv_flow_api.g_varchar2_table(11) := '3B0A2F2F2320736F757263654D617070696E6755524C3D616E696D617065782E6D696E2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(130710172223368477)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_file_name=>'js/animapex.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B22616E696D617065782E6A73225D2C226E616D6573223A5B22616E696D61706578222C22616E696D617465222C226461222C2274686973222C22616E696D6174696F6E222C22616374696F6E';
wwv_flow_api.g_varchar2_table(2) := '222C226174747269627574653031222C226475726174696F6E222C226174747269627574653032222C2264656C6179222C226174747269627574653033222C22697465726174696F6E436F756E74222C226174747269627574653034222C2224222C2261';
wwv_flow_api.g_varchar2_table(3) := '66666563746564456C656D656E7473222C2265616368222C226166666563746564456C656D656E74222C2274726967676572222C22756E646566696E6564222C22637373222C22616E696D6174696F6E2D6475726174696F6E222C222D7765626B69742D';
wwv_flow_api.g_varchar2_table(4) := '616E696D6174696F6E2D6475726174696F6E222C22616E696D6174696F6E2D64656C6179222C222D7765626B69742D616E696D6174696F6E2D64656C6179222C22616E696D6174696F6E2D697465726174696F6E2D636F756E74222C222D7765626B6974';
wwv_flow_api.g_varchar2_table(5) := '2D616E696D6174696F6E2D697465726174696F6E2D636F756E74222C22616464436C617373222C226F6E65222C2272656D6F7665436C617373225D2C226D617070696E6773223A223B3B3B3B3B3B3B414147412C47414141412C55414141412C57414341';
wwv_flow_api.g_varchar2_table(6) := '432C514141412C574143412C47414141432C47414141432C4B414A41432C45414141462C45414141472C4F414141432C59414341432C454141414C2C45414141472C4F414141472C59414341432C45414141502C45414141472C4F4141414B2C59414341';
wwv_flow_api.g_varchar2_table(7) := '432C45414141542C45414141472C4F4141414F2C57414941432C47414141582C45414141592C6B42414141432C4B4141412C574143412C47414141432C47414141482C45414141562C4B414741612C47414141432C514141412C7542414741432C4B4141';
wwv_flow_api.g_varchar2_table(8) := '41582C47414341532C45414141472C4B414341432C7142414141622C454141412C49414341632C3642414141642C454141412C55414B41572C4B414141542C474143414F2C45414141472C4B414341472C6B42414141622C454141412C49414341632C30';
wwv_flow_api.g_varchar2_table(9) := '42414141642C454141412C55414B41532C4B414141502C474143414B2C45414141472C4B4143414B2C3442414141622C45414341632C6F43414141642C49414B414B2C45414141552C534141412C5941414174422C4741414175422C49416A43412C2B45';
wwv_flow_api.g_varchar2_table(10) := '416943412C57414341642C45414141562C4D41434179422C594141412C5941414178422C47414341652C4B414341432C71424141412C47414341432C36424141412C47414341432C6B424141412C47414341432C30424141412C47414341432C34424141';
wwv_flow_api.g_varchar2_table(11) := '412C47414341432C6F434141412C4B414741522C51414141222C2266696C65223A22616E696D617065782E6D696E2E6A73222C22736F7572636573436F6E74656E74223A5B222F2A2A5C6E202A20406E616D65737061636520616E696D617065785C6E20';
wwv_flow_api.g_varchar2_table(12) := '2A2A2F5C6E76617220616E696D61706578203D20616E696D61706578207C7C207B5C6E5C74616E696D6174653A2066756E6374696F6E2829207B5C6E5C745C74766172206461203D20746869733B5C6E5C6E5C745C742F2F20617474726962757465735C';
wwv_flow_api.g_varchar2_table(13) := '6E5C745C7476617220616E696D6174696F6E203D2064612E616374696F6E2E61747472696275746530313B5C6E5C745C74766172206475726174696F6E203D2064612E616374696F6E2E61747472696275746530323B5C6E5C745C747661722064656C61';
wwv_flow_api.g_varchar2_table(14) := '79203D2064612E616374696F6E2E61747472696275746530333B5C6E5C745C7476617220697465726174696F6E436F756E74203D2064612E616374696F6E2E61747472696275746530343B5C6E5C6E5C745C7476617220616E696D6174696F6E456E6420';
wwv_flow_api.g_varchar2_table(15) := '3D20277765626B6974416E696D6174696F6E456E64206D6F7A416E696D6174696F6E456E64204D53416E696D6174696F6E456E64206F616E696D6174696F6E656E6420616E696D6174696F6E656E64273B5C6E5C6E5C745C74242864612E616666656374';
wwv_flow_api.g_varchar2_table(16) := '6564456C656D656E7473292E656163682866756E6374696F6E2829207B5C6E5C745C745C74766172206166666563746564456C656D656E74203D20242874686973293B5C6E5C6E5C745C745C742F2F2041504558206576656E74202D206265666F72655C';
wwv_flow_api.g_varchar2_table(17) := '6E5C745C745C746166666563746564456C656D656E742E747269676765722827616E696D617065782D6265666F726527293B5C6E5C6E5C745C745C742F2F204F7074696F6E616C206475726174696F6E20706172616D65746572735C6E5C745C745C7469';
wwv_flow_api.g_varchar2_table(18) := '6620286475726174696F6E20213D3D20756E646566696E656429207B5C6E5C745C745C745C746166666563746564456C656D656E742E637373287B5C6E5C745C745C745C745C7427616E696D6174696F6E2D6475726174696F6E273A206475726174696F';
wwv_flow_api.g_varchar2_table(19) := '6E202B202773272C5C6E5C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D6475726174696F6E273A206475726174696F6E202B202773275C6E5C745C745C745C747D293B5C6E5C745C745C747D5C6E5C6E5C745C745C742F2F204F';
wwv_flow_api.g_varchar2_table(20) := '7074696F6E616C2064656C617920706172616D65746572735C6E5C745C745C746966202864656C617920213D3D20756E646566696E656429207B5C6E5C745C745C745C746166666563746564456C656D656E742E637373287B5C6E5C745C745C745C745C';
wwv_flow_api.g_varchar2_table(21) := '7427616E696D6174696F6E2D64656C6179273A2064656C6179202B202773272C5C6E5C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D64656C6179273A2064656C6179202B202773275C6E5C745C745C745C747D293B5C6E5C745C';
wwv_flow_api.g_varchar2_table(22) := '745C747D5C6E5C6E5C745C745C742F2F204F7074696F6E616C20697465726174696F6E436F756E7420706172616D65746572735C6E5C745C745C7469662028697465726174696F6E436F756E7420213D3D20756E646566696E656429207B5C6E5C745C74';
wwv_flow_api.g_varchar2_table(23) := '5C745C746166666563746564456C656D656E742E637373287B5C6E5C745C745C745C745C7427616E696D6174696F6E2D697465726174696F6E2D636F756E74273A20697465726174696F6E436F756E742C5C6E5C745C745C745C745C74272D7765626B69';
wwv_flow_api.g_varchar2_table(24) := '742D616E696D6174696F6E2D697465726174696F6E2D636F756E74273A20697465726174696F6E436F756E745C6E5C745C745C745C747D293B5C6E5C745C745C747D5C6E5C6E5C745C745C742F2F20416E696D61746520636F6D706F6E656E745C6E5C74';
wwv_flow_api.g_varchar2_table(25) := '5C745C746166666563746564456C656D656E742E616464436C6173732827616E696D617465642027202B20616E696D6174696F6E292E6F6E6528616E696D6174696F6E456E642C2066756E6374696F6E2829207B5C6E5C745C745C745C74242874686973';
wwv_flow_api.g_varchar2_table(26) := '295C6E5C745C745C745C745C742E72656D6F7665436C6173732827616E696D617465642027202B20616E696D6174696F6E295C6E5C745C745C745C745C742E637373287B5C6E5C745C745C745C745C745C7427616E696D6174696F6E2D6475726174696F';
wwv_flow_api.g_varchar2_table(27) := '6E273A2027272C5C6E5C745C745C745C745C745C74272D7765626B69742D616E696D6174696F6E2D6475726174696F6E273A2027272C5C6E5C745C745C745C745C745C7427616E696D6174696F6E2D64656C6179273A2027272C5C6E5C745C745C745C74';
wwv_flow_api.g_varchar2_table(28) := '5C745C74272D7765626B69742D616E696D6174696F6E2D64656C6179273A2027272C5C6E5C745C745C745C745C745C7427616E696D6174696F6E2D697465726174696F6E2D636F756E74273A2027272C5C6E5C745C745C745C745C745C74272D7765626B';
wwv_flow_api.g_varchar2_table(29) := '69742D616E696D6174696F6E2D697465726174696F6E2D636F756E74273A2027275C6E5C745C745C745C745C747D295C6E5C745C745C745C745C742F2F2041504558206576656E74202D2061667465725C6E5C745C745C745C745C742E74726967676572';
wwv_flow_api.g_varchar2_table(30) := '2827616E696D617065782D616674657227293B5C6E5C745C745C747D293B5C6E5C745C747D293B5C6E5C747D5C6E7D3B5C6E225D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(130710506845368845)
,p_plugin_id=>wwv_flow_api.id(130672028021197662)
,p_file_name=>'js/animapex.min.js.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
