/*
	Run a timer with the specified duration from the mission parameters. This function must be spawned!

	Created by Lux0r
*/


while {TTC_saveTime > 0} do {
	sleep 1;
	TTC_saveTime = TTC_saveTime - 1;
	publicVariable "TTC_saveTime";
};