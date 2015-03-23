waitUntil {!isNull player && player == player};

player createDiarySubject ["serverrules", "Server Rules"];
player createDiarySubject ["sos", "S.O.S"];


player createDiaryRecord ["Diary",
[
"Controls",
"<font size=16>Jump</font><br/>
2 * C<br/><br/>
<font size=16>Mag Repack</font><br/>
Ctrl + R<br/><br/>
<font size=16>Weapon Resting</font> (requires mod)<br/>
Ctrl + Space<br/><br/>
<font size=16>Show/hide Platoon List</font><br/>
Ctrl + Alt + P<br/><br/>
<font size=16>Tao Folding Map</font> (requires mod)<br/>
- Open map: Shift + Map (default 'm')<br/>
- Zoom: Shift + Ctrl + Zoom In/Out (default 'Numpad +/-')<br/>
- Nightvision: Shift + Ctrl + Nightvision (default 'n')"
]
];

player createDiaryRecord ["Diary",
[
"Info",
"Keep in mind that only medics can revive people.<br/><br/>
This mission was created by BauerMitFackel[Generalfeldmarschall]."
]
];

player createDiaryRecord ["serverrules",
[
"Helicopters",
"For pilots, we need to be able to coordinate with them to organize the transport runs of the other players. Therefore pilots <font color='#ff0000'>must have a microphone!</font><br/><br/>
<font color='#ff0000'>Helicopters are not for personal transport!</font><br/><br/>
Only experienced pilots when we do gaming sessions. If you want to train your pilot skills choose another time or server.<br/><br/>
We <font color='#ff0000'>kick</font> all the users who do not observe these basic rules."
]
];

player createDiaryRecord ["serverrules",
[
"How to Teamplay",
"We require <font color='#2255ff'>cooperative gameplay</font> from all the users of this server. This means that everyone <font color='#ff0000'>must listen to orders</font>, coming from teamleaders, and clanleader.<br/><br/>
<font color='#ff0000'>No other behaviour is tolerated than teamplay.</font><br/><br/>
Patience and maturity are necessary to achieve a correct military simulation experience and to be able to <font color='#2255ff'>have fun</font>.<br/><br/>
We <font color='#ff0000'>kick</font> all the users who do not observe these basic rules."
]
];

player createDiaryRecord ["serverrules",
[
"General Instructions",
""
]
];

player createDiaryRecord ["sos",
[
"Donations",
"Your generous donation will help keep the server running.<br/>
Donate securely with PayPal on our website."
]
];

player createDiaryRecord ["sos",
[
"Join [S.O.S]",
"<font color='#2255ff'>[S.O.S]</font> is a gaming community which focuses on <font color='#2255ff'>realism</font> of the simulation and <font color='#2255ff'>tactical gameplay</font>.<br/><br/>
If you are interested in joining our clan, talk to any Admin or visit us at: <font color='#2255ff'>www.sos-tactical-gaming.shivtr.com</font>"
]
];