/// @description 介面文字
// You can write your code in this editor

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
		
		break
	case menuScreen.option:
		//上底色
		
		//上左側文字

		//上右側內容
		for(var line = 0 ; line < array_length_1d(optionMenuText) ; line++ ){
			switch(line){
				case 0: //解析度

					break
				case 1: //全螢幕

					
					break
				case 2: //語言

					break
				case 3: //音樂

					break
				case 4: //音效

					break			
			}

		}
		break
}