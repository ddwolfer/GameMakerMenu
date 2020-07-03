/// @description Insert description here
// You can write your code in this editor

getInput()
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
if(oGame.FreezeMouse){
	var MX = 0
	var MY = 0
}else{
	var MX = mouse_x
	var MY = mouse_y
}

switch(IGMenuScreen){
	
	case IGMenuScreen.main:
	#region
		#region 黑色背景
		draw_set_alpha(0.4);
		draw_set_color(c_black);
		draw_rectangle(0,0,640 * global.windowsSize,360* global.windowsSize,false);
		draw_set_alpha(1)
		draw_set_color(c_white)
	#endregion
	//文字
	for( var line = 0 ; line < array_length_1d(IGMainMenuText) ; line++){
		
		draw_set_color(c_white)
		//draw_rectangle(DrawIGmainTextStart_X,DrawIGmainTextStart_Y + ( line * DrawIGmainText_H),DrawIGmainTextSEnd_X,DrawIGmainTextStart_Y + ( (line+1) * DrawIGmainText_H),1)
		if( line == InGameMenuCursor ){
			drawGradualColor( (DrawIGmainTextStart_X + DrawIGmainTextSEnd_X)/2 , DrawIGmainTextStart_Y + ( line * DrawIGmainText_H) , DrawIGmainTextSEnd_X , DrawIGmainTextStart_Y + ( (line+1) * DrawIGmainText_H) , $ACB069)
			drawGradualColor( (DrawIGmainTextStart_X + DrawIGmainTextSEnd_X)/2 , DrawIGmainTextStart_Y + ( line * DrawIGmainText_H) , DrawIGmainTextStart_X , DrawIGmainTextStart_Y + ( (line+1) * DrawIGmainText_H) , $ACB069)
		}

		draw_set_valign(fa_middle)
		draw_set_halign(fa_middle)
		draw_set_color(c_white)
		draw_set_font(MenuFont)
		draw_text(320 * global.windowsSize, 180* global.windowsSize + ((line-1)*DrawIGmainText_H), IGMainMenuText[global.gameLanguage,line])
		draw_set_valign(fa_top)
		draw_set_halign(fa_left)
	}
	#endregion

	break
	
	case IGMenuScreen.option:
		#region
		draw_set_font(optionFont)
		#region 黑色背景
		draw_set_alpha(0.4);
		draw_set_color(c_black)
		draw_rectangle(0,0,640 * global.windowsSize,360* global.windowsSize,false);
		draw_set_alpha(1)
		draw_set_color(c_white)
		#endregion
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, DrawOptionBackground_X , DrawOptionBackground_Y, DrawOptionBackground_W, DrawOptionBackground_H )
		//上左側文字
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			draw_set_valign(fa_center)
			draw_set_font(optionFont)
			draw_text(DrawOptionTextStart_X ,DrawOptionTextStart_Y + DrawOptionTextBoxHeight*line ,optionMenuText[global.gameLanguage,line])
			draw_set_valign(fa_top)
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
					draw_set_valign(fa_center)
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
					draw_set_valign(fa_top)
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
					draw_set_valign(fa_center)
					draw_text( Text_X, Text_Y , LanguageOption[ global.gameLanguage ])
					draw_set_valign(fa_top)
					draw_set_halign(fa_left)
					break
				case 3: //音樂
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_set_valign(fa_center)
					draw_text( Text_X, Text_Y , string(global.gameMusic) + "%")
					draw_set_valign(fa_top)
					draw_set_halign(fa_left)
					break
				case 4: //音效
					draw_sprite_stretched(sMenuArrowLeft,0, DrawOptionContentStart_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_H)
					draw_sprite_stretched(sMenuArrowRight,0, DrawOptionContentEND_X, DrawOptionContentStart_Y*0.85 + DrawOptionContentBoxHeight*line , DrawOptionArrow_W, DrawOptionArrow_W)
					
					draw_set_halign(fa_center)
					draw_set_valign(fa_center)
					draw_text( Text_X, Text_Y , string(global.gameSFX)+"%")
					draw_set_valign(fa_top)
					draw_set_halign(fa_left)
					break			
			}
			if(line == optionCursor){
				optionLineY = DrawOptionContentStart_Y*1.25 + DrawOptionContentBoxHeight*line
				draw_set_color(c_white)
				draw_line_width(optionLineX1,optionLineY,optionLineX2,optionLineY,6)
			}
		}
		#endregion
		
	break
}