class TTC_BTC_incomeDisplay {
	idd			= 1002;
	duration	= 3;
	fadeIn		= 1;
	fadeOut		= 1;
	onLoad		= uiNamespace setVariable ["TTC_BTC_incomeDisplay", _this select 0];
	onUnLoad	= uiNamespace setVariable ["TTC_BTC_incomeDisplay", nil];

	class Controls {
		class TTC_BTC_incomeDisplay_Text : TTC_RscStructuredText_AlignRight {
			idc		= 1003;
			size	= "0.03 / (getResolution select 5)";

			x = safezoneX + safezoneW - 0.347;
			y = safezoneY + safezoneH - 0.17;
			w = 0.30;
			h = 0.10;
		};
	};
};