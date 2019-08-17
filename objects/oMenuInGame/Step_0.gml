/// @description Insert description here
// You can write your code in this editor
getInput()
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
var MX = mouse_x
var MY = mouse_y

if(select && room != rTitle){
	if( IGMenuScreen == IGMenuScreen.off ){ //off -> main
		IGMenuScreen = IGMenuScreen.main
		FreezeControl = true
		FreezeMove = true
		show_debug_message("on")
	}else if ( IGMenuScreen == IGMenuScreen.option){ // option -> main
		saveOptionSystem()
		IGMenuScreen = IGMenuScreen.main
	}else if (IGMenuScreen == IGMenuScreen.main){//main -> off
		IGMenuScreen = IGMenuScreen.off
		FreezeControl = false
		FreezeMove = false
		show_debug_message("off")
	}
}

switch(IGMenuScreen){
	case IGMenuScreen.main:
		#region //main
		if(mouseLeftClick){
			show_debug_message("click")
			for( var line = 0 ; line < array_length_1d(IGMainMenuText) ; line++){
				show_debug_message("for :" + string(line))
				if( (MX >= IGmainTextStart_X							&& MX <= IGmainTextSEnd_X) &&
					(MY >= IGmainTextStart_Y + ( line * IGmainText_H)	&& MY <= IGmainTextStart_Y + ( (line+1) * IGmainText_H)) ){
					show_debug_message("mouse")
					//按下哪一個選項
					switch(line){
						case 0: //返回遊戲
							IGMenuScreen = IGMenuScreen.off
						break
						case 1: //選項
							IGMenuScreen = IGMenuScreen.option
						break
						case 2: //儲存&結束
							with(oGame){
								targetRoom = rTitle
								doTransition = true
							}
							IGMenuScreen = IGMenuScreen.off
						break
					}
				}
			}
		}
		#endregion
	break
		
	case IGMenuScreen.option:
		#region //option
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
}

