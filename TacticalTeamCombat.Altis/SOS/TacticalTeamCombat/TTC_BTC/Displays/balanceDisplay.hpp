class TTC_BTC_balanceDisplay {
	idd			= 1002;
	duration	= 3;
	fadeIn		= 1;
	fadeOut		= 1;
	onLoad		= uiNamespace setVariable ["TTC_BTC_balanceDisplay", _this select 0];
	onUnLoad	= uiNamespace setVariable ["TTC_BTC_balanceDisplay", nil];

	class Controls {
		class TTC_BTC_balanceDisplay_Text : TTC_RscStructuredText_AlignRight {
			idc		= 1003;
			size	= "0.03 / (getResolution select 5)";

			x = safezoneX + safezoneW - 0.297;
			y = safezoneY + safezoneH - 0.17;
			w = 0.25;
			h = 0.10;
		};
	};
};