/// @description Insert description here
// You can write your code in this editor
if( loadGameFile(1) ){
	saveTime[0] = timeToString(oInGameTime.Hours, oInGameTime.Mins, oInGameTime.Sec)
	show_debug_message( "save 1 :" + string(saveTime[0]) )
	getsaveTime++
}
if( loadGameFile(2) ){
	saveTime[1] = timeToString(oInGameTime.Hours, oInGameTime.Mins, oInGameTime.Sec)
	show_debug_message( "save 2 :" + string(saveTime[1]) )
	getsaveTime++
}
if( loadGameFile(3) ){
	saveTime[2] = timeToString(oInGameTime.Hours, oInGameTime.Mins, oInGameTime.Sec)
	show_debug_message( "save 3 :" + string(saveTime[2]) )
	getsaveTime++
}