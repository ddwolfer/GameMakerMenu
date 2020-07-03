/// @description Insert description here
// You can write your code in this editor
getInput()

if(FreezeMouse && MouseChangeFlag){
	window_set_cursor(cr_none)
	MouseChangeFlag = false
}
if(!FreezeMouse && MouseChangeFlag){
	window_set_cursor(cr_default)
	MouseChangeFlag = false
}

if(PressKeyboard){
	FreezeMouse = true
	MouseChangeFlag = true
}

if( (mouse_x != tempMouseX || mouse_y != tempMouseY) && FreezeMouse){
	FreezeMouse = false
	MouseChangeFlag = true
}else{
	tempMouseX = mouse_x
	tempMouseY = mouse_y
}
/*
if(FreezeMouse){
	show_debug_message("現在滑鼠優先度比較低喔喔喔 ，在用鍵盤")
}else{
	show_debug_message("要用滑鼠點拉= = ")
}*/