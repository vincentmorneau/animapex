/*-------------------------------------
 * AnimAPEX
 * Version: 1.0.0 (2017.10.28)
 * Author: Vincent Morneau
 *-------------------------------------
*/
function render (
	p_dynamic_action in apex_plugin.t_dynamic_action
	, p_plugin in apex_plugin.t_plugin
) return apex_plugin.t_dynamic_action_render_result is
	l_result apex_plugin.t_dynamic_action_render_result;

	-- attributes
	l_animation varchar2(25) := p_dynamic_action.attribute_01;
	l_duration varchar2(25) := p_dynamic_action.attribute_02;
	l_delay varchar2(25) := p_dynamic_action.attribute_03;
	l_iteration_count varchar2(25) := p_dynamic_action.attribute_04;

	-- variable for minified files
	l_min varchar2(5);
begin
	-- defaults
	l_animation := nvl(l_animation, 'bounce');

	-- debug
	if apex_application.g_debug then
		apex_plugin_util.debug_dynamic_action (
			p_plugin => p_plugin
			, p_dynamic_action => p_dynamic_action
		);

		l_min := '.min';
	end if;

	-- add animapex js
	apex_javascript.add_library (
		p_name  => 'animapex' || l_min
		, p_directory  => p_plugin.file_prefix || 'js/'
	);

	-- add css
	apex_css.add_file (
		p_name => 'animate' || l_min
		, p_directory => p_plugin.file_prefix || 'lib/animate/'
	);

	l_result.javascript_function := 'animapex.animate';
	l_result.attribute_01 := l_animation;

	if l_duration is not null then
		l_result.attribute_02 := l_duration;
	end if;

	if l_delay is not null then
		l_result.attribute_03 := l_delay;
	end if;

	if l_iteration_count is not null then
		l_result.attribute_04 := l_iteration_count;
	end if;

	return l_result;
end render;
