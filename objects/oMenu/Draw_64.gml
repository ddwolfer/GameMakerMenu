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
			draw_text(textX, textY, mainMenuText[global.gameLanguage,line])
		}
		#endregion
		break
		
	case menuScreen.newgame:
		#region
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		
		//3個方框
		for(var line = 0 ; line < 3 ; line++){
			//存檔方框
			draw_set_color($ACB069)
			draw_set_alpha(0.7)
			draw_rectangle(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,0)
			draw_set_alpha(1)
			//判斷滑鼠位置
			if( ( MX >= LoadStart_X											&& MX <= LoadStart_X + LoadBoxWidth )	&& 
				( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
					
				draw_set_color(c_white)
				draw_rectengle_width(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,4,c_white)
			}
			//標題方框
			draw_set_color($384373)
			draw_rectangle(DrawLoadBoxTitle_X, DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadBoxTitle_X + DrawLoadBoxTitle_W,DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxTitle_H,0)
			//標題文字
			draw_set_color(c_white)
			draw_set_valign(fa_middle)
			draw_set_font(MenuFont)
			draw_text(DrawLoadBoxTitle_X*1.05 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), LoadTxT[global.gameLanguage,0]+string(line+1))
			//空存檔
			filename = "savefile0" + string(line+1) + ".sav"
			if(file_exists(filename)){
				draw_set_color(c_white)
				draw_set_halign(fa_middle)
				
				draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  game time : "+ string(saveTime[line]) +"  ]")
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				//畫刪除的方框
				if( ( MX >= deleteStart_X											&& MX <= deleteEnd_X )	&& 
					( MY >= deleteStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= deleteEnd_Y + (line* (LoadBoxHeight+LoadBoxSpace)))  ){
					draw_set_color(c_red)
					draw_rectangle(DrawDeleteStart_X , DrawDeleteStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , DrawDeleteEnd_X , DrawDeleteEnd_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 0)
					draw_set_color(c_white)
				}else{
					draw_set_color($00009B)
					draw_rectangle(DrawDeleteStart_X , DrawDeleteStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , DrawDeleteEnd_X , DrawDeleteEnd_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 0)
					draw_set_color(c_white)
				}
				
				//畫刪除的叉叉
				lineVar = 3
				draw_line_width( DrawDeleteStart_X + (lineVar*global.windowsSize), DrawDeleteStart_Y + (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 
								 DrawDeleteEnd_X - (lineVar*global.windowsSize), DrawDeleteEnd_Y - (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 5 )
				draw_line_width( DrawDeleteEnd_X - (lineVar*global.windowsSize), DrawDeleteStart_Y + (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 
								 DrawDeleteStart_X + (lineVar*global.windowsSize), DrawDeleteEnd_Y - (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 5 )
			}else{
				draw_set_color(c_white)
				draw_set_halign(fa_middle)
				draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  " + EmptyTxT[global.gameLanguage,0] + "  ]")
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
			}
			
		}
		#endregion
		break
	case menuScreen.load:
		#region
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		
		//3個方框
		for(var line = 0 ; line < 3 ; line++){
			//存檔方框
			draw_set_color($ACB069)
			draw_set_alpha(0.7)
			draw_rectangle(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,0)
			draw_set_alpha(1)
			//判斷滑鼠位置
			if( ( MX >= LoadStart_X											&& MX <= LoadStart_X + LoadBoxWidth )	&& 
				( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
				draw_set_color(c_white)
				draw_rectangle(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,1)
				draw_rectangle(DrawLoadStart_X+1, DrawLoadStart_Y+1 + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth-1,DrawLoadStart_Y-1 + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,1)
				draw_rectangle(DrawLoadStart_X+2, DrawLoadStart_Y+2 + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth-2,DrawLoadStart_Y-2 + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,1)
				draw_rectangle(DrawLoadStart_X+3, DrawLoadStart_Y+3 + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth-3,DrawLoadStart_Y-3 + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,1)
			}
			//標題方框
			draw_set_color($384373)
			draw_rectangle(DrawLoadBoxTitle_X, DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadBoxTitle_X + DrawLoadBoxTitle_W,DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxTitle_H,0)
			//標題文字
			draw_set_color(c_white)
			draw_set_valign(fa_middle)
			draw_set_font(MenuFont)
			draw_text(DrawLoadBoxTitle_X*1.05 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), LoadTxT[global.gameLanguage,0]+string(line+1))
			//空存檔
			filename = "savefile0" + string(line+1) + ".sav"
			if(file_exists(filename)){
				draw_set_color(c_white)
				draw_set_halign(fa_middle)
				draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  game time : "+ string(saveTime[line]) +"  ]")
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				//畫刪除的方框
				if( ( MX >= deleteStart_X											&& MX <= deleteEnd_X )	&& 
					( MY >= deleteStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= deleteEnd_Y + (line* (LoadBoxHeight+LoadBoxSpace)))  ){
					draw_set_color(c_red)
					draw_rectangle(DrawDeleteStart_X , DrawDeleteStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , DrawDeleteEnd_X , DrawDeleteEnd_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 0)
					draw_set_color(c_white)
				}else{
					draw_set_color($00009B)
					draw_rectangle(DrawDeleteStart_X , DrawDeleteStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , DrawDeleteEnd_X , DrawDeleteEnd_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 0)
					draw_set_color(c_white)
				}
				
				//畫刪除的叉叉
				lineVar = 3
				draw_line_width( DrawDeleteStart_X + (lineVar*global.windowsSize), DrawDeleteStart_Y + (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 
								 DrawDeleteEnd_X - (lineVar*global.windowsSize), DrawDeleteEnd_Y - (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 5 )
				draw_line_width( DrawDeleteEnd_X - (lineVar*global.windowsSize), DrawDeleteStart_Y + (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 
								 DrawDeleteStart_X + (lineVar*global.windowsSize), DrawDeleteEnd_Y - (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 5 )
			}else{
				draw_set_color(c_white)
				draw_set_halign(fa_middle)
				draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  " + EmptyTxT[global.gameLanguage,0] + "  ]")
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
			}
			
		}
		#endregion
		break
		
	case menuScreen.option:
		#region //option繪圖
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		//上左側文字
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			draw_set_font(optionFont)
			draw_text(DrawOptionTextStart_X ,DrawOptionTextStart_Y + DrawOptionTextBoxHeight*line ,optionMenuText[global.gameLanguage,line])
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
						switch(global.gameResolution){
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
					draw_text( Text_X, Text_Y , LanguageOption[ global.gameLanguage ])
					draw_set_halign(fa_left)
					break
				case 3: //音樂
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_text( Text_X, Text_Y , string(global.gameMusic) + "%")
					draw_set_halign(fa_left)
					break
				case 4: //音效
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_text( Text_X, Text_Y , string(global.gameSFX)+"%")
					draw_set_halign(fa_left)
					break			
			}
		}
		#endregion
		break
		
	case menuScreen.deleteGame:
		#region//原本的背景
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		
		//3個方框
		for(var line = 0 ; line < 3 ; line++){
			//存檔方框
			draw_set_color($ACB069)
			draw_set_alpha(0.7)
			draw_rectangle(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,0)
			draw_set_alpha(1)
			//判斷滑鼠位置
			if( ( MX >= LoadStart_X											&& MX <= LoadStart_X + LoadBoxWidth )	&& 
				( MY >= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= LoadStart_Y + (line* (LoadBoxHeight+LoadBoxSpace)) + LoadBoxHeight)  ){
					
				draw_set_color(c_white)
				draw_rectengle_width(DrawLoadStart_X, DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadStart_X+DrawLoadBoxWidth,DrawLoadStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight,4,c_white)
			}
			//標題方框
			draw_set_color($384373)
			draw_rectangle(DrawLoadBoxTitle_X, DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), DrawLoadBoxTitle_X + DrawLoadBoxTitle_W,DrawLoadBoxTitle_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxTitle_H,0)
			//標題文字
			draw_set_color(c_white)
			draw_set_valign(fa_middle)
			draw_set_font(MenuFont)
			draw_text(DrawLoadBoxTitle_X*1.05 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), LoadTxT[global.gameLanguage,0]+string(line+1))
			//空存檔
			filename = "savefile0" + string(line+1) + ".sav"
			if(file_exists(filename)){
				draw_set_color(c_white)
				draw_set_halign(fa_middle)
				
				draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  game time : "+ string(saveTime[line]) +"  ]")
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				//畫刪除的方框
				if( ( MX >= deleteStart_X											&& MX <= deleteEnd_X )	&& 
					( MY >= deleteStart_Y + (line* (LoadBoxHeight+LoadBoxSpace))	&& MY <= deleteEnd_Y + (line* (LoadBoxHeight+LoadBoxSpace)))  ){
					draw_set_color(c_red)
					draw_rectangle(DrawDeleteStart_X , DrawDeleteStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , DrawDeleteEnd_X , DrawDeleteEnd_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 0)
					draw_set_color(c_white)
				}else{
					draw_set_color($00009B)
					draw_rectangle(DrawDeleteStart_X , DrawDeleteStart_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , DrawDeleteEnd_X , DrawDeleteEnd_Y + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 0)
					draw_set_color(c_white)
				}
				
				//畫刪除的叉叉
				lineVar = 3
				draw_line_width( DrawDeleteStart_X + (lineVar*global.windowsSize), DrawDeleteStart_Y + (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 
								 DrawDeleteEnd_X - (lineVar*global.windowsSize), DrawDeleteEnd_Y - (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 5 )
				draw_line_width( DrawDeleteEnd_X - (lineVar*global.windowsSize), DrawDeleteStart_Y + (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) , 
								 DrawDeleteStart_X + (lineVar*global.windowsSize), DrawDeleteEnd_Y - (lineVar*global.windowsSize) + (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)), 5 )
			}else{
				draw_set_color(c_white)
				draw_set_halign(fa_middle)
				draw_text(DrawLoadStart_X + DrawLoadBoxWidth/2 , DrawLoadStart_Y+ (line* (DrawLoadBoxHeight+DrawLoadBoxSpace)) + DrawLoadBoxHeight/2, "[  " + EmptyTxT[global.gameLanguage,0] + "  ]")
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
			}
			
		}
		#endregion

		#region //問玩家是否要刪除
		
		//底色
		draw_set_color(c_gray)
		draw_rectangle(DeleteBackgroundX1 , DeleteBackgroundY1 , DeleteBackgroundX2 ,DeleteBackgroundY2 ,0)
		
		//滑鼠判定
		draw_set_color($3F3F3F)
		//是 yes
		if( (MX >= YesBoxX1 && MX <= YesBoxX2) && 
			(MY >= YesBoxY1 && MY <= YesBoxY2 ) ){
			draw_rectangle(DrawYesBoxX1 , DrawYesBoxY1  ,DrawYesBoxX2  , DrawYesBoxY2 ,0)
		}
		
		//否 no
		if( (MX >= NoBoxX1 && MX <= NoBoxX2) && 
			(MY >= NoBoxY1 && MY <= NoBoxY2 ) ){
			draw_rectangle(DrawNoBoxX1 , DrawNoBoxY1  ,DrawNoBoxX2  , DrawNoBoxY2 ,0)
		}
		draw_set_color(c_white)
		
		//文字
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_text(DrawDeleteAlarm_X ,DrawDeleteAlarm_Y, DeleteAlarm[global.gameLanguage , 0])
		draw_text(DrawNoText_X , DrawCheckText_Y , YesOrNo[global.gameLanguage,0])
		draw_text(DrawYesText_X , DrawCheckText_Y , YesOrNo[global.gameLanguage,1])
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		
		#endregion
		break
		
	case menuScreen.loading:
		#region
		oLoading.image_alpha = 1
		/*draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		//draw_text(320 * global.windowsSize,180 * global.windowsSize,"It's loading time YAAAAAAAAAAAAAAAA")
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)*/
		#endregion
		break
}