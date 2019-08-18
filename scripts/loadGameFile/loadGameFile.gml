var wrapper = LoadJsonFromFile(filename)
var list = wrapper[? "GameSave"]
var map = list

show_debug_message(string(map[?"gameTimeHours"]) + ":" +string(map[?"gameTimeMins"]) +":" + string(map[?"gameTimeSec"]) + "|in room:" + string(map[?"room"]) + "||room index:" + string(asset_get_index(map[?"room"])))

//遊戲時間小時
if( map[?"gameTimeHours"] != undefined ){
	oInGameTime.Hours = map[?"gameTimeHours"]
}else{
	oInGameTime.Hours = 0
}
//遊戲時間分鐘
if( map[?"gameTimeMins"] != undefined ){
	oInGameTime.Mins = map[?"gameTimeMins"]
}else{
	oInGameTime.Mins = 0
}
//遊戲時間秒數
if( map[?"gameTimeSec"] != undefined ){
	oInGameTime.Sec = map[?"gameTimeSec"]
}else{
	oInGameTime.Sec = 0
}
//房間位置
if( map[?"room"] != undefined ){
	oGame.targetRoom = asset_get_index(map[?"room"])
}else{
	oGame.targetRoom = rStart
}

//釋放記憶體
ds_map_destroy(wrapper)
ds_map_destroy(map)
