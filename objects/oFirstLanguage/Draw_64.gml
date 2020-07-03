/// @description Insert description here
// You can write your code in this editor
//抓滑鼠位置 window_mouse_get()會抓Viewport絕對位置 mouse_x會抓RoomXY絕對位置
if(oGame.FreezeMouse){
	var MX = 0
	var MY = 0
}else{
	var MX = mouse_x
	var MY = mouse_y
}


#region //底色
draw_set_color($006479)
draw_rectangle( DrawMainDivX1, DrawMainDivY1, DrawMainDivX2, DrawMainDivY2, 0)
#endregion

#region //標題底色
draw_set_color(c_gray)
draw_rectangle( DrawMainTitleX1, DrawMainTitleY1, DrawMainTitleX2, DrawMainTitleY2, 0)
#endregion

#region //標題
draw_set_font(MenuFont)
draw_set_color(c_black)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_text(DrawMainTitleCenterXY[0],DrawMainTitleCenterXY[1],Title)
#endregion

#region //語言框框
for( var i=0 ; i<LanguageRowNum ; i++ ){
	var BoxY1 = DrawContentDivYMin + (DrawLanguageBoxYSpace * (i+1)) + (DrawLanguageBoxHeight * i)
	var BoxY2 = DrawContentDivYMin + (DrawLanguageBoxYSpace * (i+1)) + (DrawLanguageBoxHeight * (i+1))
	
	draw_set_color(c_olive)
	draw_rectangle(DrawLanguageBoxX1[0],BoxY1,DrawLanguageBoxX2[0],BoxY2,0)
	draw_set_color(c_black)
	var textX = (DrawLanguageBoxX1[0] + DrawLanguageBoxX2[0]) / 2
	var textY = (BoxY1 + BoxY2)/2
	draw_text(textX,textY,languageOptions[i*2])
	if(ChoicePointer == i*2){
		draw_rectengle_width( DrawLanguageBoxX1[0],BoxY1,DrawLanguageBoxX2[0],BoxY2, 4,c_white)
	}
	if( (array_length_1d(languageOptions)-(i*2))/2 >= 1 ){
		draw_set_color(c_olive)
		draw_rectangle(DrawLanguageBoxX1[1],BoxY1,DrawLanguageBoxX2[1],BoxY2,0)
		draw_set_color(c_black)
		var textX = (DrawLanguageBoxX1[1] + DrawLanguageBoxX2[1]) / 2
		var textY = (BoxY1 + BoxY2)/2
		draw_text(textX,textY,languageOptions[i*2+1])
		if(ChoicePointer == i*2+1){
			draw_rectengle_width( DrawLanguageBoxX1[1],BoxY1,DrawLanguageBoxX2[1],BoxY2, 4,c_white)
		}
	}
}
#endregion

#region //退出遊戲
if( ( MX >= quitButtonX1	&& MX <= quitButtonX2 ) && ( MY >= quitButtonY1	&& MY <= quitButtonY2 )  ){
	draw_set_color(c_red)
	draw_rectangle(DrawQuitButtonX1 , DrawQuitButtonY1 , DrawQuitButtonX2 , DrawQuitButtonY2 , 0)
	draw_set_color(c_white)
}else{
	draw_set_color($00009B)
	draw_rectangle(DrawQuitButtonX1 , DrawQuitButtonY1 , DrawQuitButtonX2 , DrawQuitButtonY2 , 0)
	draw_set_color(c_white)
}
draw_line_width( DrawQuitButtonLineX1, DrawQuitButtonLineY1, DrawQuitButtonLineX2 ,DrawQuitButtonLineY2,10)
draw_line_width( DrawQuitButtonLineX2, DrawQuitButtonLineY1, DrawQuitButtonLineX1 ,DrawQuitButtonLineY2,10)

switch(FirstScreen){
	case FirstScreen.main:
	#region

		break
	#endregion
	case FirstScreen.quitGame:
	#region
		//底色
		draw_set_color(c_black)
		draw_set_alpha(0.5)
		draw_rectangle(0,0,1920,1080,0)
		draw_set_alpha(1)
		draw_set_color(c_gray)
		draw_rectangle(quitBackgroundX1 , quitBackgroundY1 , quitBackgroundX2 ,quitBackgroundY2 ,0)
		
		//滑鼠判定
		draw_set_color($3F3F3F)
		//是 yes quitPointer
		if( quitPointer == 0 ){
			draw_rectangle(DrawYesBoxX1, DrawYesBoxY1, DrawYesBoxX2, DrawYesBoxY2 ,0)
		}
		
		//否 no
		if( quitPointer == 1 ){
			draw_rectangle(DrawNoBoxX1, DrawNoBoxY1, DrawNoBoxX2, DrawNoBoxY2 ,0)
		}
		draw_set_color(c_white)
		
		//文字
		draw_set_color(c_white)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		draw_text(quitAlarm_X ,quitAlarm_Y, quitAlarm)
		draw_text(NoText_X , CheckText_Y , YesOrNo[0])
		draw_text(YesText_X , CheckText_Y , YesOrNo[1])
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		break
	#endregion
}
#endregion
