/// @description 操作判定

getInput()
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
var MX = mouse_x
var MY = mouse_y

switch(menuScreen){
	case menuScreen.newgame:
		room_goto_next()
	break
	case menuScreen.main:
		#region main判斷
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
		//確認點擊 (滑鼠)
		if ( mouse_check_button_pressed(mb_left) ){
			for(var line = 0 ; line < array_length_1d(mainMenuText) ; line++){
				//與Draw GUI的實心一樣寫法
				if( ( MX>= MainTextStart_X							&&	MX<= MainTextStart_X + TextBoxWidth )			&&
			        ( MY>= MainTextStart_Y + (line*TextBoxHeight)	&&	MY<= MainTextStart_Y + ((line+1)*TextBoxHeight)) ){
					menuScreen = MainMenuCursor
				}
			}
		}
		#endregion
		break
	case menuScreen.load:
		menuScreen = menuScreen.main
		break
		
	case menuScreen.option:
		//鍵盤返回
		if( keyboard_check_pressed( vk_escape ) ){
			menuScreen = menuScreen.main
		}
		if ( mouse_check_button_pressed(mb_left) ){
			for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
				switch(line){
					case 0://解析度
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
							switch(windowsSize){
								case 1:
									window_set_size(1920,1080)
									windowsSize = 3
									break
								case 2:
									window_set_size(640,360)
									windowsSize = 1
									break
								case 2.25:
									window_set_size(1280,720)
									windowsSize = 2
									break
								case 3:
									window_set_size(1440,810)
									windowsSize = 2.25
									break
							}
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
							switch(windowsSize){
							case 1:
								window_set_size(1280,720)
								windowsSize = 2
								break
							case 2:
								window_set_size(1440,810)
								windowsSize = 2.25
								break
							case 2.25:
								window_set_size(1920,1080)
								windowsSize = 3
								break
							case 3:
								window_set_size(640,360)
								windowsSize = 1
								break
						}
					}
					#endregion
					break
					case 1://全螢幕
					if( (MX>= FSx1 && MX <= FSx2) &&
						(MY>= FSy1 && MY <= FSy2) ){
						if(window_get_fullscreen()){
							window_set_fullscreen(0)
						}else{
							window_set_fullscreen(1)
						}
					}
					break
					case 2://語言
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(gameLanguage == 0){
							gameLanguage = array_length_1d(LanguageOption) - 1
						}else{
							gameLanguage -= 1
						}
						setAllFont()
					
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(gameLanguage == array_length_1d(LanguageOption) - 1){
							gameLanguage = 0
						}else{
							gameLanguage += 1
						}	
						setAllFont()
					}
					#endregion
					break
					case 3://音樂
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(gameMusic > 0 ){
							gameMusic -= 10
						}					
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(gameMusic < 100){
							gameMusic += 10
						}
					}
					#endregion
					break
					case 4://音效
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(gameSFX > 0){
							gameSFX -= 10
						}
							
					
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(gameSFX < 100){
							gameSFX += 10
						}	
					}
					#endregion
					break
				}	
			}
		}
		break
	case menuScreen.exitgame:
		game_end()
		break
}