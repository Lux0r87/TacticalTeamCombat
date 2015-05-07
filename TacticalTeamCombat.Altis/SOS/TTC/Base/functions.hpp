class TTC_Base_Functions {
	tag = "TTC_BASE";

	class Init {
		file = "SOS\TTC\Base";
		class init{};
	};

	class Actions {
		file = "SOS\TTC\Base\Functions\Actions";
		class addTeleportActions{};
		class addShopActions{};
	};

	class Protection {
		file = "SOS\TTC\Base\Functions\Protection";
		class noFireZone{};
	};

	class Spawn {
		file = "SOS\TTC\Base\Functions\Spawn";
		class spawnBase {};
		class spawnInfoArea {};
		class spawnShop {};
		class spawnTeleporter {};
	};
};
