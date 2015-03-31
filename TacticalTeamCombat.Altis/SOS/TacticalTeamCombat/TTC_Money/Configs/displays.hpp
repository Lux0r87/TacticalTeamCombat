class RscTitles {

	titles[] = {TTC_MONEY_BalanceDisplay};
	
	class TTC_MONEY_BalanceDisplay {
	
		idd			= 1000;
		duration	= 999999;
		fadeIn		= 0;
		fadeOut		= 0;
		onLoad		= uiNamespace setVariable ["TTC_MONEY_balanceDisplay", _this select 0];
		onUnLoad	= uiNamespace setVariable ["TTC_MONEY_balanceDisplay", nil];
        
		class Controls {
		
			class TTC_MONEY_BalanceDisplay_Text : TTC_RscStructuredText {
			
				idc		= 1001;             
				style	= ST_RIGHT;
				size	= "0.03 / (getResolution select 5)";
				
				x = safezoneX + safezoneW - 0.26;
				y = safezoneY + safezoneH - 0.07;
				w = 0.25;
				h = 0.06;
								
				class Attributes {
					align		= "right";
				};
            };
        
        };
    };
	
};