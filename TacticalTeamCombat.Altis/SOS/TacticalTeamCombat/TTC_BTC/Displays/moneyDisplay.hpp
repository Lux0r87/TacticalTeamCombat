class TTC_BTC_moneyDisplay {
	idd			= 1000;
	duration	= 999999;
	fadeIn		= 0;
	fadeOut		= 0;
	onLoad		= uiNamespace setVariable ["TTC_BTC_moneyDisplay", _this select 0];
	onUnLoad	= uiNamespace setVariable ["TTC_BTC_moneyDisplay", nil];

	class Controls {
		class TTC_BTC_moneyDisplay_Text : TTC_RscStructuredText_AlignRight {
			idc		= 1001;
			size	= "0.03 / (getResolution select 5)";

			x = safezoneX + safezoneW - 0.31;
			y = safezoneY + safezoneH - 0.07;
			w = 0.30;
			h = 0.06;
		};
	};
};