/*
	Function to write multiple line to the log file at once.

	Created by Lux0r
*/


diag_log "==================================================";

{
	if (count _x > 1) then {
		diag_log format _x;
	} else {
		diag_log (_x select 0);
	};
} forEach _this;

diag_log "==================================================";