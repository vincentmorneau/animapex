/*!
 * animapex - A dynamic action plugin to easily animate any APEX component
 * @author Vincent Morneau
 * @version v1.0.0
 * @link 
 * @license MIT
 */
/**
 * @namespace animapex
 **/
var animapex = animapex || {
	animate: function() {
		var da = this;

		// attributes
		var animation = da.action.attribute01;
		var duration = da.action.attribute02;
		var delay = da.action.attribute03;
		var iterationCount = da.action.attribute04;

		var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

		$(da.affectedElements).each(function() {
			var affectedElement = $(this);

			// APEX event - before
			affectedElement.trigger('animapex-before');

			// Optional duration parameters
			if (duration !== undefined) {
				affectedElement.css({
					'animation-duration': duration + 's',
					'-webkit-animation-duration': duration + 's'
				});
			}

			// Optional delay parameters
			if (delay !== undefined) {
				affectedElement.css({
					'animation-delay': delay + 's',
					'-webkit-animation-delay': delay + 's'
				});
			}

			// Optional iterationCount parameters
			if (iterationCount !== undefined) {
				affectedElement.css({
					'animation-iteration-count': iterationCount,
					'-webkit-animation-iteration-count': iterationCount
				});
			}

			// Animate component
			affectedElement.addClass('animated ' + animation).one(animationEnd, function() {
				$(this)
					.removeClass('animated ' + animation)
					.css({
						'animation-duration': '',
						'-webkit-animation-duration': '',
						'animation-delay': '',
						'-webkit-animation-delay': '',
						'animation-iteration-count': '',
						'-webkit-animation-iteration-count': ''
					})
					// APEX event - after
					.trigger('animapex-after');
			});
		});
	}
};

//# sourceMappingURL=animapex.js.map
