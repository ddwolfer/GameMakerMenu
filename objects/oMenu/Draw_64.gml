/// @description 介面文字

//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
var MX = mouse_x
var MY = mouse_y

switch(menuScreen){
	case menuScreen.main:
		#region main繪圖
		//繪製文字與框
		for(var line = 0 ; line < array_length_1d(mainMenuText) ; line++){
			//文字位置 比框靠近中心一點
			var textX = DrawMainTextStart_X *1.3
			var textY = (line*DrawTextBoxHeight) + DrawTextBoxHeight/2 + DrawMainTextStart_Y
			//畫實心框 前兩行判斷為滑鼠 第三行判斷為案鍵
			if( ( MX>= MainTextStart_X							&&	MX<= MainTextStart_X + TextBoxWidth )			&&
			    ( MY>= MainTextStart_Y + (line*TextBoxHeight)	&&	MY<= MainTextStart_Y + ((line+1)*TextBoxHeight))||
				MainMenuCursor == line ){
				//實心 + 光標
				drawGradualColor(DrawMainTextStart_X						,(line*DrawTextBoxHeight)+DrawMainTextStart_Y,
							     DrawMainTextStart_X+DrawTextBoxWidth		,(line*DrawTextBoxHeight)+DrawTextBoxHeight+DrawMainTextStart_Y,$ACB069)//漸層色(in Script)
				draw_set_color(c_white) //顏色設定
				draw_set_font(ChooseCuesor) //字體設定(包含大小)
				draw_set_valign(fa_middle) //文字垂直置中
				draw_text(DrawMainTextStart_X * 0.6, textY, ">")
				draw_set_valign(fa_top)
				MainMenuCursor = line
			}
			//選單文字
			draw_set_color(c_white) //顏色設定
			draw_set_font(MenuFont) //字體設定(包含大小)
			draw_set_valign(fa_middle) //文字垂直置中
			draw_text(textX, textY, mainMenuText[gameLanguage,line])
		}
		#endregion
		break
		
	case menuScreen.load:
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		
		//3個方框
		for(var line = 0 ; line < 3 ; line++){
			draw_set_color($ACB069)
			draw_set_alpha(0.7)
			draw_rectangle(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,0)
			draw_set_alpha(1)
			
			draw_set_color($384373)
			draw_rectangle(DrawLoadBoxTitle_X, DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadBoxTitle_X + DrawLoadBoxTitle_W,DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxTitle_H,0)
			
			draw_set_color(c_white)
			draw_set_valign(fa_middle)
			draw_set_font(MenuFont)
			draw_text(DrawLoadBoxTitle_X*1.05 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), LoadTxT[gameLanguage,0]+string(line+1))
			
			draw_set_color(c_white)
			draw_set_halign(fa_middle)
			draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  " + EmptyTxT[gameLanguage,0] + "  ]")
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
		}
		
		break
	case menuScreen.option:
		#region //option繪圖
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		//上左側文字
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			draw_set_font(optionFont)
			draw_text(DrawOptionTextStart_X ,DrawOptionTextStart_Y + DrawOptionTextBoxHeight*line ,optionMenuText[gameLanguage,line])
		}
		//上右側內容
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			Text_X = (DrawOptionContentStart_X+DrawOptionContentEND_X+DrawOptionArrow_W)/2
			Text_Y =  DrawOptionContentStart_Y + DrawOptionContentBoxHeight*line
			switch(line){
				case 0: //解析度
					#region //解析度
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					draw_set_halign(fa_center)
					if(window_get_fullscreen()){
						draw_set_color(c_gray)
						draw_text( Text_X , Text_Y , resolution[3])
						draw_set_color(c_white)
					}else{
						switch(windowsSize){
						case 1:
							draw_text( Text_X , Text_Y , resolution[0])
							break
						case 2:
							draw_text( Text_X , Text_Y , resolution[1])
							break
						case 2.25:
							draw_text( Text_X , Text_Y , resolution[2])
							break
						case 3:
							draw_text( Text_X , Text_Y , resolution[3])
							break
						}
					}
					draw_set_halign(fa_left)
				#endregion
					break
				case 1: //全螢幕
					if(window_get_fullscreen()){ 
						draw_set_color(c_red) //打勾的部分
						draw_line_width((DFSx2 - DFSx1)/4+DFSx1,( DFSy1 + DFSy2 )/2,(DFSx1 + DFSx2)/2,DFSy2,7)
						draw_line_width(DFSx2,DFSy1,(DFSx1 + DFSx2)/2,DFSy2,7)
						draw_set_color(c_white) //方框
						draw_line_width(DFSx1,DFSy1,DFSx2,DFSy1,10)
						draw_line_width(DFSx2,DFSy1,DFSx2,DFSy2,10)
						draw_line_width(DFSx2,DFSy2,DFSx1,DFSy2,10)
						draw_line_width(DFSx1,DFSy2,DFSx1,DFSy1,10)
					}else{//方框
						draw_line_width(DFSx1,DFSy1,DFSx2,DFSy1,10)
						draw_line_width(DFSx2,DFSy1,DFSx2,DFSy2,10)
						draw_line_width(DFSx2,DFSy2,DFSx1,DFSy2,10)
						draw_line_width(DFSx1,DFSy2,DFSx1,DFSy1,10)
					}
					break
				case 2: //語言
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_text( Text_X, Text_Y , LanguageOption[ gameLanguage ])
					draw_set_halign(fa_left)
					break
				case 3: //音樂
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_text( Text_X, Text_Y , string(gameMusic) + "%")
					draw_set_halign(fa_left)
					break
				case 4: //音效
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_text( Text_X, Text_Y , string(gameSFX)+"%")
					draw_set_halign(fa_left)
					break			
			}

		}
		#endregion
		break
}