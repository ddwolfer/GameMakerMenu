/// @description Insert description here
// You can write your code in this editor
getInput()
switch(menuScreen){
	case menuScreen.newgame:
		room_goto_next()
	break
	case menuScreen.main:
		//上下 (鍵盤or控制器)
		if(upMenu){
			show_debug_message("UP")
			if(MainMenuCursor> 0){
				MainMenuCursor -= 1
			}else{
				MainMenuCursor = array_length_1d(mainMenuText)-1
			}
		}else if(downMenu){
			show_debug_message("DOWN")
			if(MainMenuCursor < array_length_1d(mainMenuText)-1){
				MainMenuCursor += 1
			}else{
				MainMenuCursor = 0
			}
		}
		//確認 (鍵盤or控制器)
		if(start){
			show_debug_message(string(MainMenuCursor))
			menuScreen = MainMenuCursor
		}
		//確認 (滑鼠)
		if ( mouse_check_button_pressed(mb_left) ){
			for(var line = 0 ; line < array_length_1d(mainMenuText) ; line++){
				var WMX = window_mouse_get_x()
				var WMY = window_mouse_get_y()
				if((WMX >= MainMenuTextStartPosition_X && WMX <= MainMenuTextStartPosition_X+TextBoxWidth ) && 
			    (WMY >= (line*TextBoxHeight)+MainMenuTextStartPosition_Y && WMY <= (line*TextBoxHeight)+TextBoxHeight+MainMenuTextStartPosition_Y)){
					show_debug_message(string(MainMenuCursor))
					menuScreen = MainMenuCursor
				}
			}
		} 
		break
	case menuScreen.load:
		menuScreen = menuScreen.main
		break
	case menuScreen.option:
		
		break
	case menuScreen.exitgame:
		game_end()
		break
}