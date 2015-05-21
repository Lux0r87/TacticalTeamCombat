#define TTC_CORE_timer_width 0.50

class TTC_CORE_timerDisplay {
	idd			= 1006;
	duration	= 9999;
	fadeIn		= 0.5;
	fadeOut		= 10;
	onLoad		= uiNamespace setVariable ["TTC_CORE_timerDisplay", _this select 0];
	onUnLoad	= uiNamespace setVariable ["TTC_CORE_timerDisplay", nil];

	class Controls {
		class TTC_CORE_timerDisplay_Text : TTC_RscStructuredText_AlignCenter {
			idc		= 1007;
			size	= 0.03 / (getResolution select 5);

			x = 0.5 - (TTC_CORE_timer_width / 2);
			y = safezoneY;
			w = TTC_CORE_timer_width;
			h = 0.07;
		};
	};
};
