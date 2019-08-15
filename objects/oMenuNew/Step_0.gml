/// @description 操作判定
// You can write your code in this editor
getInput()

testForResolution()
//show_debug_message("X: " + string(window_mouse_get_x()) + "| Y: " + string( + window_mouse_get_y() ))

switch(menuScreen){
	case menuScreen.newgame:
		room_goto_next()
	break
	case menuScreen.main:
		//上下控制光標位置 (鍵盤or控制器)
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