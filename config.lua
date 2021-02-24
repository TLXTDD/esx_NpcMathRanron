Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 0
Config.TimerBeforeNewRob    = 5400 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 15   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = false -- give black money? If disabled it will give cash instead
--ItemType表示 1 --> 黑钱   2--> 白钱  3. --> 枪械  4.--> 物品
Stores = {
	
		npcMax = 5,--npc生成數量
		timeout = 1000,--循環檢測時間
		maxX = 50,--X範圍最大值
		maxY = 50,--Y範圍最大
		maxZ = 50,--z範圍最大值
		sprite = 1,
		color = 1,
		name = '測試',
		npcNum = {
			{ x = 1194.23, 	y = 2678.26, 	z = 37.79, h = 268.27 	,weaponsName = 'WEAPON_SNSPISTOL_MK2'},
		},
}
