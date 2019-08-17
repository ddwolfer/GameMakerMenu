/// @description Insert description here
// You can write your code in this editor

#region 讀檔
if(file_exists("saveSystem.sav")){ //如果存檔存在
	var wrapper = LoadJsonFromFile("saveSystem.sav")
	var list = wrapper[? "System"]
	var map = list
	if( map[?"Language"] != undefined ){
		global.gameLanguage = map[?"Language"]
	}else{
		global.gameLanguage = 0
	}
	if( map[?"SFX"] != undefined ){
		global.gameSFX = map[?"SFX"]
	}else{
		global.gameSFX = 100
	}
	if( map[?"Music"] != undefined ){
		global.gameMusic = map[?"Music"]
	}else{
		global.gameMusic = 100
	}
	if( map[?"Resolution"] != undefined ){
		global.gameResolution = map[?"Resolution"]
		window_set_size(640 * global.gameResolution, 360 * global.gameResolution)
	}else{
		global.gameResolution = window_get_width()/640 //視窗大小 最小為640*360 以此為底算倍數
	}
	if( map[?"FullScreen"] != undefined ){
		if( map[?"FullScreen"] == 1){
			window_set_fullscreen(1)
			global.gameFullScreen = 1
		}else{
			global.gameFullScreen = 0
		}
	}else{
		global.gameFullScreen = 0
	}
}else{
	global.gameLanguage = 0
	global.gameMusic = 100
	global.gameSFX = 100
	global.gameResolution = window_get_width()/640 
	global.gameFullScreen = 0
}
#endregion
global.windowsSize = window_get_width()/640 //視窗大小 最小為640*360 以此為底算倍數

if(room == rLoadData){
	room_goto_next()
}
