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
				
				x = 52		* GUI_GRID_W + GUI_GRID_X;
				y = 33.6	* GUI_GRID_H + GUI_GRID_Y;
				w = 16		* GUI_GRID_W;
				h = 1.2		* GUI_GRID_H;
				
				class Attributes {
					font	= "PuristaSemiBold";
					align	= "right";
				};
            };
        
        };
    };
	
};