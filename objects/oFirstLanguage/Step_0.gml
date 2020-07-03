/// @description Insert description here
// You can write your code in this editor
getInput()
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
var MX = window_mouse_get_x()
var MY = window_mouse_get_y()

//show_debug_message(string(MX)+"X軸")
//show_debug_message(string(MY)+"Y軸")
switch(FirstScreen){
	case FirstScreen.main:
		//選語言
		#region
		//鍵盤判定
		if( leftMenu || rightMenu){
			show_debug_message("按下")
			if( (ChoicePointer+1 != array_length_1d(languageOptions)) || array_length_1d(languageOptions)%2 != 1 ){
				if( ChoicePointer % 2 == 0 ){
					show_debug_message("往右")
					ChoicePointer = ChoicePointer + 1
				}
				else if( ChoicePointer % 2 == 1 ){
					show_debug_message("往左")
					ChoicePointer = ChoicePointer - 1 
				}
			}
		}
		if( upMenu ){
			if( ChoicePointer - 2 >= 0 ){
				ChoicePointer = ChoicePointer - 2
			}
		}
		if( downMenu ){
			if(ChoicePointer + 2 < array_length_1d(languageOptions)){
				ChoicePointer += 2
			}
		}
		//鍵盤判定
		if(start){
			if( languageOptionsAble[ChoicePointer]==1 ){
				global.gameLanguage = ChoicePointer
				room_goto(rTitle)
			}
		}
		//滑鼠判定
		for(var i = 0 ; i < array_length_1d(languageOptions) ; i++ ){
			var BoxX1 = LanguageBoxX1[i%2]
			var BoxX2 = LanguageBoxX2[i%2] 
			var BoxY1 = ContentDivYMin + (floor(i/2)+1) * LanguageBoxYSpace + floor(i/2) * LanguageBoxHeight
			var BoxY2 = ContentDivYMin + (floor(i/2)+1) * LanguageBoxYSpace + (floor(i/2)+1) * LanguageBoxHeight
			//show_debug_message( string(i)+" "+string(BoxX1)+" "+string(BoxX2)+" "+string(BoxY1)+" "+string(BoxY2) )
			if(MX >= BoxX1 && MX <= BoxX2 && MY >= BoxY1 && MY <= BoxY2){
				//show_debug_message("---------This is "+string(i))
				ChoicePointer = i
				if(mouseLeftClick){
					if( languageOptionsAble[ChoicePointer]==1 ){
						global.gameLanguage = ChoicePointer
						room_goto(rTitle)
					}
					
				}
			}
		}
		if( (( MX >= quitButtonX1 && MX <= quitButtonX2 ) && ( MY >= quitButtonY1&& MY <= quitButtonY2 ) && mouseLeftClick) || (select) ){
			FirstScreen = FirstScreen.quitGame
		}
		
		#endregion
		break
		
	case FirstScreen.quitGame:
		//退出
		#region
		if( select ){
			FirstScreen = FirstScreen.main
		}
		//是 yes quitPointer
		if( (MX >= YesBoxX1 && MX <= YesBoxX2) && 
			(MY >= YesBoxY1 && MY <= YesBoxY2 ) ){
			quitPointer = 0
		}
		//否 no
		if( (MX >= NoBoxX1 && MX <= NoBoxX2) && 
			(MY >= NoBoxY1 && MY <= NoBoxY2 ) ){
			quitPointer = 1
		}
		//鍵盤判定
		if(leftMenu || rightMenu){
			if(quitPointer == 0) quitPointer=1
			else quitPointer = 0
		}
		//滑鼠判定
		if(mouseLeftClick || start){
			//是 yes
			if( quitPointer == 0 ){
				game_end()
			}
			//否 no
			if( quitPointer == 1 ){
				FirstScreen = FirstScreen.main
			}
		}
		#endregion
		break

}


















