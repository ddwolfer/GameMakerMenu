/// @description 操作判定
// You can write your code in this editor
getInput()

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
		//確認 (滑鼠)
		if ( mouse_check_button_pressed(mb_left) ){
			for(var line = 0 ; line < array_length_1d(mainMenuText) ; line++){
				var WMX = window_mouse_get_x() //滑鼠X
				var WMY = window_mouse_get_y() //滑鼠Y
				//判斷點到哪裡
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
		
		if ( mouse_check_button_pressed(mb_left) ){
			var WMX = window_mouse_get_x() //滑鼠X
			var WMY = window_mouse_get_y() //滑鼠Y
			#region resolution
			//left arrow
			if( (WMX >= 320*windowsSize && WMX <= 342*windowsSize ) && 
			    (WMY >= 55.6*windowsSize && WMY <= 76.6*windowsSize) ){
					show_debug_message("left click")
					show_debug_message(string(windowsSize))
				switch(windowsSize){
					case 1:
						window_set_size(1920,1080)
						windowsSize=3
						break
					case 2:
						window_set_size(640,360)
						windowsSize=1
						break
					case 2.25:
						window_set_size(1280,720)
						windowsSize=2
						break
					case 3:
						window_set_size(1440,810)
						windowsSize=2.25
						break
				}
			}
			//right arrow
			if( (WMX >= 512*windowsSize && WMX <= 534*windowsSize ) && 
			    (WMY >= 55.6*windowsSize && WMY <= 76.6*windowsSize) ){
					show_debug_message("right click")
					show_debug_message(string(windowsSize))
				switch(windowsSize){
					case 1:
						window_set_size(1280,720)
						windowsSize=2
						break
					case 2:
						window_set_size(1440,810)
						windowsSize=2.25
						break
					case 2.25:
						window_set_size(1920,1080)
						windowsSize=3
						break
					case 3:
						window_set_size(640,360)
						windowsSize=1
						break
				}
			}
			
			#endregion
			
			
			//back
			if( (WMX >= 48*windowsSize && WMX <= 96*windowsSize ) && 
			    (WMY >= 274*windowsSize && WMY <= 324*windowsSize) ){
				menuScreen = menuScreen.main
			}
		} 
		break
		
	case menuScreen.exitgame:
		game_end()
		break
}