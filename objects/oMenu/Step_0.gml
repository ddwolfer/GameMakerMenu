/// @description 操作判定

getInput()
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
var MX = mouse_x
var MY = mouse_y

switch(menuScreen){
	case menuScreen.newgame:
		#region
		//鍵盤返回
		if( select ){
			menuScreen = menuScreen.main
		}
		//3個方框
		if ( mouse_check_button_pressed(mb_left) ){
			for(var line = 0 ; line < 3 ; line++){
				//判斷滑鼠位置
				if( ( MX >= LoadStart_X											&& MX <= DrawLoadStart_X+DrawLoadBoxWidth )	&& 
					( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
					filename = "savefile0" + string(line+1) + ".sav"
					if(file_exists(filename)){
						//播放不能選擇的聲音
					}else{
						with(oGame){
							targetRoom = rStart
							doTransition = true
							playWithSave = line+1
						}
					}
				}
			}
		}
		#endregion
		break
		
	case menuScreen.main:
		#region 
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
		if ( mouseLeftClick ){
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
		#region
		//鍵盤返回
		if( select ){
			menuScreen = menuScreen.main
		}
		//3個方框
		if ( mouseLeftClick ){
			for(var line = 0 ; line < 3 ; line++){
				//判斷滑鼠位置
				if( ( MX >= LoadStart_X											&& MX <= DrawLoadStart_X+DrawLoadBoxWidth )	&& 
					( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
					filename = "savefile0" + string(line+1) + ".sav"
					if(file_exists(filename)){
						targetRoom = rStart
						doTransition = true
						playWithSave = line+1
					}else{
						//播放不能選擇的聲音
					}
				}
			}
		}
		#endregion
		break
		
	case menuScreen.option:
		#region
		//鍵盤返回
		if( select ){
			saveOptionSystem()
			
			menuScreen = menuScreen.main
		}
		if ( mouseLeftClick ){
			for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
				switch(line){
					case 0://解析度
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
							switch(global.gameResolution){
								case 1:
									window_set_size(1920,1080)
									global.gameResolution = 3
									break
								case 2:
									window_set_size(640,360)
									global.gameResolution = 1
									break
								case 2.25:
									window_set_size(1280,720)
									global.gameResolution = 2
									break
								case 3:
									window_set_size(1440,810)
									global.gameResolution = 2.25
									break
							}
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
							switch(global.gameResolution){
							case 1:
								window_set_size(1280,720)
								global.gameResolution = 2
								break
							case 2:
								window_set_size(1440,810)
								global.gameResolution = 2.25
								break
							case 2.25:
								window_set_size(1920,1080)
								global.gameResolution = 3
								break
							case 3:
								window_set_size(640,360)
								global.gameResolution = 1
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
							global.gameFullScreen = 0
						}else{
							window_set_fullscreen(1)
							global.gameFullScreen = 1
						}
					}
					break
					case 2://語言
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(global.gameLanguage == 0){
							global.gameLanguage = array_length_1d(LanguageOption) - 1
						}else{
							global.gameLanguage -= 1
						}
						setAllFont()
					
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(global.gameLanguage == array_length_1d(LanguageOption) - 1){
							global.gameLanguage = 0
						}else{
							global.gameLanguage += 1
						}	
						setAllFont()
					}
					#endregion
					break
					case 3://音樂
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(global.gameMusic > 0 ){
							global.gameMusic -= 10
						}					
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(global.gameMusic < 100){
							global.gameMusic += 10
						}
					}
					#endregion
					break
					case 4://音效
					#region
					if( (MX>= optionContentStart_X && MX <= optionContentStart_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(global.gameSFX > 0){
							global.gameSFX -= 10
						}
							
					
					}
					if( (MX>= optionContentEND_X && MX <= optionContentEND_X + optionArrow_W) &&
						(MY>= optionContentStart_Y*0.85 + optionContentBoxHeight*line && MY <= (optionContentStart_Y*0.85 + optionContentBoxHeight*line) +  optionArrow_H) ){
						if(global.gameSFX < 100){
							global.gameSFX += 10
						}	
					}
					#endregion
					break
				}	
			}
		}
		#endregion
		break
		
	case menuScreen.exitgame:
		game_end()
		break
}