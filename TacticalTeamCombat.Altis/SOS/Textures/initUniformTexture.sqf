//While Loop for Uniform and Insignia. By Catshannon [S.O.S]

while {true} do {
	switch (uniform player) do {
		case "U_B_CombatUniform_mcam";
		case "U_B_CombatUniform_mcam_vest";
		case "U_B_CombatUniform_mcam_tshirt":
		{
			player setObjectTextureGlobal [0,"SOS\Textures\Uniform.paa"];
		};
		/*case "U_I_CombatUniform";	  
		case "U_I_CombatUniform_tshirt";
		case "U_I_CombatUniform_shortsleeve":
		{
			player setObjectTextureGlobal [0,"SOS\Textures\UniformM.paa"];
		};*/
	};

	Sleep 10;
};