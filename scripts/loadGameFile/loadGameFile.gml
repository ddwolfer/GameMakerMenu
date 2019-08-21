var saveFileName = "savefile0" + string(argument0) + ".sav"
if(file_exists(saveFileName)){
	var wrapper = LoadJsonFromFile(saveFileName)
	var list = wrapper[? "GameSave"]
	var map = list
	
	oInGameTime.Hours = 0
	oInGameTime.Mins = 0
	oInGameTime.Sec = 0
	oGame.targetRoom = r1_0
	//遊戲時間小時
	if( map[?"gameTimeHours"] != undefined ){
		oInGameTime.Hours = map[?"gameTimeHours"]
	}
	//遊戲時間分鐘
	if( map[?"gameTimeMins"] != undefined ){
		oInGameTime.Mins = map[?"gameTimeMins"]
	}
	//遊戲時間秒數
	if( map[?"gameTimeSec"] != undefined ){
		oInGameTime.Sec = map[?"gameTimeSec"]
	}
	//房間位置
	if( map[?"room"] != undefined ){
		if( asset_get_index(map[?"room"]) ){
			oGame.targetRoom = asset_get_index(map[?"room"])
		}
	}else{
		show_debug_message("error")
	}
	//釋放記憶體
	ds_map_destroy(wrapper)
	ds_map_destroy(map)
}
return true

