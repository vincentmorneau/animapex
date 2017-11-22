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
begin
	-- defaults
	l_animation := nvl(l_animation, 'bounce');

	-- debug
	if apex_application.g_debug then
		apex_plugin_util.debug_dynamic_action (
			p_plugin => p_plugin
			, p_dynamic_action => p_dynamic_action
		);
	end if;

	-- launch the animapex javascript function
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
