#define TTC_sector_width 0.50

class TTC_CTI_sectorDisplay {
	idd			= 1004;
	duration	= 999999;
	fadeIn		= 0;
	fadeOut		= 0;
	onLoad		= uiNamespace setVariable ["TTC_CTI_sectorDisplay", _this select 0];
	onUnLoad	= uiNamespace setVariable ["TTC_CTI_sectorDisplay", nil];

	class Controls {
		class TTC_CTI_sectorDisplay_Text : TTC_RscStructuredText_AlignCenter {
			idc		= 1005;
			size	= 0.03 / (getResolution select 5);

			x = 0.5 - (TTC_sector_width / 2);
			y = safezoneY;
			w = TTC_sector_width;
			h = 0.07;
		};
	};
};