/// @description 介面文字
// You can write your code in this editor
switch(menuScreen){
	case menuScreen.main:
		#region main繪圖
		//繪製文字與框
		for(var line = 0 ; line < array_length_1d(mainMenuText) ; line++){
			//抓滑鼠位置 window_mouse_get會抓Camera位置 mouse_x會抓Viewport位置
			var WMX = window_mouse_get_x()
			var WMY = window_mouse_get_y()
			var textY = (line*TextBoxHeight) + TextBoxHeight/2 + MainMenuTextStartPosition_Y
			var textX = MainMenuTextStartPosition_X*1.3
			//畫框 前兩行判斷為滑鼠 第三行判斷為案鍵
			if( ((WMX >= MainMenuTextStartPosition_X && WMX <= MainMenuTextStartPosition_X+TextBoxWidth ) && 
			    (WMY >= (line*TextBoxHeight)+MainMenuTextStartPosition_Y && WMY <= (line*TextBoxHeight)+TextBoxHeight+MainMenuTextStartPosition_Y)) ||
				MainMenuCursor == line){
				//實心 + 標頭
				//畫漸層方塊 x1,y1,x2,y2,color
				drawGradualColor(MainMenuTextStartPosition_X,				(line*TextBoxHeight)+MainMenuTextStartPosition_Y,
							   MainMenuTextStartPosition_X+TextBoxWidth  ,	(line*TextBoxHeight)+TextBoxHeight+MainMenuTextStartPosition_Y,
							   $ACB069)
				draw_set_color(c_white) //顏色設定
				draw_set_font(ChooseCuesor) //字體設定(包含大小)
				draw_set_valign(fa_middle) //文字垂直置中
				draw_text(MainMenuTextStartPosition_X * 0.6, textY, ">")
				draw_set_valign(fa_top)
				MainMenuCursor = line
			}else{
				//空心
				draw_set_alpha(0) //透明度0%
				draw_rectangle(MainMenuTextStartPosition_X,					(line*TextBoxHeight)+MainMenuTextStartPosition_Y, 
							   MainMenuTextStartPosition_X+TextBoxWidth  ,	(line*TextBoxHeight)+TextBoxHeight+MainMenuTextStartPosition_Y,
							   1) 
				draw_set_alpha(1) //透明度100% 不返回的話後面都是0
			}
			draw_set_color(c_white) //顏色設定
			draw_set_font(MenuFont) //字體設定(包含大小)
			draw_set_valign(fa_middle) //文字垂直置中
			draw_text(textX, textY, mainMenuText[gameLanguage,line])
		}
		break
		#endregion
		
	case menuScreen.load:
		
		break
	case menuScreen.option:
		//上底色
		draw_sprite_stretched(MenuOptionBackground, 0, 96*windowsSize , 36*windowsSize, 448*windowsSize, 288*windowsSize)
		//上左側文字
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			draw_set_font(optionFont)
			draw_text(optionTextStart_X ,optionTextStart_Y + optionTextBoxHeight*line ,optionMenuText[gameLanguage,line])
		}
		//上右側內容
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			switch(line){
				case 0:
					draw_sprite_stretched(sMenuArrowLeft,0,optionContentStart_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_sprite_stretched(sMenuArrowRight,0,optionContentEND_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_set_halign(fa_center)
					draw_text( (optionContentStart_X+optionContentEND_X+(22*windowsSize))/2 , optionTextStart_Y + optionTextBoxHeight*line, resolution[windowsSize-1])
					draw_set_halign(fa_left)
					break
				case 1:
					break
				case 2:
					draw_sprite_stretched(sMenuArrowLeft,0,optionContentStart_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_sprite_stretched(sMenuArrowRight,0,optionContentEND_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_set_halign(fa_center)
					draw_text((optionContentStart_X+optionContentEND_X+(22*windowsSize))/2 , optionTextStart_Y + optionTextBoxHeight*line, LanguageOption[0])
					draw_set_halign(fa_left)
					break
				case 3:
					draw_sprite_stretched(sMenuArrowLeft,0,optionContentStart_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_sprite_stretched(sMenuArrowRight,0,optionContentEND_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_set_halign(fa_center)
					draw_text((optionContentStart_X+optionContentEND_X+(22*windowsSize))/2 , optionTextStart_Y + optionTextBoxHeight*line, "10")
					draw_set_halign(fa_left)
					break
				case 4:
					draw_sprite_stretched(sMenuArrowLeft,0,optionContentStart_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_sprite_stretched(sMenuArrowRight,0,optionContentEND_X, optionTextStart_Y*0.85 + optionTextBoxHeight*line ,22*windowsSize,21*windowsSize)
					draw_set_halign(fa_center)
					draw_text((optionContentStart_X+optionContentEND_X+(22*windowsSize))/2 , optionTextStart_Y + optionTextBoxHeight*line, "10")
					draw_set_halign(fa_left)
					break			
			}

		}
		break
}