/// @description 操作判定

getInput()
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
if(oGame.FreezeMouse){
	var MX = 0
	var MY = 0
}else{
	var MX = mouse_x
	var MY = mouse_y
}


if( getsaveTime > 2 ){
	getsaveTime = 0
	oLoading.image_alpha = 0
	menuScreen = menuScreen.main
}

switch(menuScreen){
	case menuScreen.newgame:
		#region
		//鍵盤返回
		if( select ){
			menuScreen = menuScreen.main
		}
		//鍵盤控制
		if( upMenu && newGameCursor>0 ){
			newGameCursor -= 1
		}
		if( downMenu &&  newGameCursor<2){
			newGameCursor += 1
		}
		//判斷滑鼠位置
		for(var line = 0 ; line < 3 ; line++){
			if( ( MX >= LoadStart_X											&& MX <= DrawLoadStart_X+DrawLoadBoxWidth )	&& 
				( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
				newGameCursor = line
			}
		}
			
		//3個方框
		if ( mouse_check_button_pressed(mb_left) ){
			for(var line = 0 ; line < 3 ; line++){
				filename = "savefile0" + string(line+1) + ".sav"
				//判斷滑鼠位置
				if( ( MX >= LoadStart_X											&& MX <= DrawLoadStart_X+DrawLoadBoxWidth )	&& 
					( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
					
					if(file_exists(filename)){
						//播放不能選擇的聲音
					}else{
						global.playingSave = line+1
						oInGameTime.Hours = 0
						oInGameTime.Mins = 0
						oInGameTime.Sec = 0
						with(oGame){
							targetRoom = r1_0
							doTransition = true
						}
					}
				}
				//按下刪除按鍵
				if( ( MX >= deleteStart_X											&& MX <= deleteEnd_X )	&& 
					( MY >= deleteStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= deleteEnd_Y + (line* (LoadBoxHeight+LoadBoxSpace)))  ){
					//file_delete(filename)
					deleteFromNew = 1
					deletefile = line+1
					menuScreen = menuScreen.deleteGame
				}	
			}
		}
		if( start ){
			filename = "savefile0" + string(newGameCursor+1) + ".sav"
			if(file_exists(filename)){
						//播放不能選擇的聲音
			}else{
				global.playingSave = newGameCursor+1
				oInGameTime.Hours = 0
				oInGameTime.Mins = 0
				oInGameTime.Sec = 0
				with(oGame){
					targetRoom = r1_0
					doTransition = true
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
				//鍵盤控制
		if( upMenu && loadGameCursor>0 ){
			loadGameCursor -= 1
		}
		if( downMenu &&  loadGameCursor<2){
			loadGameCursor += 1
		}
		//判斷滑鼠位置
		for(var line = 0 ; line < 3 ; line++){
			if( ( MX >= LoadStart_X											&& MX <= DrawLoadStart_X+DrawLoadBoxWidth )	&& 
				( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
				loadGameCursor = line
			}
		}
		//3個方框
		if ( mouseLeftClick ){
			for(var line = 0 ; line < 3 ; line++){
				//判斷滑鼠位置
				if( ( MX >= LoadStart_X											&& MX <= LoadStart_X+LoadBoxWidth )	&& 
					( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
					filename = "savefile0" + string(line+1) + ".sav"
					if(file_exists(filename)){
						loadGameFile(line+1)
						oGame.doTransition = true
						global.playingSave = line + 1
					}else{
						//播放不能選擇的聲音
					}
				}
				//按下刪除按鍵
				if( ( MX >= deleteStart_X											&& MX <= deleteEnd_X )	&& 
					( MY >= deleteStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= deleteEnd_Y + (line* (LoadBoxHeight+LoadBoxSpace)))  ){
					//file_delete(filename)
					deleteFromLoad = 1
					deletefile = line+1
					menuScreen = menuScreen.deleteGame
				}
			}
		}
		if( start ){
			filename = "savefile0" + string(loadGameCursor+1) + ".sav"
			if(file_exists(filename)){
				loadGameFile(loadGameCursor+1)
				oGame.doTransition = true
				global.playingSave = loadGameCursor + 1
			}else{
				//播放不能選擇的聲音
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
		if( upMenu && optionCursor>0 ){
			optionCursor -= 1
		}
		if( downMenu && optionCursor<4 ){
			optionCursor += 1
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
							(MY>= FSy1 && MY <= FSy2)){
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
		if(start && oGame.FreezeMouse){
			if(optionCursor == 1){
				if(window_get_fullscreen()){
					window_set_fullscreen(0)
					global.gameFullScreen = 0
				}else{
					window_set_fullscreen(1)
					global.gameFullScreen = 1
				}
			}
		}
		if(leftMenu && oGame.FreezeMouse){
			switch(optionCursor){
				case 0: //解析度
					#region
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
					#endregion
					break
				case 2: //語言
					#region
					if(global.gameLanguage == 0){
						global.gameLanguage = array_length_1d(LanguageOption) - 1
					}else{
						global.gameLanguage -= 1
					}
					setAllFont()
					#endregion
					break
				case 3: //音樂
					#region
					if(global.gameMusic > 0 ){
						global.gameMusic -= 10
					}		
					#endregion
					break
				case 4: //音效
					#region
					if(global.gameSFX > 0){
						global.gameSFX -= 10
					}
					#endregion
					break
			}
		}
		if(rightMenu && oGame.FreezeMouse){
			switch(optionCursor){
				case 0: //解析度
					#region
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
					#endregion
					break
				case 2: //語言
					#region
					if(global.gameLanguage == array_length_1d(LanguageOption) - 1){
						global.gameLanguage = 0
					}else{
						global.gameLanguage += 1
						}	
					setAllFont()
					#endregion
					break
				case 3: //音樂
					#region
					if(global.gameMusic < 100){
						global.gameMusic += 10
					}
					#endregion
					break
				case 4: //音效
					#region
					if(global.gameSFX < 100){
						global.gameSFX += 10
					}
					#endregion
					break
			}
		}
		#endregion
		break
		
	case menuScreen.deleteGame:
		#region
		#region
		//鍵盤返回
		if( select && deleteFromNew){
			deleteFromNew = 0
			menuScreen = menuScreen.newgame
		}else if(select && deleteFromLoad){
			deleteFromLoad = 0
			menuScreen = menuScreen.load
		}
		//鍵盤控制
		if( leftMenu || rightMenu ){
			if( deleteGameCursor == 1 ){
				deleteGameCursor = 0
			}else{
				deleteGameCursor = 1
			}
		}
		#endregion
		
		//滑鼠判定
		if(mouseLeftClick){
			filename = "savefile0" + string(deletefile) + ".sav"
			//是 yes
			if( (MX >= YesBoxX1 && MX <= YesBoxX2) && 
				(MY >= YesBoxY1 && MY <= YesBoxY2 ) ){
				show_debug_message("delete file : " + string(filename))
				file_delete(filename)
				//返回
				if(deleteFromNew){
					deleteFromNew = 0
					menuScreen = menuScreen.newgame
				}else if(deleteFromLoad){
					deleteFromLoad = 0
					menuScreen = menuScreen.load
				}
			}
			//否 no
			if( (MX >= NoBoxX1 && MX <= NoBoxX2) && 
				(MY >= NoBoxY1 && MY <= NoBoxY2 ) ){
				//返回
				if(deleteFromNew){
					deleteFromNew = 0
					menuScreen = menuScreen.newgame
				}else if(deleteFromLoad){
					deleteFromLoad = 0
					menuScreen = menuScreen.load
				}
			}
		}
		if( start ){
			filename = "savefile0" + string(deletefile) + ".sav"
			if(deleteGameCursor==0){
				//返回
				if(deleteFromNew){
					deleteFromNew = 0
					menuScreen = menuScreen.newgame
				}else if(deleteFromLoad){
					deleteFromLoad = 0
					menuScreen = menuScreen.load
				}
			}else if(deleteGameCursor == 1){
				//是 yes
				show_debug_message("delete file : " + string(filename))
				file_delete(filename)
				//返回
				if(deleteFromNew){
					deleteFromNew = 0
					menuScreen = menuScreen.newgame
				}else if(deleteFromLoad){
					deleteFromLoad = 0
					menuScreen = menuScreen.load
				}
				
			}
		}
		#endregion
	
		break
	
	case menuScreen.exitgame:
		game_end()
		break
}